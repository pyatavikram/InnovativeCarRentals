<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
	if(request.getParameter("btn")!=null)
	{
	    if (request.getParameter("btn").equals("add"))
	    {
	        VehicleModels newVehicleModel = new VehicleModels();
	        newVehicleModel.setName(request.getParameter("modelInput"));
	        
	        VehicleMakeDetailsServices service=new VehicleMakeDetailsServices();
	        VehicleMakes temp=service.Find(Integer.parseInt(request.getParameter("vehicleMakeNo")));
	        newVehicleModel.setVehicleMakes(temp);
	        new VehicleModelDetailsServices().addVehicleModel(newVehicleModel);
	        response.sendRedirect("VehicleModelDetails.jsp");
	    }
	}
	else
	{
		VehicleMakeDetailsServices modelService = new VehicleMakeDetailsServices();
		List<VehicleMakes> vehicleMakes = modelService.getAll();
		request.setAttribute("vehicleMakes", vehicleMakes);
		modelService.closeEntityManagerFactory();
	
	}
	
	
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle Model</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                        <a class="nav-link" href="VehicleModelDetails.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addVehicleModelDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Add Vehicle Model</h2>
        <form action="?btn=add" method="post">
            <div class="form-group">
                <label for="makeSelect">Select Vehicle Make:</label>
                <select class="form-control" id="vehicleMakeNo" name="vehicleMakeNo">
                    <c:forEach items="${vehicleMakes}" var="make">
                        <option value="${make.makeNo}">${make.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="modelInput">Enter Vehicle Model:</label>
                <input type="text" id="modelInput" name="modelInput" class="form-control" placeholder="Enter Model Name" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Model</button>
        </form>
    </div>
    
    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
