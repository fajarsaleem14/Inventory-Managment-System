<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PriceUpdate.aspx.vb" Inherits="PriceUpdate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Product Price</title>
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    
    <style>
        body {
            background-color: #2c2e48;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .form-box {
            background-color: #f1f1f1;
            width: 400px;
            margin: 60px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #2c2e48;
            margin-bottom: 25px;
            position: relative;
        }

        h2::after {
            content: '';
            width: 40px;
            height: 3px;
            background-color: #4a90e2;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn {
            background-color: #2c2e48;
            color: #fff;
            font-weight: bold;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #1f2033;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: #27ae60;
            font-weight: 600;
        }

        .prev-price {
            color: #1f78d1;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-box">
            <h2>Update Product Price</h2>

            <div class="form-group">
                <label for="ddlProduct">Product</label>
                <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" />
            </div>

            <div class="form-group">
                <label>Previous Price</label>
                <asp:Label ID="lblPreviousPrice" runat="server" Text="-" CssClass="prev-price" />
            </div>

            <div class="form-group">
                <label for="txtNewPrice">New Price</label>
                <asp:TextBox ID="txtNewPrice" runat="server" placeholder="Enter new price" CssClass="form-control" />
            </div>

            <asp:Button ID="btnUpdatePrice" runat="server" Text="Update Price" CssClass="btn" OnClick="btnUpdatePrice_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
