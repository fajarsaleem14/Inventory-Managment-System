<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManageProduct.aspx.vb" Inherits="ManageProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Product</title>
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    
    <style>
        body {
             font-family: 'Poppins', sans-serif;
            background-color: #2b2d42;
            padding: 40px;
        }
        .box {
            background-color: #f5f5f5;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            color: #2b2d42;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            background-color: #2b2d42;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #1c1e30;
        }
        .message {
            color: green;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Manage Product</h2>
            <asp:Label runat="server" Text="Product Name" />
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" />

            <asp:Label runat="server" Text="Price" />
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />

            <asp:Label runat="server" Text="Supplier ID" />
            <asp:TextBox ID="txtSupplierID" runat="server" CssClass="form-control" />

            <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="btn" OnClick="btnAdd_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                CssClass="grid" OnRowEditing="gvProducts_RowEditing"
                OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                OnRowUpdating="gvProducts_RowUpdating"
                OnRowDeleting="gvProducts_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="ProductName" HeaderText="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" />

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
