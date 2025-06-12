<%@ Page Language="vb" AutoEventWireup="false" CodeFile="AdminDashboard.aspx.vb" Inherits="AdminDashboard" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --sidebar-bg: #2b2d42;
            --sidebar-text: #edf2f4;
            --sidebar-hover: #ef233c;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: var(--dark-color);
            min-height: 100vh;
            display: grid;
            grid-template-columns: 250px 1fr;
        }

        .sidebar {
            background-color: var(--sidebar-bg);
            color: var(--sidebar-text);
            padding: 2rem 1rem;
            height: 100vh;
            position: sticky;
            top: 0;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }

        .main-content {
            padding: 2rem;
        }

        .dashboard-header {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--accent-color);
        }

        .dashboard-header h2 {
            color: var(--secondary-color);
            font-size: 2rem;
            margin: 0;
        }

        .welcome-text {
            color: #6c757d;
            font-weight: 300;
            margin-top: 0.5rem;
        }

        .dashboard-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .dashboard-menu li {
            margin-bottom: 0.5rem;
        }

        .dashboard-menu a {
            display: block;
            color: var(--sidebar-text);
            text-decoration: none;
            padding: 0.8rem 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .dashboard-menu a:hover {
            background-color: var(--sidebar-hover);
            transform: translateX(5px);
        }

        .dashboard-menu a::before {
            content: "→";
            margin-right: 10px;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .dashboard-menu a:hover::before {
            opacity: 1;
            margin-right: 15px;
        }

     
        @media (max-width: 768px) {
            body {
                grid-template-columns: 1fr;
            }
            
            .sidebar {
                height: auto;
                position: relative;
            }
            
            .dashboard-menu {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 0.5rem;
            }
            
            .dashboard-menu a:hover {
                transform: none;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <ul class="dashboard-menu">
            <li><a href="ManageProduct.aspx">Manage Product</a></li>
            <li><a href="PlaceOrder.aspx">Place Order</a></li>
            <li><a href="Shipment.aspx">Manage Shipment</a></li>
            <li><a href="PriceUpdate.aspx">Update Price</a></li>
            <li><a href="ViewProduct.aspx">View Products</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="dashboard-header">
            <h2>Welcome, Admin!</h2>
            <p class="welcome-text">Manage your store efficiently</p>
        </div>

        
        </div>
  
</body>
</html>