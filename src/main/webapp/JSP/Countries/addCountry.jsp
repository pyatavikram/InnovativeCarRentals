<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Countries</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
    	.navbar {
            background-color: #007bff;
        }
        .footer {
            background-color: #1a1a1a;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.5);
        }
        /* Additional styles can be added here */
    </style>
    <script>
        function clearTextField() {
            document.getElementById("countryInput").value = "";
        }
    </script>
</head>
<body>
<c:if test="${param.btn == 'add'}">
    <jsp:useBean id="country" class="com.iss.models.Countries" scope="request">
        <jsp:setProperty name="country" property="country" value="${param.countryInput}" />
    </jsp:useBean>

    <%
        CountryServices countryService = new CountryServices();
        countryService.addCountry(country);
    %>
</c:if>

	<nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Location Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Countries.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addCountry.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>



<div class="mb-3 mt-3" style="text-align:center">
    <label for="countryInput" class="form-label"> <h4>Add Country Details</h4></label>
</div>

<form action="?btn=add" method="post">
    <div class="container" style="text-align:center">
        <div class="form-floating mb-3 mt-3">
            <input type="text" id="countryInput" name="countryInput" placeholder="Add Country" class="form-control">
            <div class="d-grid mt-3">
                <input type="submit" class="btn btn-primary btn-block" value="Add">
                <button type="button" class="btn btn-primary btn-block" onclick="clearTextField()">Clear</button>
            </div>
        </div>
    </div>
</form>

<div class="footer">
    <p>Copyright © Innovative Car Rental System. All Rights Reserved</p>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
