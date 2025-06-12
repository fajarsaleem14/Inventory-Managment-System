<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PlaceOrder.aspx.vb" Inherits="PlaceOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <style>
        :root {
            --primary-color: #2b2d42;
            --secondary-color: #2b2d42;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --error-color: #f72585;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            color: var(--dark-color);
        }

        .order-container {
            max-width: 600px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .order-title {
            color: var(--secondary-color);
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            position: relative;
            text-align: center;
        }

        .order-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-color);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
            outline: none;
        }

        .btn-submit {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            font-family: 'Poppins', sans-serif;
        }

        .btn-submit:hover {
            background: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(72, 149, 239, 0.3);
        }

        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }

        .success-message {
            color: var(--success-color);
            background-color: rgba(76, 201, 240, 0.1);
        }

        .error-message {
            color: var(--error-color);
            background-color: rgba(247, 37, 133, 0.1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .order-container {
            animation: fadeIn 0.6s ease-out forwards;
        }

        @media (max-width: 600px) {
            .order-container {
                padding: 30px 20px;
            }
            
            .order-title {
                font-size: 24px;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="order-container">
        <h1 class="order-title">Place New Order</h1>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="ddlCustomer">Customer</label>
                <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label for="ddlProduct">Product</label>
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label for="txtQuantity">Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn-submit" OnClick="btnPlaceOrder_Click" />
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
        </form>
    </div>
</body>
</html>