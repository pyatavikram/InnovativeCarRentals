<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
    EmployeeServices employeeService = new EmployeeServices();

    if(request.getParameter("action") != null)
    {
        if(request.getParameter("action").equals("update"))
        {
            Employees employee = employeeService.findEmployee(Integer.parseInt(request.getParameter("employeeNo")));

            if (employee != null)
            {
                employee.setName(request.getParameter("employeeName"));
                employee.setPhoneNumber(request.getParameter("phoneNumber"));
                employee.setEmailAddress(request.getParameter("email"));
                employee.setUsername(request.getParameter("username"));
                        employeeService.updateEmployee(employee);
                employeeService.updateEmployee(employee);
            }

            response.sendRedirect("EmployeeDetails.jsp");
        }
        else if(request.getParameter("action").equals("delete"))
        {
            Employees temp = employeeService.findEmployee(Integer.parseInt(request.getParameter("employeeNo")));
            employeeService.deleteEmployee(temp);
            response.sendRedirect("EmployeeDetails.jsp");
        }
        else if(request.getParameter("action").equals("search"))
    	{
    		List<Employees> list=employeeService.search(request.getParameter("search"));
    		request.setAttribute("employees",list);
    		employeeService.close();

    	}
    }
    else
    {
	    List<Employees> employees = employeeService.getAll();
	    request.setAttribute("employees", employees);
	    employeeService.close();
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
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
                        <a class="nav-link" href="addEmployeeDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">Employee Details</a>
            </div>
        </nav>

         <form action="EmployeeDetails.jsp?action=search" method="post">

        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search Employees" aria-label="Search Employees">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
		</form>

		
        <!-- Table -->
        <div class="table-responsive" style="height:320px">
            <table class="table table-bordered table-hover" >
                <thead class="thead-dark">
                    <tr>
                        <th>Employee</th>
                         <th>Type</th>
                         <th>Email Address</th>
                         <th>Username</th>
                         <th>Bank</th>
                   		 <th>A/C Number</th>
                   		 <th>PAN</th>
                   		 <th>Action</th>
                    </tr>
                    
                </thead>
                <tbody>
                    <c:forEach items="${employees}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <td>${c.employeeType}</td>
                                <td>${c.emailAddress}</td>
                                <td>${c.username}</td>
                                <td>${c.bankName}</td>
                                <td>${c.bankAccount}</td>
                                <td>${c.PAN}</td>
                                <td>
								    <a href="editEmployeeDetails.jsp?action=update&employeeNo=${c.employeeNo}" ><i class="fas fa-edit"></i></a>
								    <a href="EmployeeDetails.jsp?action=delete&employeeNo=${c.employeeNo}" ><i class="fas fa-trash-alt"></i></a>
								</td>
                                
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>

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
