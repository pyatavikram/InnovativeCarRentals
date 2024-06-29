<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    EmployeeServices service = new EmployeeServices();
    
    List<Countries> countries = service.getAllCountries();
    List<Cities> cities = service.getAllCities();
    List<States> states = service.getAllStates();
    
    request.setAttribute("countries", countries);
    request.setAttribute("cities", cities);
    request.setAttribute("states", states);
    
    int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
    Employees employee = service.findEmployee(employeeNo);
    request.setAttribute("employee",employee);
    service.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Custom CSS */
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
			        <a class="navbar-brand" href="#">User Management</a>
			        <div class="navbar-collapse justify-content-end">
			            <ul class="navbar-nav">
			                <li class="nav-item">
			                    <a class="nav-link" href="EmployeeDetails.jsp"><i class="fas fa-home"></i></a>
			                </li>
			                <li class="nav-item">
			                    <a class="nav-link" href="addVehicleDetails.jsp"><i class="fas fa-plus"></i></a>
			                </li>
			                <li class="nav-item">
			                    <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
			                </li>
			            </ul>
			        </div>
			    </div>
			</nav><br>
			
			
			<div class="scroll-pane" style="height: 550px; overflow-y: auto;">
			    <form action="EmployeeDetails.jsp?action=update&employeeNo=${employee.employeeNo }" method="post">  
			        <div class="container">
			            <h4 class="text-center font-weight-bold mb-4">Edit Employee Details</h4>
			            <hr class="my-4"> <!-- Add a horizontal rule for separation -->
			            
			            <!-- Employee Information -->
			            <div class="row align-items-center">
			                <div class="col-md-4">
			                    <label for="employeeName" class="form-label">Name:</label>
			                </div>
			                <div class="col-md-4">
			                    <label for="employeeType" class="form-label">Employee Type:</label>
			                </div>
			                <div class="col-md-4">
			                    <label for="emailAddress" class="form-label">Email Address:</label>
			                </div>
			            </div>
			        </div>
			        
			        <div class="container">
			            <div class="row">
			                <div class="col-md-4 form-group">
			                    <input type="text" class="form-control" id="employeeName" name="employeeName" value="<c:out value="${employee.name}" />">
			                </div>
			                <div class="col-md-4 form-group">
			                    <select class="form-control" id="employeeType" name="employeeType">
			                        <option value="regular" <c:if test="${employee.employeeType eq 'regular'}">selected</c:if>>Regular</option>
			                        <option value="contract" <c:if test="${employee.employeeType eq 'contract'}">selected</c:if>>Contract</option>
			                    </select>
			                </div>
			                <div class="col-md-4 form-group">
			                    <input type="text" class="form-control" id="emailAddress" name="emailAddress" value="<c:out value="${employee.emailAddress}" />">
			                </div>
			            </div>
			        </div><br>
			        
					<!-- Address Information -->
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Address Information</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-12 form-group">
			            <label for="addressLine1">Address Line 1:</label>
			            <input type="text" class="form-control" id="addressLine1" name="addressLine1" value="<c:out value="${employee.addressLine1}" />">
			        </div>
			        <div class="col-md-12 form-group">
			            <label for="addressLine2">Address Line 2:</label>
			            <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="<c:out value="${employee.addressLine2}" />">
			        </div>
			    </div>
			</div><br>
			
			<!-- Country, State, City -->
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Location Information</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-4 form-group">
			            <label for="country">Country:</label>
			            <select class="form-control" id="country" name="country">
			                <c:forEach items="${countries}" var="country">
			                    <option value="${country.countryNo}" <c:if test="${employee.country.countryNo eq country.countryNo}">selected</c:if>>${country.country}</option>
			                </c:forEach>
			            </select>
			        </div>
			        <div class="col-md-4 form-group">
			            <label for="state">State:</label>
			            <select class="form-control" id="state" name="state">
			                <c:forEach items="${states}" var="state">
			                    <option value="${state.stateNo}" <c:if test="${employee.state.stateNo eq state.stateNo}">selected</c:if>>${state.stateName}</option>
			                </c:forEach>
			            </select>
			        </div>
			        <div class="col-md-4 form-group">
			            <label for="city">City:</label>
			            <select class="form-control" id="city" name="city">
			                <c:forEach items="${cities}" var="city">
			                    <option value="${city.cityNo}" <c:if test="${employee.city.cityNo eq city.cityNo}">selected</c:if>>${city.cityName}</option>
			                </c:forEach>
			            </select>
			        </div>
			    </div>
			</div><br>
			
			<!-- Contact Information -->
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Contact Information</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-6 form-group">
			            <label for="phoneNumber">Phone Number:</label>
			            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<c:out value="${employee.phoneNumber}" />">
			        </div>
			        <div class="col-md-6 form-group">
			            <label for="mobileNumber">Mobile Number:</label>
			            <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<c:out value="${employee.mobileNumber}" />">
			        </div>
			    </div>
			</div><br>
			
			<!-- Login Information -->
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Login Information</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-6 form-group">
			            <label for="username">Username:</label>
			            <input type="text" class="form-control" id="username" name="username" value="<c:out value="${employee.username}" />">
			        </div>
			        <div class="col-md-6 form-group">
			            <label for="password">Password:</label>
			            <input type="password" class="form-control" id="password" name="password" value="<c:out value="${employee.password}" />">
			        </div>
			    </div>
			</div><br>
			
			<!-- Bank Details -->
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Bank Details</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-4 form-group">
			            <label for="bankName">Bank Name:</label>
			            <input type="text" class="form-control" id="bankName" name="bankName" value="<c:out value="${employee.bankName}" />">
			        </div>
			        <div class="col-md-4 form-group">
			            <label for="bankNumber">Account Number:</label>
			            <input type="text" class="form-control" id="bankNumber" name="bankNumber" value="<c:out value="${employee.bankAccount}" />">
			        </div>
			        <div class="col-md-4 form-group">
			            <label for="PAN">PAN:</label>
			            <input type="text" class="form-control" id="PAN" name="PAN" value="<c:out value="${employee.PAN}" />">
			        </div>
			    </div>
			</div><br>
			
			<div class="container">
			    <h5 class="text-center font-weight-bold mb-4">Privilege</h5>
			    <hr class="my-4">
			    <div class="row">
			        <div class="col-md-6 form-group">
			            <label for="privilege">Privilege:</label>
			            <select class="form-control" id="privilege" name="privilege">
			             </select>
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
		