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
    
    service.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
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

		 <c:if test="${param.btn == 'add'}">
		    <jsp:useBean id="employee" class="com.iss.models.Employees" scope="request">
		    <jsp:setProperty name="employee" property="name" value="${param.employeeName}" />
		    <jsp:setProperty name="employee" property="phoneNumber" value="${param.phoneNumber}" />
		    <jsp:setProperty name="employee" property="mobileNumber" value="${param.mobileNumber}" />
		    <jsp:setProperty name="employee" property="emailAddress" value="${param.emailAddress}" />
		    <jsp:setProperty name="employee" property="addressLine1" value="${param.addressLine1}" />
		    <jsp:setProperty name="employee" property="addressLine2" value="${param.addressLine2}" />
		    <jsp:setProperty name="employee" property="bankName" value="${param.bankName}" />
		    <jsp:setProperty name="employee" property="bankAccount" value="${param.bankNumber}" />
		    <jsp:setProperty name="employee" property="username" value="${param.username}" />
		    <jsp:setProperty name="employee" property="password" value="${param.password}" />
		    <jsp:setProperty name="employee" property="pincode" value="${param.pincode}" />
		    <jsp:setProperty name="employee" property="employeeType" value="${param.employeeType }"/>
		    <jsp:setProperty name="employee" property="PAN" value="${param.PAN}" />
		</jsp:useBean>

		    
		    <%
		        EmployeeServices services = new EmployeeServices();
				System.out.println(request.getParameter("state"));
		        if (request.getParameter("state") != null) {
		            States state = services.findState(Integer.parseInt(request.getParameter("state")));
		            employee.setState(state);
		        }
		
		        if (request.getParameter("city") != null) {
		            Cities city = services.findCity(Integer.parseInt(request.getParameter("city")));
		            employee.setCity(city);
		        }
		
		        if (request.getParameter("country") != null) {
		            Countries country = services.findCountry(Integer.parseInt(request.getParameter("country")));
		            employee.setCountry(country);
		        }
		
		        services.addEmployee(employee);
		
		        services.close();
		    %>
	</c:if>
		
    
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
    
    <div class="scroll-pane" style="height: auto; overflow-y: auto;">
        <form action="addEmployeeDetails.jsp?btn=add" method="post">  
            <div class="container">
                <h4 class="text-center font-weight-bold mb-4">Employee Details</h4>
                <hr class="my-4"> <!-- Add a horizontal rule for separation -->
                
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
                        <input type="text" class="form-control" id="employeeName" name="employeeName">
                    </div>
                    <div class="col-md-4 form-group">
                        <select class="form-control" id="employeeType" name="employeeType">
                            <option value="regular">Regular</option>
                            <option value="contract">Contract</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <input type="text" class="form-control" id="emailAddress" name="emailAddress">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <h5 class="text-center font-weight-bold mb-4">Address Details</h5>
                <hr class="my-4">
                <div class="row">
                    <div class="col-md-12 form-group">
                        <label for="addressLine1">Address 1:</label>
                        <input type="text" class="form-control" id="addressLine1" name="addressLine1">
                    </div>
                    <div class="col-md-12 form-group">
                        <label for="addressLine2">Address 2:</label>
                        <input type="text" class="form-control" id="addressLine2" name="addressLine2">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="country">Country:</label>
                        <select class="form-control" id="country" name="country">
                            <c:forEach items="${countries}" var="country">
                                <option value="${country.countryNo}">${country.country}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="state">State:</label>
                        <select class="form-control" id="state" name="state">
                            <c:forEach items="${states}" var="state">
                            	<c:if test="${param.country eq state.country.countryNo}">
                                <option value="${state.stateNo}">${state.stateName}</option>
                                </c:if>
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
                            <c:forEach items="${cities}" var="city">
                            	<c:if test="${param.state eq city.state.stateNo}">
                               		<option value="${city.cityNo}">${city.cityName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="pincode">Pincode:</label>
                        <input type="text" class="form-control" id="pincode" name="pincode">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <h5 class="text-center font-weight-bold mb-4">Contact Details</h5>
                <hr class="my-4">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="phoneNumber">Phone Number:</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="mobileNumber">Mobile Number:</label>
                        <input type="text" class="form-control" id="mobileNumber" name="mobileNumber">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <h5 class="text-center font-weight-bold mb-4">Login Details</h5>
                <hr class="my-4">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="password">Password:</label>
                        <input type="text" class="form-control" id="password" name="password">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <h5 class="text-center font-weight-bold mb-4">Bank Details</h5>
                <hr class="my-4"> 
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label for="bankName">Bank:</label>
                        <input type="text" class="form-control" id="bankName" name="bankName">
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="bankNumber">Account Number:</label>
                        <input type="text" class="form-control" id="bankNumber" name="bankNumber">
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="PAN">PAN:</label>
                        <input type="text" class="form-control" id="PAN" name="PAN">
                    </div>
                </div>
            </div><br>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-8 form-group">
                        <label for="privilage">Privilege</label>
                        <select class="form-control" id="privilage" name="privilage">
                            <option value="c">Please Select</option>
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

	<br>
<br>
<br><br>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

