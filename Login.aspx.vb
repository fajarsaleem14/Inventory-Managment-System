Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim rand As New Random()
            Dim num1 As Integer = rand.Next(1, 10)
            Dim num2 As Integer = rand.Next(1, 10)
            lblCaptchaQuestion.Text = num1 & " + " & num2 & " = ?"
            Session("CaptchaAnswer") = (num1 + num2).ToString()
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim conStr As String = ConfigurationManager.ConnectionStrings("DB").ConnectionString
        Using con As New SqlConnection(conStr)
            Dim cmd As New SqlCommand("SELECT Role FROM Users WHERE Username=@u AND Password=@p", con)
            cmd.Parameters.AddWithValue("@u", txtUsername.Text.Trim())
            cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim())
            If txtCaptchaAnswer.Text.Trim() <> Session("CaptchaAnswer").ToString() Then
                lblMessage.Text = "Incorrect CAPTCHA answer. Please try again."
                lblMessage.Visible = True
                Return
            End If

            con.Open()
            Dim role = cmd.ExecuteScalar()

            If role IsNot Nothing Then
                Session("Username") = txtUsername.Text.Trim()
                Session("Role") = role.ToString()

                If role.ToString() = "Admin" Then
                    Response.Redirect("AdminDashboard.aspx")
                ElseIf role.ToString() = "Manager" Then
                    Response.Redirect("ManagerDashboard.aspx")
                ElseIf role.ToString() = "Viewer" Then
                    Response.Redirect("ViewerDashboard.aspx")
                End If
            Else
                lblMessage.Text = "Invalid username or password"
                lblMessage.Visible = True
            End If
        End Using
    End Sub
End Class