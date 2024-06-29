<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>


<%
	OwnersServices service = new OwnersServices();
	
	List<Countries> countries = service.getAllCountries();
	request.setAttribute("countries", countries);
	
	List<Cities> cities = service.getAllCities();
	request.setAttribute("cities", cities);
	
	List<States> states = service.getAllStates();
	request.setAttribute("states", states);
	
	service.close();

    int ownerNo = Integer.parseInt(request.getParameter("ownerNo"));
    Owners owner = service.findOwner(ownerNo);
    request.setAttribute("owner", owner);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Owner Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <a class="navbar-brand" href="#">Owner Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="OwnerDetails.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addOwnerDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav><br>

    <div class="scroll-pane" style="height: 550px; overflow-y: auto;">
        <form action="OwnerDetails.jsp" method="post">
            <div class="container">
                <h4 class="text-center font-weight-bold mb-4">Edit Owner Details</h4>
                <hr class="my-4">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="ownerNo" value="<%= owner.getOwnerNo() %>">

                <div class="row align-items-center">
                    <div class="col-md-6">
                        <label for="ownerName" class="form-label">Name:</label>
                        <input type="text" class="form-control" id="ownerName" name="ownerName" value="<%= owner.getName() %>">
                    </div>
                    
                </div>
            </div><br>

            <!-- Add other input fields for address, contact, and bank details similar to addOwnerDetails.jsp -->

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <a href="OwnerDetails.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
