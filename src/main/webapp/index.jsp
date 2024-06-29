<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Main Menu</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
        }
        .navbar-brand img {
            height: 40px; 
            border-radius:50%;
            margin-right: 10px;
        }
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 5px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        
        .form-floating input[type="text"] {
            border-radius: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            margin: 5px 0;
        }
        ul li a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s;
        }
        ul li a:hover {
            color: #0056b3;
        }
        .section-title {
            margin-top: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }
        
        .container > .row {
            margin-top: 20px;
        }
        
    </style>
</head>
<body>
    <div class="scroll-pane" style="height: auto; overflow-y: auto;">
        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="https://th.bing.com/th/id/OIP.ygxqQLeb-dBNHYr7XaDB6wHaHa?w=187&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo"> <!-- Replace with your logo URL -->
                    Innovative Car Rental
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp"><i class="fas fa-home"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoginPage"><i class="fas fa-lock"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        

        <div class="container animate__animated animate__fadeIn">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">Vehicle Management</h3>
                    <ul>
                        <li><a href="/CarRental/JSP/VehicleManagement/VehicleMakeDetails/VehicleMakeDetails.jsp"><i class="fas fa-car"></i> Vehicle Make Details</a></li>
                        <li><a href="/CarRental/JSP/VehicleManagement/VehicleModelDetails/VehicleModelDetails.jsp"><i class="fas fa-car-side"></i> Vehicle Model Details</a></li>
                        <li><a href="/CarRental/JSP/VehicleManagement/VehicleDetails/VehicleDetails.jsp"><i class="fas fa-car-alt"></i> Vehicle Details</a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">Driver Management</h3>
                    <ul>
                        <li><a href="/CarRental/JSP/DriverManagement/DriverDetails.jsp"><i class="fas fa-id-badge"></i> Driver Details</a></li>
                        <li><a href="/CarRental/JSP/DriverManagement/addDriverDetails.jsp"><i class="fas fa-plus"></i> Add</a></li>
                    </ul>  
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">Location Management</h3>
                    <ul>
                        <li><a href="JSP/Countries/Countries.jsp"><i class="fas fa-globe"></i> Country Details</a></li>
                        <li><a href="JSP/States/States.jsp"><i class="fas fa-map-marker-alt"></i> State Details</a></li>
                        <li><a href="JSP/Cities/Cities.jsp"><i class="fas fa-city"></i> City Details</a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">Reservation Management</h3>
                    <ul>
                        <li><a href="/CarRental/JSP/ReservationManagement/ReservationDetails.jsp"><i class="fas fa-calendar-alt"></i> Reservation Details</a></li>
                        <li><a href="/CarRental/JSP/ReservationManagement/Reservations.jsp?page=Today"><i class="fas fa-calendar-day"></i> View Reservation For Today</a></li>
                        <li><a href="/CarRental/JSP/ReservationManagement/Reservations.jsp?page=Tommorow"><i class="fas fa-calendar-day"></i> View Reservation For Tomorrow</a></li>
                        <li><a href="/CarRental/JSP/ReservationManagement/Reservations.jsp?page=7Days"><i class="fas fa-calendar-week"></i> View Reservation For Next 7 Days</a></li>
                        <li><a href="/CarRental/JSP/ReservationManagement/Reservations.jsp?page=ThisMonth"><i class="fas fa-calendar"></i> View Reservation For This Month</a></li>
                        <li><a href="/CarRental/JSP/ReservationManagement/Reservations.jsp?page=NextMonth"><i class="fas fa-calendar-alt"></i> View Reservation For Next Month</a></li>
                    </ul>  
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">User Management</h3>
                    <ul>
                        <li><a href="/CarRental/JSP/UserManagement/EmployeeDetails/EmployeeDetails.jsp"><i class="fas fa-users"></i> Employee Details</a></li>
                        <li><a href="/CarRental/JSP/UserManagement/CustomerDetails/CustomerDetails.jsp"><i class="fas fa-user"></i> Customer Details</a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-sm-12">
                    <h3 class="section-title">Owner Management</h3>
                    <ul>
                        <li><a href="/CarRental/JSP/OwnerManagement/OwnerDetails.jsp"><i class="fas fa-user-tie"></i> Owner Details</a></li>
                        <li><a href="/CarRental/JSP/OwnerManagement/addOwnerDetails.jsp"><i class="fas fa-plus"></i> Add</a></li>
                    </ul>  
                </div>
            </div>
        </div>
        <br><br><br><br>
    </div>

    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
