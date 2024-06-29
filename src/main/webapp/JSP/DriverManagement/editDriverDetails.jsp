<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
    int driverNo = Integer.parseInt(request.getParameter("driverNo"));
    DriversServices service = new DriversServices();
    Drivers driver = service.findDriver(driverNo);

    List<Countries> countries = service.getAllCountries();
    List<Cities> cities = service.getAllCities();
    List<States> states = service.getAllStates();

    request.setAttribute("driver", driver);
    request.setAttribute("countries", countries);
    request.setAttribute("cities", cities);
    request.setAttribute("states", states);

    service.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver Details</title>
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
        .scroll-pane {
            height: 550px;
            overflow-y: auto;
        }
    </style>
</head>
<body>

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

<div class="scroll-pane">

    <form action="DriverDetails.jsp?action=update&" method="post">
        <div class="container">
            <h4 class="text-center font-weight-bold mb-4">Edit Driver Details</h4>
            <hr class="my-4">
			<input type="hidden" name="driverNo" value="${param.driverNo }">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <label for="driverName" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="driverName" name="driverName" value="${driver.name}">
                </div>
                <div class="col-md-6">
                    <label for="licenceNumber" class="form-label">Licence Number:</label>
                    <input type="text" class="form-control" id="licenceNumber" name="licenceNumber" value="${driver.licenceNumber}">
                </div>
            </div>
        </div><br>

        <!-- Address Details -->
        <div class="container">
            <h5 class="text-center font-weight-bold mb-4">Address Details</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-12 form-group">
                    <label for="addressLine1">Address 1:</label>
                    <input type="text" class="form-control" id="addressLine1" name="addressLine1" value="${driver.addressLine1}">
                </div>
                <div class="col-md-12 form-group">
                    <label for="addressLine2">Address 2:</label>
                    <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="${driver.addressLine2}">
                </div>
            </div>
        </div><br>

        <!-- Country, State, City, Pincode -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="country">Country:</label>
                    <select class="form-control" id="country" name="country">
                        <c:forEach items="${countries}" var="country">
                            <option value="${country.countryNo}" <c:if test="${country.countryNo eq driver.country.countryNo}">selected</c:if>>${country.country}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label for="state">State:</label>
                    <select class="form-control" id="state" name="state">
                        <c:forEach items="${states}" var="state">
                            <option value="${state.stateNo}" <c:if test="${state.stateNo eq driver.state.stateNo}">selected</c:if>>${state.stateName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div><br>

        <!-- City and Pincode -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="city">City:</label>
                    <select class="form-control" id="city" name="city">
                        <c:forEach items="${cities}" var="city">
                            <option value="${city.cityNo}" <c:if test="${city.cityNo eq driver.city.cityNo}">selected</c:if>>${city.cityName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label for="pincode">Pincode:</label>
                    <input type="text" class="form-control" id="pincode" name="pincode" value="${driver.pincode}">
                </div>
            </div>
        </div><br>

        <!-- Contact Details -->
		<div class="container">
		    <h5 class="text-center font-weight-bold mb-4">Contact Details</h5>
		    <hr class="my-4"> 
		    <div class="row">
		        <div class="col-md-6 form-group">
		            <label for="phoneNumber">Phone Number :</label>
		            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${driver.phoneNumber}">
		        </div>
		        <div class="col-md-6 form-group">
		            <label for="mobileNumber">Mobile Number:</label>
		            <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="${driver.mobileNumber}">
		        </div>
		    </div>
		</div><br>
		    <div class="container">
		        <h5 class="text-center font-weight-bold mb-4">Bank Details</h5>
		        <hr class="my-4">
		        <div class="row">
		            <div class="col-md-4 form-group">
		                <label for="bankName">Bank :</label>
		                <input type="text" class="form-control" id="bankName" name="bankName" value="${driver.bankName}">
		            </div>
		            <div class="col-md-4 form-group">
		                <label for="bankAccount">Account Number:</label>
		                <input type="text" class="form-control" id="bankAccount" name="bankAccount" value="${driver.bankAccount}">
		            </div>
		            <div class="col-md-4 form-group">
		                <label for="PAN">PAN:</label>
		                <input type="text" class="form-control" id="PAN" name="PAN" value="${driver.PAN}">
		            </div>
		        </div>
		    </div><br>
		
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
		                <button type="submit" class="btn btn-primary">Save</button>
		                <button type="reset" class="btn btn-primary">Clear</button>
		            </div>
		        </div>
		    </div>
		</form>
