<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
    VehicleDetailsServices vehicleDetailsService = new VehicleDetailsServices();
    List<Vehicles> vehicles = vehicleDetailsService.getAll();
    request.setAttribute("vehicles", vehicles);
    vehicleDetailsService.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Countries</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
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
        .form-floating input[type="text"] {
            border-radius: 20px;
        }
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Vehicle Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addVehicleDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">Vehicle Details</a>
            </div>
        </nav>

        <div class="input-group mb-3">
            <input type="text" id="t1" name="t1" class="form-control" placeholder="Search Vehicle Makes" aria-label="Search Vehicle Makes">
            <div class="input-group-append">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
            </div>
        </div>
        <div class="table-responsive" style="height:320px">
            <table class="table table-bordered table-hover" >
                <thead class="thead-dark">
                    <tr>
                        <th>Reg.No</th>
                         <th>Reg.State</th>
                         <th>Type</th>
                         <th>Model</th>
                         <th>Fuel</th>
                         <th>Capacity</th>
                   		 <th>Rate</th>
                   		 <th>Action</th>
                    </tr>
                    
                </thead>
                <tbody>
                    <c:forEach items="${vehicles}" var="c">
                            <tr>
                                <td>${c.registrationNumber}</td>
                                <td>${c.state.stateName}</td>
                                <td>${c.type}</td>
                                <td>${c.vehiclemodels.modelNo}</td>
                                <td>${c.fuel}</td>
                                <td>${c.capacity}</td>
                                <td>${c.dailyRate}</td>
                                <td>
					                <a href="editVehicleMakeDetails.jsp?id=" class="btn btn-sm btn-warning mr-2"><i class="fas fa-edit"></i></a>
					                <a href="VehicleMakeDetails.jsp?id=&action=delete" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
					            </td>
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>


    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
