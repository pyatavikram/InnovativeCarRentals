<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*,java.time.LocalDate" %>
<c:choose>
<c:when test="${empty sessionScope.customer}">
	Login First
</c:when>

<c:when test="${not empty param.Payment}">
    <c:if test="${param.Payment eq 'processing'}">
        <%
            RentalDetailsServices rentalsService = new RentalDetailsServices();
            Rentals rental = new Rentals();
            rental.setReservationDate(LocalDate.now()); 
            try
            {
	            LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
	            LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
	            rental.setStartDate(startDate);
           		rental.setEndDate(endDate);
            
            Customers customer = (Customers) session.getAttribute("customer");
            rental.setCustomer(customer);

            int vehicleNo = Integer.parseInt(request.getParameter("VehicleNo"));
            Vehicles vehicle  = rentalsService.findVehicleById(vehicleNo);
            CityServices cityServices=new CityServices();
            rental.setSourceLocation(cityServices.Find(Integer.parseInt(request.getParameter("cityNoFrom")))) ;
            rental.setDestinationLocation(cityServices.Find(Integer.parseInt(request.getParameter("cityNoTo")))) ;
            
            rental.setVehicle(vehicle);
           
			rental.setStatus("Processing");
			
			rental.setTravelPurpose(request.getParameter("travelpurpose"));
			rental.setNoOfDays(Integer.parseInt(request.getParameter("NoofDays")));
			rental.setState(new StateServices().Find(Integer.parseInt(request.getParameter("stateNo"))));
			rental.setVehicleRate(Integer.parseInt(request.getParameter("dailyRate")));
			rental.setAmount(Integer.parseInt(request.getParameter("totalAmount")));
			
			rentalsService.addRental(rental);
			session.setAttribute("Vehicles",vehicle);
			session.setAttribute("Totalamount",request.getParameter("totalAmount"));
            session.setAttribute("rentalDetails", rental);
            }catch(Exception ex)
            {
            	ex.printStackTrace();
            }
            response.sendRedirect("Payment.jsp");
        %>
    </c:if>
    <c:if test="${param.Payment eq 'Completed'}">
        <%
            Rentals rental = (Rentals) session.getAttribute("rentalDetails");

            rental.setStatus("Completed");

            RentalDetailsServices rentalsService = new RentalDetailsServices();
            rentalsService.updateRental(rental);

            response.sendRedirect("ConfirmationPage.jsp");
        %>
    </c:if>
</c:when>

<c:when test="${not empty sessionScope.customer}">
			<!DOCTYPE html>
			<html lang="en">
			<%
			    VehicleDetailsServices services= new VehicleDetailsServices();
				Vehicles vehicle=services.Find(Integer.parseInt(request.getParameter("VehicleNo")));     
				request.setAttribute("Vehicles", vehicle);
				request.setAttribute("States",services.getAllStates());
				request.setAttribute("Cities",services.getAllCities());
			    String base64Image = Base64.getEncoder().encodeToString((byte[]) vehicle.getPicture());
			    request.setAttribute("base64Image", base64Image);
			%>
			<head>
			    <meta charset="UTF-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1.0">
			    <title>Vehicle Reservation</title>
			    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			    <style>
			       .vehicle-image {
			           height: 250px;
			           width: 100%;
			           object-fit: cover;
			           border-radius: 8px;
			           box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			       }
			
			       .image-wrapper {
			           position: relative;
			           max-width: 350px;
			           margin: auto;
			           margin-bottom: 20px;
			       }
			
			       .booknow-btn {
			           position: absolute;
			           bottom: 10px;
			           left: 50%;
			           transform: translateX(-50%);
			           padding: 10px 20px;
			       }
			
			       .details-container {
			           max-height: 500px;
			           overflow-y: auto;
			           margin-top: 20px;
			           padding: 20px;
			           border: 1px solid #ddd;
			           border-radius: 8px;
			           background-color: #f9f9f9;
			       }
			
			       .containerInnov {
			           margin-top: 20px;
			       }
			   </style>
			</head>
			
			<body>
			<form action="RentalDetails.jsp?Payment=processing&VehicleNo=${Vehicles.vehicleNo }" method="post">
				<c:if test="${session.customer !='null' }">
			   <div class="container containerInnov">
			       <div class="row">
			           <div class="col-md-4">
			               <div class="image-wrapper">
			                   <a href="data:image/jpeg;base64,${base64Image}" target="_blank">
			                       <img src="data:image/jpeg;base64,${base64Image}" class="vehicle-image" alt="Vehicle Image">
			                   </a>
			               </div>
			           </div>
			           <div class="col-md-8">
			               <div class="details-container">
			                   <div class="mb-4">
			                       <h2 class="text-xl font-semibold mb-2">Rental Details</h2>
			                       <div class="row">
			                           <div class="col-md-6">
			                               <label class="block text-zinc-700">Customer:</label>
			                               <p class="bg-zinc-100 p-2 rounded">${sessionScope.customer.username }</p>
			                           </div>
			                           <div class="col-md-6">
			                               <label class="block text-zinc-700">Vehicle:</label>
			                               <p class="bg-zinc-100 p-2 rounded">UR02398742</p>
			                           </div>
			                       </div>
			                   </div>
			                   <div class="mb-4">
			                       <h2 class="text-xl font-semibold mb-2">Reservation Details</h2>
			                       <div class="row">
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">Start Date:</label>
			                               <input type="date" id="startDate" name="startDate" class="form-control" onchange="calculateDaysAndRate()">
			                           </div>
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">End Date:</label>
			                               <input type="date" id="endDate" name="endDate" class="form-control" onchange="calculateDaysAndRate()">
			                           </div>
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">Rate per Day:</label>
			                               <input type="number" id="ratePerDay" name="dailyRate" value="${Vehicles.dailyRate}" class="form-control" onchange="calculateDaysAndRate()" readonly>
			                           </div>
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">Days:</label>
			                               <input type="text" id="days" name="NoofDays" class="form-control" readonly>
			                           </div>
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">Total Rate:</label>
			                               <input type="text" id="totalRate" name="totalAmount" class="form-control" readonly>
			                           </div>
			                       </div>
			                   </div>
			                   <div class="mb-4">
			                       <h2 class="text-xl font-semibold mb-2">Location Details</h2>
			                       <div class="row">
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">From</label>
			                               <div class="row">
			                                   <div class="col-md-6 mb-2">
			                                       <label class="block text-zinc-700">State:</label>
			                                       <select class="form-control" name="stateNo">
			                                           <option>-- Please Select --</option>
			                                           <c:forEach items="${States}" var="c">
															<option value="${c.stateNo }">${c.stateName}</option>                                            
			                                           </c:forEach>
			                                       </select>
			                                   </div>
			                                   <div class="col-md-6 mb-2">
			                                       <label class="block text-zinc-700">City:</label>
			                                       <select class="form-control" name="cityNoFrom">
			                                           <option>-- Please Select --</option>
			                                           <c:forEach items="${Cities}" var="c">
															<option value="${c.cityNo}">${c.cityName}</option>                                            
			                                           </c:forEach>
			                                       </select>
			                                   </div>
			                               </div>
			                           </div>
			                           <div class="col-md-6 mb-2">
			                               <label class="block text-zinc-700">To</label>
			                               <div class="row">
			                                   <div class="col-md-6 mb-2">
			                                       <label class="block text-zinc-700">State:</label>
			                                       <select class="form-control">
			                                           <option>-- Please Select --</option>
			                                           <c:forEach items="${States}" var="c">
															<option>${c.stateName}</option>                                            
			                                           </c:forEach>
			                                       </select>
			                                   </div>
			                                   <div class="col-md-6 mb-2">
			                                       <label class="block text-zinc-700">City:</label>
			                                       <select class="form-control" name="cityNoTo">
			                                           <option>-- Please Select --</option>
			                                           <c:forEach items="${Cities}" var="c">
															<option value="${c.cityNo}">${c.cityName}</option>                                            
			                                           </c:forEach>
			                                       </select>
			                                   </div>
			                               </div>
			                           </div>
			                       </div>
			                   </div>
			                   <div class="mb-4">
			                       <h2 class="text-xl font-semibold mb-2">Travel Purpose</h2>
			                       <textarea class="form-control" name="travelpurpose" rows="3"></textarea>
			                   </div>
			                   <div class="text-right">
			                       <button class="btn btn-primary">Google Checkout</button>
			                   </div>
			               </div>
			           </div>
			       </div>
			   </div>
			   </c:if>
				</form>
			    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
			    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
			    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
			    <script src="calculateRate.js"></script>
			</body>
			
			</html>
</c:when>
</c:choose>