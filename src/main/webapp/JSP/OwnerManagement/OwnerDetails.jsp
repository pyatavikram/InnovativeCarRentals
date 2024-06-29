<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
    OwnersServices ownersService = new OwnersServices();

    if(request.getParameter("action") != null)
    {
        if(request.getParameter("action").equals("update"))
        {

            Owners owner = ownersService.findOwner(Integer.parseInt(request.getParameter("ownerNo")));

            if (owner != null)
            {
                owner.setName(request.getParameter("ownerName"));
                owner.setPhoneNumber(request.getParameter("phoneNumber"));
                owner.setBankName(request.getParameter("bankName"));
                owner.setBankAccount(request.getParameter("bankAccount"));
                owner.setPAN(request.getParameter("pan"));
                ownersService.updateOwner(owner);
            }

            response.sendRedirect("OwnerDetails.jsp");
        }
        else if(request.getParameter("action").equals("delete"))
        {
            Owners temp = new Owners();
            temp.setOwnerNo(Integer.parseInt(request.getParameter("ownerNo")));
            ownersService.deleteOwner(temp);
            response.sendRedirect("OwnerDetails.jsp");
        }
        else if(request.getParameter("action").equals("search"))
    	{
    		List<Owners> list=ownersService.search(request.getParameter("search"));
    		request.setAttribute("owners",list);
    		ownersService.close();

    	}
    }
    else
    {
	    List<Owners> owners = ownersService.getAll();
	    request.setAttribute("owners", owners);
	    ownersService.close();
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Management</title>
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
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Owner Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
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
    </nav>

    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">Owner Details</a>
            </div>
        </nav>

         <form action="OwnerDetails.jsp?action=search" method="post">

        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search OwnerDetails" aria-label="Search OwnerDetails">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
		</form>
		
        <div class="table-responsive">
            <table class="table table-bordered table-hover" style="height:320px">
                <thead class="thead-dark">
                    <tr>
                        <th>Owner</th>
                         <th>Phone Number</th>
                         <th>Bank</th>
                         <th>A/C Number</th>
                         <th>PAN</th>
                         <th>Action</th>	
                   </tr>
                    
                </thead>
                <tbody>
                    <c:forEach items="${owners}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <td>${c.phoneNumber}</td>
                                <td>${c.bankName}</td>
                                <td>${c.bankAccount}</td>
                                <td>${c.PAN}</td>
                                <td>
								    <a href="editOwnerDetails.jsp?action=update&ownerNo=${c.ownerNo}" ><i class="fas fa-edit"></i></a>&#8196;&#8196;&#8196;     
								    <a href="OwnerDetails.jsp?action=delete&ownerNo=${c.ownerNo}" ><i class="fas fa-trash-alt"></i></a>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
