Imports System.Data
Imports System.Data.SqlClient

Partial Class ViewProduct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadProducts()
        End If
    End Sub

    Private Sub LoadProducts()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("DB").ConnectionString)
        Dim cmd As New SqlCommand("SELECT ProductID, ProductName, Category, Price FROM Product", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        gvProducts.DataSource = dt
        gvProducts.DataBind()
    End Sub
End Class
