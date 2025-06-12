<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Shipment.aspx.vb" Inherits="Shipment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Shipments</title>
     <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    

    <style>
         body {
      font-family: 'Poppins', sans-serif;
     background-color: #2b2d42;
     padding: 40px;
 }
        .main-box {
            background-color: #f4f4f4;
            padding: 30px;
            max-width: 600px;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            background-color: #2b2d42;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #1c1e30;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-box">
            <h2 style="text-align: center;">Manage Shipments</h2>

            <div class="form-group">
                <label>Shipment Date:</label>
                <asp:TextBox ID="txtShipmentDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Order ID:</label>
                <asp:DropDownList ID="ddlOrderID" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <asp:Button ID="btnAddShipment" runat="server" Text="Add Shipment" CssClass="btn" OnClick="btnAddShipment_Click" />
            <br /><br />

            <asp:GridView ID="gvShipments" runat="server" AutoGenerateColumns="False" CssClass="form-control" OnRowDeleting="gvShipments_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ShipmentID" HeaderText="Shipment ID" ReadOnly="True" />
                    <asp:BoundField DataField="ShipmentDate" HeaderText="Date" />
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
