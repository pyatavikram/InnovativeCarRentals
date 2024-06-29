<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>

<%
    VehicleTypesServices service = new VehicleTypesServices();
    List<VehicleTypes> vehicleTypes = service.getAll();
    
    VehicleMakeDetailsServices makeService = new VehicleMakeDetailsServices();
    List<VehicleMakes> vehicleMakes = makeService.getAll();
    request.setAttribute("VehicleTypes", vehicleTypes);
    request.setAttribute("VehicleMakes", vehicleMakes);

    makeService.closeEntityManagerFactory();
    service.closeEntityManagerFactory();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Innovative Car Rental</title>
    
     <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
		  .button {
		  background-color: #fff;
		  border: none;
		  border-radius: 1.5rem;
		  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.05);
		  color: #121212;
		  cursor: pointer;
		  display: inline-flex;
		  overflow: hidden;
		  position: relative;
		  text-decoration: none;
		  line-height: 1;
		}
		
		.button:hover .button__text {
		  color: #fff;
		}
		
		.button:hover .button-decor {
		  transform: translateX(0);
		}
		
		.button-content {
		  align-items: center;
		  display: flex;
		  font-weight: 600;
		  position: relative;
		}
		
		.button__icon {
		  background-color: #00ad54;
		  display: grid;
		  height: 40px;
		  place-items: center;
		  width: 48px;
		}
		
		.button__text {
		  display: inline-block;
		  max-width: 150px;
		  overflow: hidden;
		  padding: 2px 1.5rem 2px;
		  padding-left: 0.75rem;
		  text-overflow: ellipsis;
		  transition: color 0.2s;
		  white-space: nowrap;
		}
		
		.button-decor {
		  background-color: #00ad54;
		  inset: 0;
		  position: absolute;
		  transform: translateX(-100%);
		  transition: transform 0.3s;
		  z-index: 0;
		}

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
        .card {
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .scrollable-images {
            display: flex;
            overflow-x: auto;
        }
        .scrollable-Innerimages {
            display: flex;
            overflow-x: auto;
        }
        .image-wrapper {
            margin-right: 10px;
            text-align: center;
        }
        .vehicle-image {
            height: 100px;
            width: auto;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }
        .vehicle-Innerimage {
            height: 200px;
            width: auto;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }
        .containerInnov{
        	height:750px;
        }
        .vehicle-Outerimage {
            height: 200px;
            width: 100%;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        .image-wrapper {
            position: relative;
            max-width: 350px;
            margin: auto;
        }

        .booknow-btn {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
        }
        .scroll-pane {
            height: auto;
            overflow-y: auto;
            max-height: 80vh; /* Adjust as needed */
        }
        .table-container {
            max-height: 300px;
            overflow-y: auto;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 10px;
        }
        .table th, .table td {
            white-space: nowrap;
        }
        .image-wrapper {
            position: relative;
            max-width: 350px;
            margin: auto;
        }
        .booknow-btn {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
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
                    <c:choose>
                        <c:when test="${not empty sessionScope.customer}">
                            <li class="nav-item">
                                <a class="nav-link" href="/CarRental/UserManual/Homepage.jsp?page=Reservations&customerNo=${sessionScope.customer.customerNo }"><i class="fas fa-car"></i> RESERVATIONS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CarRental/UserManual/EditProfile.jsp?customerNo=${sessionScope.customer.customerNo }"><i class="fas fa-user-edit"></i> EDIT PROFILE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CarRental/UserManual/logout.jsp"><i class="fas fa-sign-out-alt"></i> LOGOUT</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="/CarRental/UserManual/Signup.jsp"><i class="fas fa-plus"></i> SIGN UP</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CarRental/LoginPage/loginpage.jsp"><i class="fas fa-cog"></i> ADMINISTRATION</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <div class="row">
        <div class="col-3" style="margin-left:0%">
            <div class="scroll-pane" style="height:auto;">
                <c:choose>
                    <c:when test="${not empty sessionScope.customer}">
                        <h6 class="card-header">Welcome, ${sessionScope.customer.username}!</h6>
                    </c:when>
                    <c:otherwise>
                        <form action="VerifyCustomerDetails.jsp" method="post">
                            <div class="card">
                                <div class="form-group">
                                    <input type="hidden" name="page" value="login">
                                    <input type="text" id="username" name="username" class="form-control" placeholder="Enter Username" aria-label="Search Username">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" aria-label="Search Password">
                                </div>
                                <button type="submit" name="login" id="login" class="btn btn-primary btn-block" value="login">Login</button>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>

                <div class="card">
                    <h6 class="card-header">Fleet Options For Cars & Coaches</h6>
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${VehicleTypes}" var="type">
                            <li class="list-group-item"><a href="Homepage.jsp?page=${type.type}"><i class="fas fa-car"></i>${type.type}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="card">
                    <h6 class="card-header">Car Makers</h6>
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${VehicleMakes}" var="make">
                            <li class="list-group-item"><a href="#"><i class="fas fa-car"></i>${make.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <c:choose>
		<c:when test="${param.page eq 'Rental' }">
       		 <jsp:include page="RentalDetails.jsp" />
        </c:when>
        <c:when test="${param.page eq 'Reservations'}">
        	<%
				if(request.getParameter("action") != null)
				{
					if(request.getParameter("action").equals("Delete"))
					{
						RentalDetailsServices rentalService=new RentalDetailsServices();
						Rentals rental=rentalService.findRental(Integer.parseInt(request.getParameter("RentalNo")));
						rental.setStatus("Cancelled");
						rentalService.updateRental(rental);
						rentalService.close();
					}
				}
			%>
        	<jsp:include page="Reservations.jsp" />
        </c:when>
        
        <c:otherwise>
        		<jsp:include page="vehicleDisplay.jsp" />
        </c:otherwise>
        </c:choose>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
