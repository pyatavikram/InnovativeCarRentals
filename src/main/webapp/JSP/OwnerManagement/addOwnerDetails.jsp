<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>


<%
	OwnersServices service = new OwnersServices();
	
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
    <title>Owner Details</title>
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
		    <jsp:useBean id="owner" class="com.iss.models.Owners" scope="request">
		        <jsp:setProperty name="owner" property="name" value="${param.ownerName}" />
		        <jsp:setProperty name="owner" property="address1" value="${param.address1}" />
		        <jsp:setProperty name="owner" property="address2" value="${param.address2}" />
		        <jsp:setProperty name="owner" property="pincode" value="${param.pincode}" />
		        <jsp:setProperty name="owner" property="phoneNumber" value="${param.phoneNumber}" />
		        <jsp:setProperty name="owner" property="mobileNumber" value="${param.mobileNumber}" />
		        <jsp:setProperty name="owner" property="bankName" value="${param.bankName}" />
		        <jsp:setProperty name='owner' property="PAN" value="${param.PAN}"/>
		        <jsp:setProperty name="owner" property="bankAccount" value="${param.bankAccount}" />
		    </jsp:useBean>
		    
		    <%
		        OwnersServices services = new OwnersServices();
		
		        if (request.getParameter("state") != null) {
		            States state = services.findState(Integer.parseInt(request.getParameter("state")));
		            owner.setState(state);
		        }
		
		        if (request.getParameter("city") != null) {
		            Cities city = services.findCity(Integer.parseInt(request.getParameter("city")));
		            owner.setCity(city);
		        }
		
		        if (request.getParameter("country") != null) {
		            Countries country = services.findCountry(Integer.parseInt(request.getParameter("country")));
		            owner.setCountry(country);
		        }
		
		        services.addOwner(owner);
		
		        services.close();
		    %>
	</c:if>
	
    
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Owner Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="OwnerDetails.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addOwnerDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav><br>
	
	<div class="scroll-pane" style="height: 550px; overflow-y: auto;">
    <form action="addOwnerDetails.jsp?btn=add" method="post">
        <div class="container">
            <h4 class="text-center font-weight-bold mb-4">Owner Details</h4>
            <hr class="my-4">

            <div class="row align-items-center">
                <div class="col-md-6">
                    <label for="driverName" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="driverName" name="ownerName">
                </div>
                <div class="col-md-6">
                    <label for="licenceNumber" class="form-label">Licence Number:</label>
                    <input type="text" class="form-control" id="licenceNumber" name="licenceNumber">
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
                        <c:forEach items="${countries }" var="c">
                    		<option value="${c.countryNo}">${c.country }</option>
                 	   </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label for="state">State:</label>
                    <select class="form-control" id="state" name="state">
                       <c:forEach items="${states }" var="c">
                    <option value="${c.stateNo}">${c.stateName }</option>
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
                      <c:forEach items="${cities }" var="c">
                    <option value="${ c.cityNo}">${c.cityName }</option>
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
            <h5 class="text-center font-weight-bold mb-4">Bank Details</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-4 form-group">
                    <label for="bankName">Bank:</label>
                    <input type="text" class="form-control" id="bankName" name="bankName">
                </div>
                <div class="col-md-4 form-group">
                    <label for="bankAccount">Account Number:</label>
                    <input type="text" class="form-control" id="bankAccount" name="bankAccount">
                </div>
                <div class="col-md-4 form-group">
                    <label for="PAN">PAN:</label>
                    <input type="text" class="form-control" id="PAN" name="PAN">
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
