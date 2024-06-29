<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>


<%
    CustomerServices service = new CustomerServices();
    
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
    <title>Sign Up</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
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
		    <jsp:useBean id="customer" class="com.iss.models.Customers" scope="request">
		        <jsp:setProperty name="customer" property="name" value="${param.customerName}" />
		        <jsp:setProperty name="customer" property="phoneNumber" value="${param.phoneNumber}" />
		        <jsp:setProperty name="customer" property="emailAddress" value="${param.email}" />
		        <jsp:setProperty name="customer" property="addressLine1" value="${param.address1}" />
		        <jsp:setProperty name="customer" property="addressLine2" value="${param.address2}" />
		        <jsp:setProperty name="customer" property="registrationDate" value="${param.registrationDate}" />
		        <jsp:setProperty name="customer" property="username" value="${param.username}" />
		        <jsp:setProperty name="customer" property="password" value="${param.password}" />
		    </jsp:useBean>
		
		    <%
		        CustomerServices services = new CustomerServices();
		
		        if (request.getParameter("state") != null) {
		            States state = services.findState(Integer.parseInt(request.getParameter("state")));
		            customer.setState(state);
		        }
		
		        if (request.getParameter("city") != null) {
		            Cities city = services.findCity(Integer.parseInt(request.getParameter("city")));
		            customer.setCity(city);
		        }
		
		        if (request.getParameter("country") != null) {
		            Countries country = services.findCountry(Integer.parseInt(request.getParameter("country")));
		            customer.setCountry(country);
		        }
		
		        services.addCustomer(customer);

		        services.close();
		        EmailServices emailService=new EmailServices();
				try
				{
			        String messageContent = emailService.messageContent(customer);
			        emailService.sendEmail(customer.getEmailAddress()," Welcome to InnovativeCarRental! Your Registration is Successful",messageContent);
				}
				catch (Exception e) {
		            e.printStackTrace();
		        }
		    %>
		</c:if>


    
    	<nav class="navbar navbar-expand-sm navbar-dark">
	    <div class="container">
	        <a class="navbar-brand" href="#">Innovative Car Rental</a>
	        <div class="navbar-collapse justify-content-end">
	            <ul class="navbar-nav">
	                <li class="nav-item">
	                    <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp"><i class="fas fa-home"></i> HOME</a>
	                </li>
	                <li class="nav-item">
                            <a class="nav-link" href="/CarRental"><i class="fas fa-cog"></i> ADMINISTRATION</a>
                        </li>
	                </ul>
	        </div>
	    </div>
	</nav>	
	
	<div class="scroll-pane" style="height: 550px; overflow-y: auto;">
    <form action="Signup.jsp?btn=add" method="post">
        <div class="container">
            <h4 class="text-center font-weight-bold mb-4">Customer Details</h4>
            <hr class="my-4"> <!-- Add a horizontal rule for separation -->

            <div class="row align-items-center">
                <div class="col-md-6">
                    <label for="customerName" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="customerName" name="customerName">
                </div>
                
                <div class="col-md-6">
                    <label for="email" class="form-label">Email Address:</label>
                    <input type="text" class="form-control" id="email" name="email">
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12 form-group">
                    <label for="address" class="form-label">Address 1:</label>
                    <input type="text" class="form-control" id="address1" name="address1">
                </div>
                <div class="col-md-12 form-group">
                    <label for="address" class="form-label">Address 2:</label>
                    <input type="text" class="form-control" id="address2" name="address2">
                </div>
            </div>
        </div><br>

        <div class="container">
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="country" class="form-label">Country:</label>
                    <select class="form-control" id="country" name="country">
                        <c:forEach items="${countries}" var="c">
                            <option value="${c.countryNo}">${c.country}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label for="state" class="form-label">State:</label>
                    <select class="form-control" id="state" name="state">
                        <c:forEach items="${states}" var="s">
                            <option value="${s.stateNo}">${s.stateName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div><br>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="city" class="form-label">City:</label>
                    <select class="form-control" id="city" name="city">
                        <c:forEach items="${cities}" var="c">
                            <option value="${c.cityNo}">${c.cityName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label for="pincode" class="form-label">Pincode:</label>
                    <input type="text" class="form-control" id="pincode" name="pincode">
                </div>
            </div>
        </div><br>

        <div class="container">
            <h5 class="text-center font-weight-bold mb-4">Contact Details</h5>
            <hr class="my-4"> <!-- Add a horizontal rule for separation -->
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="phoneNumber" class="form-label">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                </div>
                <div class="col-md-6 form-group">
                    <label for="mobileNumber" class="form-label">Mobile Number:</label>
                    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber">
                </div>
            </div>
        </div><br>

        <div class="container">
            <h5 class="text-center font-weight-bold mb-4">Login Details</h5>
            <hr class="my-4"> <!-- Add a horizontal rule for separation -->
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="col-md-6 form-group">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
            </div>
        </div><br>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <input type="submit" class="btn btn-primary" value="Save">
                    <button type="reset" class="btn btn-secondary">Clear</button>
                </div>
            </div>
        </div>
    </form>
</div>

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
