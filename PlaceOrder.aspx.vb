Imports System.Data
Imports System.Data.SqlClient

Partial Class PlaceOrder
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadCustomers()
            LoadProducts()
        End If
    End Sub

    Private Sub LoadCustomers()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("DB").ConnectionString)
        Dim cmd As New SqlCommand("SELECT CustomerID, CustomerName FROM Customer", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        ddlCustomer.DataSource = dt
        ddlCustomer.DataTextField = "CustomerName"
        ddlCustomer.DataValueField = "CustomerID"
        ddlCustomer.DataBind()
    End Sub

    Private Sub LoadProducts()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("DB").ConnectionString)
        Dim cmd As New SqlCommand("SELECT ProductID, ProductName FROM Product", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        ddlProduct.DataSource = dt
        ddlProduct.DataTextField = "ProductName"
        ddlProduct.DataValueField = "ProductID"
        ddlProduct.DataBind()
    End Sub

    Protected Sub btnPlaceOrder_Click(sender As Object, e As EventArgs)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("DB").ConnectionString)
        con.Open()

        Dim customerID As Integer = Convert.ToInt32(ddlCustomer.SelectedValue)
        Dim productID As Integer = Convert.ToInt32(ddlProduct.SelectedValue)
        Dim quantity As Integer = Convert.ToInt32(txtQuantity.Text)

        Dim cmdPrice As New SqlCommand("SELECT Price, ProductName FROM Product WHERE ProductID = @pid", con)
        cmdPrice.Parameters.AddWithValue("@pid", productID)
        Dim reader = cmdPrice.ExecuteReader()
        reader.Read()
        Dim price As Decimal = reader("Price")
        Dim name As String = reader("ProductName").ToString()
        reader.Close()

        Dim totalCost As Decimal = price * quantity

        Dim cmdOrder As New SqlCommand("INSERT INTO Orders (CustomerID, TotalCost) OUTPUT INSERTED.OrderID VALUES (@cid, @total)", con)
        cmdOrder.Parameters.AddWithValue("@cid", customerID)
        cmdOrder.Parameters.AddWithValue("@total", totalCost)
        Dim orderID As Integer = cmdOrder.ExecuteScalar()

        Dim cmdDetail As New SqlCommand("INSERT INTO OrderDetails (OrderID, ProductID, ItemName, ItemQuantity, ItemPrice) VALUES (@oid, @pid, @name, @qty, @price)", con)
        cmdDetail.Parameters.AddWithValue("@oid", orderID)
        cmdDetail.Parameters.AddWithValue("@pid", productID)
        cmdDetail.Parameters.AddWithValue("@name", name)
        cmdDetail.Parameters.AddWithValue("@qty", quantity)
        cmdDetail.Parameters.AddWithValue("@price", price)
        cmdDetail.ExecuteNonQuery()

        lblMessage.Text = "Order placed successfully!"
        lblMessage.CssClass = "message success-message"
        lblMessage.Visible = True
        con.Close()
    End Sub
End Class