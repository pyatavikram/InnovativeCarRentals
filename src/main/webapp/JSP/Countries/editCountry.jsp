<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    String id = request.getParameter("id");
    CountryServices countryService = new CountryServices();
    Countries country = countryService.Find(Integer.parseInt(id));
    request.setAttribute("country", country);
    countryService.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Country</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Country</h2>
        <form action="Countries.jsp?action=update" method="post">
            <div class="form-group">
                <label for="country">Country</label>
                <input type="text" class="form-control" id="country" name="country" value="${country.country}" required>
            </div>
            <input type="hidden" name="id" value="${country.countryNo}">
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</body>
</html>
