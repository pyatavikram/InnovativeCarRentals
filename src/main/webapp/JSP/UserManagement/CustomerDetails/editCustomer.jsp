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

<form action="EmployeeDetails.jsp?action=update&customerNo=${customer.customerNo}" method="post">  
    <div class="container">
        <h4 class="text-center font-weight-bold mb-4">Edit Customer Details</h4>
        <hr class="my-4">
        
        <!-- Customer Information -->
        <div class="row align-items-center">
            <div class="col-md-4">
                <label for="customerName" class="form-label">Name:</label>
            </div>
            <div class="col-md-4">
                <label for="customerType" class="form-label">Customer Type:</label>
            </div>
            <div class="col-md-4">
                <label for="emailAddress" class="form-label">Email Address:</label>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4 form-group">
                <input type="text" class="form-control" id="customerName" name="customerName" value="<c:out value="${customer.name}" />">
            </div>
            <div class="col-md-4 form-group">
                <select class="form-control" id="customerType" name="customerType">
                    <option value="regular" <c:if test="${customer.customerType eq 'regular'}">selected</c:if>>Regular</option>
                    <option value="premium" <c:if test="${customer.customerType eq 'premium'}">selected</c:if>>Premium</option>
                </select>
            </div>
            <div class="col-md-4 form-group">
                <input type="text" class="form-control" id="emailAddress" name="emailAddress" value="<c:out value="${customer.emailAddress}" />">
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
                <input type="text" class="form-control" id="addressLine1" name="addressLine1" value="<c:out value="${customer.addressLine1}" />">
            </div>
            <div class="col-md-12 form-group">
                <label for="addressLine2">Address Line 2:</label>
                <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="<c:out value="${customer.addressLine2}" />">
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
                        <option value="${country.countryNo}" <c:if test="${customer.country.countryNo eq country.countryNo}">selected</c:if>>${country.country}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4 form-group">
                <label for="state">State:</label>
                <select class="form-control" id="state" name="state">
                    <c:forEach items="${states}" var="state">
                        <option value="${state.stateNo}" <c:if test="${customer.state.stateNo eq state.stateNo}">selected</c:if>>${state.stateName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4 form-group">
                <label for="city">City:</label>
                <select class="form-control" id="city" name="city">
                    <c:forEach items="${cities}" var="city">
                        <option value="${city.cityNo}" <c:if test="${customer.city.cityNo eq city.cityNo}">selected</c:if>>${city.cityName}</option>
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
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<c:out value="${customer.phoneNumber}" />">
            </div>
            <div class="col-md-6 form-group">
                <label for="mobileNumber">Mobile Number:</label>
                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<c:out value="${customer.mobileNumber}" />">
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
                <input type="text" class="form-control" id="bankName" name="bankName" value="<c:out value="${customer.bankName}" />">
            </div>
            <div class="col-md-4 form-group">
                <label for="bankNumber">Account Number:</label>
                <input type="text" class="form-control" id="bankNumber" name="bankNumber" value="<c:out value="${customer.bankAccount}" />">
            </div>
            <div class="col-md-4 form-group">
                <label for="PAN">PAN:</label>
                <input type="text" class="form-control" id="PAN" name="PAN" value="<c:out value="${customer.PAN}" />">
            </div>
        </div>
    </div><br>
    
    <!-- Privilege -->
    <div class="container">
        <h5 class="text-center font-weight-bold mb-4">Privilege</h5>
        <hr class="my-4">
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="privilege">Privilege:</label>
                <select class="form-control" id="privilege" name="privilege">
                    <!-- Options for privilege -->
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
