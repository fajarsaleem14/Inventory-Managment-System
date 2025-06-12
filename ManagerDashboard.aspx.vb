Partial Class ManagerDashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Session("Role") <> "Manager" Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
