<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
	if(request.getParameter("btn")!=null)
	{
	    if (request.getParameter("btn").equals("add"))
	    {
	        String vehicleMake = request.getParameter("vehicleMake");
	        VehicleMakes newVehicleMake = new VehicleMakes();
	        newVehicleMake.setName(vehicleMake);
	        new VehicleMakeDetailsServices().addVehicleMakes(newVehicleMake);
	        response.sendRedirect("VehicleMakeDetails.jsp");
	    }
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle Make Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                        <a class="nav-link" href="VehicleMakeDetails.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addVehicleMakeDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2>Add Vehicle Make Details</h2>
        <form action="?btn=add" method="post">
            <div class="form-group">
                <label for="vehicleMake">Vehicle Make:</label>
                <input type="text" class="form-control" id="vehicleMake" name="vehicleMake" placeholder="Enter Vehicle Make" required>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
    
    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>
    
</body>
</html>
