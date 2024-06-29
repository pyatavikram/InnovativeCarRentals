<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
		DriversServices service = new DriversServices();
		
		List<Countries> countries = service.getAllCountries();
		request.setAttribute("countries", countries);
		
		List<Cities> cities = service.getAllCities();
		request.setAttribute("cities", cities);
		
		List<States> states = service.getAllStates();
		request.setAttribute("states", states);
		
		service.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Details</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

<c:if test="${param.btn=='add'}">
	
        <jsp:useBean id="driver" class="com.iss.models.Drivers" scope="request">
            <jsp:setProperty name="driver" property="name" value="${param.driverName}" />
            <jsp:setProperty name="driver" property="licenceNumber" value="${param.licenceNumber}" />
            <jsp:setProperty name="driver" property="addressLine1" value="${param.addressLine1}" />
            <jsp:setProperty name="driver" property="addressLine2" value="${param.addressLine2}" />
           
            <jsp:setProperty name="driver" property="pincode" value="${param.pincode}" />
            <jsp:setProperty name="driver" property="phoneNumber" value="${param.phoneNumber}" />
            <jsp:setProperty name="driver" property="mobileNumber" value="${param.mobileNumber}" />
            <jsp:setProperty name="driver" property="bankName" value="${param.bankName}" />
            <jsp:setProperty name='driver' property="PAN" value="${param.PAN}"/>
            <jsp:setProperty name="driver" property="bankAccount" value="${param.bankAccount}" />
        </jsp:useBean>
        
        <%
	        DriversServices services = new DriversServices();
	
	        if (request.getParameter("state") != null)
	        {
	            States state = services.findState(Integer.parseInt(request.getParameter("state")));
	            driver.setState(state);
	        }
	
	        if (request.getParameter("city") != null )
	        {
	            Cities city = services.findCity(Integer.parseInt(request.getParameter("city")));
	            driver.setCity(city);
	        }
	
	        if (request.getParameter("country") != null) {
	            Countries country = services.findCountry(Integer.parseInt(request.getParameter("country")));
	            driver.setCountry(country);
	        }
	
	        services.addDriver(driver);
	
	        service.close();

		%>

        
    </c:if>

<nav class="navbar navbar-expand-sm navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Driver Management</a>
        <div class="navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addDriverDetails.jsp"><i class="fas fa-plus"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav><br>

<div class="scroll-pane" style="height: 550px; overflow-y: auto;">

	<form action="addDriverDetails.jsp?btn=add" method="post">
    <div class="container">
        <h4 class="text-center font-weight-bold mb-4">Driver Details</h4>
        <hr class="my-4">

        <div class="row align-items-center">
            <div class="col-md-6">
                <label for="imageFile" class="form-label">Name:</label>
                <input type="text" class="form-control" id="regNo" name="driverName" value="${(param.driverName!='null')?param.driverName :'' }">
            </div>
            <div class="col-md-6">
                <label for="imageFile" class="form-label">Licence Number:</label>
                <input type="text" class="form-control" id="regNo" name="licenceNumber" value="${(param.licenceNumber!='null')?param.licenceNumber :'' }">
            </div>
        </div>
    </div><br>

    <div class="container">
        <h5 class="text-center font-weight-bold mb-4">Address Details</h5>
        <hr class="my-4">
        <div class="row">
            <div class="col-md-12 form-group">
                <label for="owner">Address 1:</label>
                <input type="text" class="form-control" id="address" name="addressLine1" value="${(param.addressLine1!='null')?param.addressLine1 :'' }">
            </div>
            <div class="col-md-12 form-group">
                <label for="owner">Address 2:</label>
                <input type="text" class="form-control" id="address" name="addressLine2" value="${(param.addressLine2!='null')?param.addressLine2 :'' }">
            </div>
        </div>
    </div><br>

    <div class="container">
	    <div class="row">
	        <div class="col-md-6 form-group">
	            <label for="country">Country:</label>
	            <select class="form-control" id="country" name="country">
	                <option value="">Select a country</option>
	                <c:forEach items="${countries}" var="c">
	                    <option value="${c.countryNo}" <c:if test="${param.country eq c.countryNo}">selected</c:if>>${c.country}</option>
	                </c:forEach>
	            </select>
	        </div>
	        <div class="col-md-6 form-group">
	            <label for="state">State:</label>
	            <select class="form-control" id="state" name="state">
	                <option value="">Select a state</option>
	                <c:forEach items="${states}" var="s">
	                    <option value="${s.stateNo}" <c:if test="${param.state eq s.stateNo}">selected</c:if>>${s.stateName}</option>
	                </c:forEach>
	            </select>
	        </div>
	    </div>
	</div><br>
	
	<div class="container">
	    <div class="row">
	        <div class="col-md-6 form-group">
	            <label for="city">City:</label>
	            <select class="form-control" id="city" name="city">
	                <option value="">Select a city</option>
	                <c:forEach items="${cities}" var="ci">
	                    <option value="${ci.cityNo}" <c:if test="${param.city eq ci.cityNo}">selected</c:if>>${ci.cityName}</option>
	                </c:forEach>
	            </select>
	        </div>
	        <div class="col-md-6 form-group">
	            <label for="pincode">Pincode:</label>
	            <input type="text" class="form-control" id="pincode" name="pincode" value="${(param.pincode!='null')?param.pincode :'' }">
	        </div>
	    </div>
	</div><br>


    <div class="container">
        <h5 class="text-center font-weight-bold mb-4">Contact Details</h5>
        <hr class="my-4"> 
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="owner">Phone Number :</label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
            </div>
            <div class="col-md-6 form-group">
                <label for="owner">Mobile Number:</label>
                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber">
            </div>
        </div>
    </div><br>

    <div class="container">
        <h5 class="text-center font-weight-bold mb-4">Bank Details</h5>
        <hr class="my-4">
        <div class="row">
            <div class="col-md-4 form-group">
                <label for="owner">Bank :</label>
                <input type="text" class="form-control" id="bankName" name="bankName">
            </div>
            <div class="col-md-4 form-group">
                <label for="owner">Account Number:</label>
                <input type="text" class="form-control" id="bankAccount" name="bankAccount">
            </div>
            <div class="col-md-4 form-group">
                <label for="owner">PAN:</label>
                <input type="text" class="form-control" id="pan" name="PAN">
            </div>
        </div>
    </div><br>
    
	    <div class="container ">
	        <div class="row">
	            <div class="col-md-12">
	                <button type="submit" class="btn btn-primary">Save</button>
	                <button type="reset" class="btn btn-primary">Clear</button>
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
</body>
</html>
        