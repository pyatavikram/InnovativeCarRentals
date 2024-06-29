<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    String id = request.getParameter("referenceId");
    StateServices stateService = new StateServices();
    States state = stateService.Find(Integer.parseInt(id));
    request.setAttribute("state", state);
    stateService.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit State</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit State</h2>
        <form action="States.jsp?action=update" method="post">
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" class="form-control" id="stateName" name="stateName" value="${state.stateName}" required>
            </div>
            <input type="hidden" name="referenceId" value="${state.stateNo}">
            <input type="hidden" name="countryid" value="${state.country.countryNo}">
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</body>
</html>
