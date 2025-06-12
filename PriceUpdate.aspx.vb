Imports System.Data.SqlClient

Partial Class PriceUpdate
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=.;Initial Catalog=MyDB;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadProducts()
        End If
    End Sub

    Private Sub LoadProducts()
        Dim cmd As New SqlCommand("SELECT ProductID, ProductName FROM Product", con)
        con.Open()
        ddlProduct.DataSource = cmd.ExecuteReader()
        ddlProduct.DataTextField = "ProductName"
        ddlProduct.DataValueField = "ProductID"
        ddlProduct.DataBind()
        con.Close()
    End Sub

    Protected Sub ddlProduct_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim cmd As New SqlCommand("SELECT Price FROM Product WHERE ProductID = @ProductID", con)
        cmd.Parameters.AddWithValue("@ProductID", ddlProduct.SelectedValue)
        con.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.Read() Then
            lblPreviousPrice.Text = rdr("Price").ToString()
        End If
        con.Close()
    End Sub

    Protected Sub btnUpdatePrice_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim cmd As New SqlCommand("UPDATE Product SET Price = @Price WHERE ProductID = @ProductID", con)
        cmd.Parameters.AddWithValue("@Price", txtNewPrice.Text)
        cmd.Parameters.AddWithValue("@ProductID", ddlProduct.SelectedValue)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        lblMessage.Text = "Price updated successfully."
        ddlProduct_SelectedIndexChanged(Nothing, Nothing)
    End Sub
End Class
