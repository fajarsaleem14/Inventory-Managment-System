<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewProduct.aspx.vb" Inherits="ViewProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Products</title>
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

        .product-container {
            max-width: 1200px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .product-title {
            color: var(--secondary-color);
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            position: relative;
            text-align: center;
        }

        .product-title::after {
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

        /* GridView Styling */
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid-view th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 500;
        }

        .grid-view td {
            padding: 10px 15px;
            border-bottom: 1px solid #e9ecef;
        }

        .grid-view tr:nth-child(even) {
            background-color: rgba(72, 149, 239, 0.05);
        }

        .grid-view tr:hover {
            background-color: rgba(72, 149, 239, 0.1);
        }

        .stock-high {
            color: var(--success-color);
            font-weight: 500;
        }

        .stock-low {
            color: var(--error-color);
            font-weight: 500;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .product-container {
            animation: fadeIn 0.6s ease-out forwards;
        }

        @media (max-width: 768px) {
            .product-container {
                padding: 30px 20px;
            }
            
            .product-title {
                font-size: 24px;
                margin-bottom: 20px;
            }
            
            .grid-view {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <div class="product-container">
        <h1 class="product-title">Product Inventory</h1>
        <form id="form1" runat="server">
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                CssClass="grid-view" HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row"
                AlternatingRowStyle-CssClass="grid-alt-row">
                <Columns>
    <asp:BoundField DataField="ProductID" HeaderText="ID" ItemStyle-Width="80px" />
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
    <asp:BoundField DataField="Category" HeaderText="Category" />
    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" 
        ItemStyle-HorizontalAlign="Right" />
</Columns>

            </asp:GridView>
        </form>
    </div>
</body>
</html>