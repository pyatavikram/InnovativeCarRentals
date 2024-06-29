<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%

	CountryServices service=new CountryServices();
	List<Countries> list=service.getAll();

	request.setAttribute("countries",list);
	
%>

<!DOCTYPE html>
<html>
<head>
    <title>States</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
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
        .navbar {
            background-color: #007bff;
        }
    </style>
    <script>
        function clearTextField() {
            document.getElementById("stateInput").value = "";
        }
    </script>
</head>
<body>
		<c:if test="${param.btn == 'add'}">
				    <jsp:useBean id="states" class="com.iss.models.States" scope="request">
				    	<%
				    		int id=Integer.parseInt(request.getParameter("countryNo"));
				    		CountryServices services=new CountryServices();
				    		Countries country=services.Find(id);
				    		states.setCountry(country);
				    	%>
				    	
				        <jsp:setProperty name="states" property="stateName" value="${param.stateInput}" />
				    </jsp:useBean>
				
				    <%-- Instantiate the service and add the country --%>
				    <%
				        StateServices stateServices = new StateServices();
				   		 stateServices.addState(states);
				    %>
		</c:if>
<nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Location Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="States.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addState.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>





		<div class="container">
        <h2 style="text-align:center">State Details</h2>
        
        <form action="?btn=add" method="post">
            <div class="form-group">
                <label for="stateSelect">Country:</label>
                <select class="form-control" id="stateSelect" name="countryNo">
                    <option value="">-- Please Select --</option>
                    <c:forEach items="${countries}" var="c">
                        <option value="${c.countryNo}">${c.country}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="stateInput">State:</label>
                <input type="text" id="stateInput" name="stateInput" class="form-control" placeholder="Add State">
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Save">
                <button type="button" class="btn btn-secondary" onclick="clearTextField()">Clear</button>
            </div>
        </form>
    </div>

<div class="footer">
    <p>Copyright © Innovative Car Rental System. All Rights Reserved</p>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
