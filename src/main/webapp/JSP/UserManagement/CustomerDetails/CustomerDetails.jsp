<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>


<%
    CustomerServices customersService = new CustomerServices();

    if(request.getParameter("action") != null)
    {
        if(request.getParameter("action").equals("update"))
        {

        	 Customers customer = customersService.findCustomer(Integer.parseInt(request.getParameter("customerNo")));

            if (customer != null)
            {
                customer.setName(request.getParameter("customerName"));
                customer.setPhoneNumber(request.getParameter("phoneNumber"));
                customer.setEmailAddress(request.getParameter("email"));
                customer.setUsername(request.getParameter("username"));
                //customer.setRegistrationDate(request.getParamater("Date"));
                customersService.updateCustomer(customer);
            }

            response.sendRedirect("CustomerDetails.jsp");
        }
        else if(request.getParameter("action").equals("delete"))
        {
           
            Customers temp=customersService.findCustomer(Integer.parseInt(request.getParameter("customerNo")));
            customersService.deleteCustomer(temp);
            response.sendRedirect("CustomerDetails.jsp");
        }
        else if(request.getParameter("action").equals("search"))
    	{
    		List<Customers> list=customersService.search(request.getParameter("search"));
    		request.setAttribute("customers",list);
    		customersService.close();

    	}
    }
    else
    {
	    List<Customers> customers = customersService.getAll();
	    request.setAttribute("customers", customers);
	    customersService.close();
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
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
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">User Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addCustomerDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">Customer Details</a>
            </div>
        </nav>
         <form action="CustomerDetails.jsp?action=search" method="post">

        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search Customers" aria-label="Search Customers">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
		</form>
        <div class="table-responsive" style="height:320px">
            <table class="table table-bordered table-hover" >
                <thead class="thead-dark">
                    <tr>
                        <th>Customer</th>
                         <th>Phone Number</th>
                         <th>Email Address</th>
                         <th>Username</th>
                         <th>Reg.Date</th>
                   </tr>
                    
                </thead>
                <tbody>
                    <c:forEach items="${customers}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <td>${c.phoneNumber}</td>
                                <td>${c.emailAddress}</td>
                                <td>${c.username}</td>
                                <td>${c.registrationDate}</td>
                                <td>
								    <a href="editCustomerDetails.jsp?action=update&customerNo=${c.customerNo}" ><i class="fas fa-edit"></i></a>
								    <a href="CustomerDetails.jsp?action=delete&customerNo=${c.customerNo}" ><i class="fas fa-trash-alt"></i></a>
								</td>
                                
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>


    </div>

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
