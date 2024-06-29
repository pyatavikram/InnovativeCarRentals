<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
	VehicleModelDetailsServices vehicleModelService = new VehicleModelDetailsServices();
	VehicleModels model = vehicleModelService.find(id);
	request.setAttribute("model",model);
    vehicleModelService.closeEntityManagerFactory();

    VehicleMakeDetailsServices vehicleMakeService = new VehicleMakeDetailsServices();
    List<VehicleMakes> vehicleMakes = vehicleMakeService.getAll();
    request.setAttribute("vehicleMakes",vehicleMakes);
    vehicleMakeService.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle Model</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Vehicle Model</h2>
        <form action="VehicleModelDetails.jsp?action=update" method="post">
            <div class="form-group">
                <label for="makeSelect">Select Vehicle Make:</label>
                <select class="form-control" id="makeNo" name="makeNo">
                    <c:forEach items="${vehicleMakes}" var="make">
                        <option value="${make.makeNo}">${make.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="modelInput">Enter Vehicle Model:</label>
                <input type="hidden" name="modelNo" id="modelNo" value="${model.modelNo }">
                <input type="text" id="modelInput" name="modelName" class="form-control" placeholder="Enter Model Name" value="${model.name}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Model</button>
        </form>
    </div>
</body>
</html>
