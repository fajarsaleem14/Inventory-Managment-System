Imports System.Data
Imports System.Data.SqlClient

Partial Class ManageProduct
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=.;Initial Catalog=MyDB;Integrated Security=True")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadProducts()
        End If
    End Sub

    Protected Sub LoadProducts()
        Dim cmd As New SqlCommand("SELECT * FROM Product", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        gvProducts.DataSource = dt
        gvProducts.DataBind()
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Try
            Dim cmd As New SqlCommand("INSERT INTO Product (ProductName, Price, SupplierID) VALUES (@Name, @Price, @SupplierID)", con)
            cmd.Parameters.AddWithValue("@Name", txtProductName.Text)
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text)
            cmd.Parameters.AddWithValue("@SupplierID", txtSupplierID.Text)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()

            lblMessage.Text = "Product added successfully!"
            LoadProducts()

            txtProductName.Text = ""
            txtPrice.Text = ""
            txtSupplierID.Text = ""
        Catch ex As Exception
            lblMessage.Text = "Error: " & ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub gvProducts_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvProducts.EditIndex = e.NewEditIndex
        LoadProducts()
    End Sub

    Protected Sub gvProducts_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvProducts.EditIndex = -1
        LoadProducts()
    End Sub

    Protected Sub gvProducts_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim productID As Integer = Convert.ToInt32(gvProducts.DataKeys(e.RowIndex).Value)
        Dim name As String = CType(gvProducts.Rows(e.RowIndex).Cells(1).Controls(0), TextBox).Text
        Dim price As String = CType(gvProducts.Rows(e.RowIndex).Cells(2).Controls(0), TextBox).Text
        Dim supplierID As String = CType(gvProducts.Rows(e.RowIndex).Cells(3).Controls(0), TextBox).Text

        Dim cmd As New SqlCommand("UPDATE Product SET ProductName=@Name, Price=@Price, SupplierID=@SupplierID WHERE ProductID=@ID", con)
        cmd.Parameters.AddWithValue("@Name", name)
        cmd.Parameters.AddWithValue("@Price", price)
        cmd.Parameters.AddWithValue("@SupplierID", supplierID)
        cmd.Parameters.AddWithValue("@ID", productID)

        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        gvProducts.EditIndex = -1
        LoadProducts()
    End Sub

    Protected Sub gvProducts_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim productID As Integer = Convert.ToInt32(gvProducts.DataKeys(e.RowIndex).Value)

        Dim cmd As New SqlCommand("DELETE FROM Product WHERE ProductID=@ID", con)
        cmd.Parameters.AddWithValue("@ID", productID)

        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        LoadProducts()
    End Sub
End Class
