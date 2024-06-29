<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    String id = request.getParameter("id");
    VehicleMakeDetailsServices vehicleMakesService = new VehicleMakeDetailsServices();
    VehicleMakes vehicleMakes = vehicleMakesService.Find(Integer.parseInt(id));
    request.setAttribute("vehicleMakes", vehicleMakes);
    vehicleMakesService.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle Make Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Vehicle Make Details</h2>
        <form action="VehicleMakeDetails.jsp?action=update" method="post">
            <div class="form-group">
                <label for="vehicleMake">Vehicle Make:</label>
                <input type="text" class="form-control" id="vehicleMake" name="vehicleMake" value="${vehicleMakes.name}" required>
            </div>
            <input type="hidden" name="id" value="${vehicleMakes.makeNo}">
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</body>
</html>
