Imports System.Data
Imports System.Data.SqlClient

Partial Class Shipment
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection("Data Source=.;Initial Catalog=MyDB;Integrated Security=True")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadOrders()
            LoadShipments()
        End If
    End Sub

    Private Sub LoadOrders()
        Dim cmd As New SqlCommand("SELECT OrderID FROM Orders", con)
        con.Open()
        ddlOrderID.DataSource = cmd.ExecuteReader()
        ddlOrderID.DataTextField = "OrderID"
        ddlOrderID.DataValueField = "OrderID"
        ddlOrderID.DataBind()
        con.Close()
    End Sub

    Private Sub LoadShipments()
        Dim cmd As New SqlCommand("SELECT * FROM Shipment", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        gvShipments.DataSource = dt
        gvShipments.DataBind()
    End Sub

    Protected Sub btnAddShipment_Click(sender As Object, e As EventArgs)
        Dim cmd As New SqlCommand("INSERT INTO Shipment (ShipmentDate, OrderID) VALUES (@Date, @OrderID)", con)
        cmd.Parameters.AddWithValue("@Date", txtShipmentDate.Text)
        cmd.Parameters.AddWithValue("@OrderID", ddlOrderID.SelectedValue)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        lblMessage.Text = "Shipment added successfully!"
        LoadShipments()
    End Sub

    Protected Sub gvShipments_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim shipmentID As Integer = gvShipments.DataKeys(e.RowIndex).Value
        Dim cmd As New SqlCommand("DELETE FROM Shipment WHERE ShipmentID = @ID", con)
        cmd.Parameters.AddWithValue("@ID", shipmentID)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        lblMessage.Text = "Shipment deleted."
        LoadShipments()
    End Sub

End Class




