<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    String id = request.getParameter("referenceId");
    CityServices cityService = new CityServices();
    Cities cities = cityService.Find(Integer.parseInt(id));
    request.setAttribute("cities", cities);
    cityService.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit City</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit City</h2>
        <form action="Cities.jsp?action=update" method="post">
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" id="cityName" name="cityName" value="${cities.cityName}" required>
            </div>
            <input type="hidden" name="referenceId" value="${cities.cityNo}">
            <input type="hidden" name="stateNo" value="${cities.state.stateNo }">
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</body>
</html>
