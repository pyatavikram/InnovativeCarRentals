<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*,java.io.*,javax.servlet.http.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<c:if test="${param.btn eq 'add' }">
	

	<%
		String btn = request.getParameter("btn");


		if (btn != null && btn.equals("add"))
		{
			String uploadPath = "D:\\Programs\\CarRental\\CarRental\\src\\main\\CarRentalImages";
			int maxFileSize = 5 * 1024 * 1024;
			MultipartRequest mpr = new MultipartRequest(request, uploadPath, maxFileSize);
			Vehicles vehicle = new Vehicles();  

			File	file=mpr.getFile("imageFile");
			FileInputStream	fis=new FileInputStream(file);
			byte []data=new byte[(int)file.length()];
			fis.read(data);
		    vehicle.setPicture(data);
		    vehicle.setType(mpr.getParameter("type"));
		    vehicle.setRegistrationNumber(mpr.getParameter("regNo"));
		    vehicle.setChaisisNumber(mpr.getParameter("chassisNumber"));
		    vehicle.setYear(Integer.parseInt(mpr.getParameter("year")));
		    vehicle.setColor(mpr.getParameter("color"));
		    vehicle.setFuel(mpr.getParameter("fuel"));
		    vehicle.setCapacity(Integer.parseInt(mpr.getParameter("capacity")));
		    vehicle.setMileage(Integer.parseInt(mpr.getParameter("mileage")));
		    vehicle.setDailyRate(Integer.parseInt(mpr.getParameter("dailyRate")));
		    vehicle.setHourlyRate(Integer.parseInt(mpr.getParameter("hourlyRate")));
		    vehicle.setAdditionalDailyRate(Integer.parseInt(mpr.getParameter("additionalDailyRate")));
		    vehicle.setAdditionalHourlyRate(Integer.parseInt(mpr.getParameter("additionalHourlyRate")));
		
		    VehicleDetailsServices service = new VehicleDetailsServices();
		    System.out.print(mpr.getParameter("vehicleModel"));
		    VehicleModels vehicleModel = service.findVehicleModel(Integer.parseInt(mpr.getParameter("model")));
		    vehicle.setVehiclemodels(vehicleModel);
		
		    Owners owner = service.findOwners(Integer.parseInt(mpr.getParameter("owner")));
		    vehicle.setOwner(owner);
		
		    States state = service.findState(Integer.parseInt(mpr.getParameter("state")));
		    vehicle.setState(state);
		    
		    service.addVehicleDetails(vehicle);
		    service.close();
		    response.sendRedirect("addVehicleDetails.jsp");
		}
%>

</c:if>
<c:if test="${param.btn != 'add' }">

	<%
	
	VehicleDetailsServices service = new VehicleDetailsServices();
    List<Vehicles> vehicleDetails = service.getAll();
    List<VehicleTypes> vehicleTypes = service.getAllVehicleTypes();
    List<VehicleMakes> vehicleMakes = service.getAllVehicleMakes();
    List<VehicleModels> vehicleModels = service.getAllVehicleModels();
    List<Owners> owners = service.getAllOwners();
    List<Countries> countries = service.getAllCountries();
    List<States> states = service.getAllStates();
    List<VehicleFuel> vehicleFuel = service.getAllVehicleFuel();
    List<VehicleCapacity> vehicleCapacity = service.getAllVehicleCapacity();
    
    request.setAttribute("vehicleDetails", vehicleDetails);
    request.setAttribute("vehicleTypes", vehicleTypes);
    request.setAttribute("vehicleMakes", vehicleMakes);
    request.setAttribute("vehicleModels", vehicleModels);
    request.setAttribute("owners", owners);
    request.setAttribute("countries", countries);
    request.setAttribute("states", states);
    request.setAttribute("vehicleFuel", vehicleFuel);
    request.setAttribute("vehicleCapacity", vehicleCapacity);
	
    service.close();
    
	%>
	
</c:if>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details</title>
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
       
    
    </style>
    
    <script>
    		
    	function SetStates()
    	{
    		
    		
    	}
    	
    </script>
    
</head>
<body>
    
    

    
    
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Vehicle Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental/JSP/VehicleManagement/VehicleDetails/VehicleDetails.jsp"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addVehicleDetails.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav><br>
	
	<div class="scroll-pane" style="height: 550px; overflow-y: auto;">
		 <form action="addVehicleDetails.jsp?btn=add" method="post" enctype="multipart/form-data" >   
			<div class="container">
			    <h4 class="text-center font-weight-bold mb-4">Vehicle Details</h4>
			    <hr class="my-4"> <!-- Add a horizontal rule for separation -->
			
			    <div class="row align-items-center">
			        <div class="col-md-2">
			            <label for="imageFile" class="form-label">Image:</label>
			        </div>
			        <div class="col-md-2">
			            <input type="text" id="fileName" name="fileName" class="form-control" readonly placeholder="No file chosen">
			        </div>
			        <div class="col-md-2">
			            <label for="imageFile" class="btn btn-primary">
			                Browse.. <input type="file" name="imageFile" id="imageFile" class="form-control-file d-none" onchange="updateFileName(this)" style="height: 2.5rem; padding-top: 1.5rem;">
			            </label>
			        </div>
			    </div>
			</div>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-4 form-group">
		                <label for="type">Type:</label>
						<select class="form-control" id="type" name="type">
						    <c:forEach var="type" items="${vehicleTypes}">
						        <option value="${type.type}">${type.type}</option>
						    </c:forEach>
						</select>
		            </div>
		            <div class="col-md-4 form-group">
			                <label for="make">Make:</label>
			                <select class="form-control" id="make" name="make">
			                    <c:forEach var="make" items="${vehicleMakes}">
			                        <option value="${make.name}">${make.name}</option>
			                    </c:forEach>
		                    </select>
		              </div>      
		                 <div class="col-md-4 form-group">    
		                    <label for="model">Model:</label>
		               		<select class="form-control" id="model" name="model">
		                	
		                    <c:forEach var="model" items="${vehicleModels}">
		                        <option value="${model.modelNo}">${model.name}</option>
		                    </c:forEach>
		                	</select>
				            
		            </div>
		        </div>
		    </div><br>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-6 form-group">
		                <label for="owner">Owner:</label>
		                <select class="form-control" id="owner" name="owner">
		                    <c:forEach var="owner" items="${owners}">
		                        <option value="${owner.ownerNo}">${owner.name}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="col-md-6 form-group">
		                <label for="regNo">Registration Number:</label>
		                <input type="text" class="form-control" id="regNo" name="regNo">
		            </div>
		        </div>
		    </div><br>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-6 form-group">
		                <label for="country">Country:</label>
		                <select class="form-control" id="country" name="country" onchange="SetStates()">
		                    <c:forEach var="country" items="${countries}">
		                        <option value="${country.countryNo}">${country.country}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="col-md-6 form-group">
		                <label for="state">State:</label>
		                <select class="form-control" id="state" name="state" >
		                    <c:forEach var="state" items="${states}">
		                        <option value="${state.stateNo}">${state.stateName}</option>
		                    </c:forEach>
		                </select>
		            </div>
		        </div>
			</div>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-4">
		                <label for="chassisNumber">Chassis Number:</label>
		                <input type="text" class="form-control" id="chassisNumber" name="chassisNumber">
		            </div>
		            <div class="col-md-4">
		                <label for="year">Year:</label>
		                <input type="text" class="form-control" id="year" name="year">
		            </div>
		            <div class="col-md-4">
		                <label for="color">Color:</label>
		                <input type="text" class="form-control" id="color" name="color">
		            </div>
		        </div>
		    </div><br>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-4 form-group">
		                <label for="fuel">Fuel:</label>
		                <select class="form-control" id="fuel" name="fuel">
		                    <c:forEach var="fuel" items="${vehicleFuel}">
		                        <option value="${fuel.fuel}">${fuel.fuel}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="col-md-4 form-group">
		                <label for="capacity">Capacity:</label>
		                <select class="form-control" id="capacity" name="capacity">
		         capacityNo   <c:forEach var="capacity" items="${vehicleCapacity}">
		                        <option value="${capacity.capacity}">${capacity.capacity}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="col-md-4 form-group">
		                <label for="mileage">Mileage:</label>
		                <input type="text" class="form-control" id="mileage" name="mileage">
		            </div>
		        </div>
			</div>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-6 form-group">
		                <label for="dailyRate">Daily Rate:</label>
		                <input type="text" class="form-control" id="dailyRate" name="dailyRate">
		            </div>
		            <div class="col-md-6 form-group">
		                <label for="hourlyRate">Hourly Rate:</label>
		                <input type="text" class="form-control" id="hourlyRate" name="hourlyRate">
		            </div>
		        </div>
		    </div><br>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-6 form-group">
		                <label for="additionalDailyRate">Additional Daily Rate:</label>
		                <input type="text" class="form-control" id="additionalDailyRate" name="additionalDailyRate">
		            </div>
		            <div class="col-md-6 form-group">
		                <label for="additionalHourlyRate">Additional Hourly Rate:</label>
		                <input type="text" class="form-control" id="additionalHourlyRate" name="additionalHourlyRate">
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
		                