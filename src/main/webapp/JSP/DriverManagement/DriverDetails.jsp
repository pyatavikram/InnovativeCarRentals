<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>


<%
    DriversServices driversService = new DriversServices();

    if(request.getParameter("action") != null)
    {
        if(request.getParameter("action").equals("update"))
        {

        	Drivers driver = driversService.findDriver(Integer.parseInt(request.getParameter("driverNo")));

        	if (driver != null)
        	{
        	    driver.setName(request.getParameter("driverName"));
        	    driver.setPhoneNumber(request.getParameter("phoneNumber"));
        	    driver.setLicenceNumber(request.getParameter("licenceNumber")); 
        	    driver.setBankName(request.getParameter("bankName"));
        	    driver.setBankAccount(request.getParameter("bankAccount"));
        	    driver.setPAN(request.getParameter("PAN")); 
        	    driversService.updateDriver(driver);
        	}

        	response.sendRedirect("DriverDetails.jsp");

        }
        else if(request.getParameter("action").equals("delete"))
        {
            int id = Integer.parseInt(request.getParameter("driverNo"));
            Drivers temp = new Drivers();
            temp.setDriverNo(id);
            driversService.deleteDriver(temp);
            response.sendRedirect("DriverDetails.jsp");
        }
        else if(request.getParameter("action").equals("search"))
		{
			List<Drivers> list=driversService.search(request.getParameter("search"));
			request.setAttribute("drivers",list);
			driversService.close();

		}
    }
    else
    {
	    List<Drivers> drivers = driversService.getAll();
	    request.setAttribute("drivers", drivers);
	    driversService.close();
    }
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Management</title>
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
    <!-- Navigation Bar -->
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
    </nav>
    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">Driver Details</a>
            </div>
        </nav>
        
        
         <form action="DriverDetails.jsp?action=search" method="post">
        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search DriverDetails" aria-label="Search DriverDetails">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
		</form>
        
        
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover" style="height:320px">
                <thead class="thead-dark">
                    <tr>
                        <th>Driver</th>
                         <th>Phone Number</th>
                         <th>License Number</th>
                         <th>Bank</th>
                         <th>A/C Number</th>
                         <th>PAN</th>
                         <th>Action</th>
                   </tr>
                    
                </thead>
                <tbody>
                    <c:forEach items="${drivers}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <td>${c.phoneNumber}</td>
                                <td>${c.licenceNumber}</td>
                                <td>${c.bankName}</td>
                                <td>${c.bankAccount}</td>
                                <td>${c.PAN}</td>
                                <td>
								    <a href="editDriverDetails.jsp?action=update&driverNo=${c.driverNo}" ><i class="fas fa-edit"></i></a>
								    <a href="DriverDetails.jsp?action=delete&driverNo=${c.driverNo}" ><i class="fas fa-trash-alt"></i></a>
								</td>

                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>
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
