<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    CustomerServices service = new CustomerServices();
    
    List<Countries> countries = service.getAllCountries();
    List<Cities> cities = service.getAllCities();
    List<States> states = service.getAllStates();
    
    request.setAttribute("countries", countries);
    request.setAttribute("cities", cities);
    request.setAttribute("states", states);
    
    int customerNo = Integer.parseInt(request.getParameter("customerNo"));
    Customers customer = service.findCustomer(customerNo);
    request.setAttribute("customer", customer);
    service.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
            <a class="navbar-brand" href="#">Innovative Car Rental</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp"><i class="fas fa-home"></i> HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/UserManual/Signup.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h4 class="text-center font-weight-bold mb-4">Edit Profile</h4>
        <hr class="my-4">
        <form action="UpdateCustomer.jsp" method="post">  
            <input type="hidden" name="customerNo" value="${customer.customerNo}">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <label for="customerName" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="customerName" name="customerName" value="<c:out value='${customer.name}' />">
                </div>
                <div class="col-md-6">
                    <label for="emailAddress" class="form-label">Email Address:</label>
                    <input type="text" class="form-control" id="emailAddress" name="emailAddress" value="<c:out value='${customer.emailAddress}' />">
                </div>
            </div>
            <br>
            <h5 class="text-center font-weight-bold mb-4">Address Information</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-6">
                    <label for="addressLine1" class="form-label">Address Line 1:</label>
                    <input type="text" class="form-control" id="addressLine1" name="addressLine1" value="<c:out value='${customer.addressLine1}' />">
                </div>
                <div class="col-md-6">
                    <label for="addressLine2" class="form-label">Address Line 2:</label>
                    <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="<c:out value='${customer.addressLine2}' />">
                </div>
            </div>
            <br>
            <h5 class="text-center font-weight-bold mb-4">Location Information</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-4">
                    <label for="country" class="form-label">Country:</label>
                    <select class="form-control" id="country" name="country">
                        <c:forEach items="${countries}" var="country">
                            <option value="${country.countryNo}" <c:if test="${customer.country.countryNo eq country.countryNo}">selected</c:if>>${country.country}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="state" class="form-label">State:</label>
                    <select class="form-control" id="state" name="state">
                        <c:forEach items="${states}" var="state">
                            <option value="${state.stateNo}" <c:if test="${customer.state.stateNo eq state.stateNo}">selected</c:if>>${state.stateName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="city" class="form-label">City:</label>
                    <select class="form-control" id="city" name="city">
                        <c:forEach items="${cities}" var="city">
                            <option value="${city.cityNo}" <c:if test="${customer.city.cityNo eq city.cityNo}">selected</c:if>>${city.cityName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <br>
            <h5 class="text-center font-weight-bold mb-4">Contact Information</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-6">
                    <label for="phoneNumber" class="form-label">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<c:out value='${customer.phoneNumber}' />">
                </div>
                <div class="col-md-6">
                    <label for="mobileNumber" class="form-label">Mobile Number:</label>
                    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<c:out value='${customer.mobileNumber}' />">
                </div>
            </div>
            <br>
            <h5 class="text-center font-weight-bold mb-4">Login Details</h5>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-6">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" value="<c:out value='${customer.username}' />">
                </div>
                <div class="col-md-6">
                    <label for="password" class="form-label">Password:</label>
                    <input type="text" class="form-control" id="password" name="password" value="<c:out value='${customer.password}' />">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="reset" class="btn btn-secondary">Clear</button>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
