<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*, java.time.LocalDate,java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Confirmation Page</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white !important;
        }
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .card {
            margin-bottom: 20px;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #e2e6ea;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Innovative Car Rental</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp"><i class="fas fa-home"></i> HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp?page=Reservations&customerNo=${sessionScope.customer.customerNo }"><i class="fas fa-car"></i> RESERVATIONS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/EditProfile.jsp?customerNo=${sessionScope.customer.customerNo }"><i class="fas fa-user-edit"></i> EDIT PROFILE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/logout.jsp"><i class="fas fa-sign-out-alt"></i> LOGOUT</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
               Order Details - <%= LocalDate.now().format(DateTimeFormatter.ofPattern("EEEE, MMMM d, yyyy")) %>
            </div>
            <div class="card-body">
                <div class="table-responsive" style="height:340px; overflow-y:auto;">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Shipping Status</th>
                                <th>Qty</th>
                                <th>Car Details</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Not yet Shipped</td>
                                <td>1</td>
                                <td>
                                    <span>${sessionScope.Vehicles.vehiclemodels.name}</span><br>
                                    <span>${sessionScope.Vehicles.vehiclemodels.modelNo}</span>
                                </td>
                                <td>${sessionScope.Totalamount}</td>
                            </tr>
                            <!-- Add more rows dynamically as needed -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                Total: ${sessionScope.Totalamount}
            </div>
            <div class="card-body">
                <h4 class="text-right">${sessionScope.Totalamount}</h4>
            </div>
        </div>
    </div>
    
    <footer class="footer">
        <div class="container">
            <p>&copy; Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
