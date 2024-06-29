<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
	try
	{	
  		VehicleMakeDetailsServices vehicleMakesService = new VehicleMakeDetailsServices();
	
	if(request.getParameter("action")!=null)
	{
		if(request.getParameter("action").equals("update"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
	        String Name = request.getParameter("vehicleMake");
	        VehicleMakes vehicleMakes = new VehicleMakes();
	       vehicleMakes.setMakeNo(id);
	       vehicleMakes.setName(Name);
	       vehicleMakesService.updateVehicleMakes(vehicleMakes);
	        response.sendRedirect("VehicleMakeDetails.jsp");
		}
		else if(request.getParameter("action").equals("delete"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			VehicleMakes temp=new VehicleMakes();
			temp.setMakeNo(id);
			vehicleMakesService.deleteVehicleMakes(temp);
			response.sendRedirect("VehicleMakeDetails.jsp");
		}
		else if(request.getParameter("action").equals("search"))
		{
			List<VehicleMakes> list=vehicleMakesService.search(request.getParameter("search"));
			request.setAttribute("vehicleMakes",list);
			vehicleMakesService.closeEntityManagerFactory();
		}
	}
	else
	{
	    List<VehicleMakes> vehicleMakes = vehicleMakesService.getAll();
	    request.setAttribute("vehicleMakes", vehicleMakes);
	    vehicleMakesService.closeEntityManagerFactory();
	}
	
	}catch(Exception e){}
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Management</title>
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
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Vehicle Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addVehicleMakeDetails.jsp"><i class="fas fa-plus"></i></a>
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
                <a class="navbar-brand" href="#">Vehicle Make Details</a>
            </div>
        </nav>

        <form action="VehicleMakeDetails.jsp?action=search" method="post">
        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search VehicleMakes" aria-label="Search VehicleMakes">
            <div class="input-group-append">
               <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
       </form>

		
        
        <div class="table-responsive" style="height:340px">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>VehicleMakes</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vehicleMakes}" var="c">
					    <tr>
					        <td class="d-flex justify-content-between">
					            <span>${c.name}</span>
					            <span>
					                <a href="editVehicleMakeDetails.jsp?id=${c.makeNo}" class="btn btn-sm btn-warning mr-2"><i class="fas fa-edit"></i></a>
					                <a href="VehicleMakeDetails.jsp?id=${c.makeNo}&action=delete" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
					            </span>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
