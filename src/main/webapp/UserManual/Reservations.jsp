<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>



<!DOCTYPE html>
<html>
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
	<div class="scroll-pane" style="width:1150px;">
		<div class="container containerInnov">
			<div class="row">
		        <div class="col-md-12">
		        	<h6 class="card-header">Reservations (In Next 2Days)</h6>
		        	<div class="table-responsive" style="height:150px">
		        	
		        	<%
		        		RentalDetailsServices services=new RentalDetailsServices();
		        		request.setAttribute("ReservationsForNext2Days", services.ReservationsForNext2Days(Integer.parseInt(request.getParameter("customerNo"))));
		        	%>
		        	
	            		<table class="table table-bordered table-hover" >
	            		
	            		
							<tr>
								<th>Reg.No</th>
								<th>Reservations</th>
								<th>From</th>
								<th>To</th>
								<th>Source</th>
								<th>Destination</th>
								<th>Amount</th>
							</tr>
							<c:forEach items="${ReservationsForNext2Days}" var="r">
								<tr>
									<td>${r.rentalNo}</td>
									<td>${r.reservationDate }</td>
									<td>${r.startDate}</td>
									<td>${r.endDate}</td>
									<td>${r.sourceLocation.cityName}</td>
									<td>${r.destinationLocation.cityName}</td>
									<td>${r.amount }</td>
								</tr>
							</c:forEach>
						</table>
					</div>	
					<h6 class="card-header">Reservations</h6>
					
					<%
						request.setAttribute("CustomerNo",Integer.parseInt(request.getParameter("customerNo")));
		        		request.setAttribute("Reservations", services.Reservations(Integer.parseInt(request.getParameter("customerNo"))));
		        	%>
					
		        	<div class="table-responsive" style="height:150px">
	            		<table class="table table-bordered table-hover" >
							<tr>
								<th>Reg.No</th>
								<th>Reservations</th>
								<th>From</th>
								<th>To</th>
								<th>Source</th>
								<th>Destination</th>
								<th>Amount</th>
								<th></th>
							</tr>
							<c:forEach items="${Reservations}" var="r">
								<tr>
									<td>${r.rentalNo}</td>
									<td>${r.reservationDate }</td>
									<td>${r.startDate}</td>
									<td>${r.endDate}</td>
									<td>${r.sourceLocation.cityName}</td>
									<td>${r.destinationLocation.cityName}</td>
									<td>
										<span>${r.amount }</span>
									</td>
									<td>
										<span><a href="Homepage.jsp?page=Reservations&action=Delete&RentalNo=${r.rentalNo}&customerNo=${CustomerNo}">&#10006;</a></span>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<h6 class="card-header">Rented</h6>
		        	<div class="table-responsive" style="height:150px">
		        	
		        	<%
	        		request.setAttribute("Rented", services.Rented(Integer.parseInt(request.getParameter("customerNo"))));
		        	%>
	            		<table class="table table-bordered table-hover" >
							<tr>
								<th>Reg.No</th>
								<th>Reservations</th>
								<th>From</th>
								<th>To</th>
								<th>Source</th>
								<th>Destination</th>
								<th>Amount</th>
							</tr>
							
							<c:forEach items="${Rented}" var="r">
								<tr>
									<td>${r.rentalNo}</td>
									<td>${r.reservationDate }</td>
									<td>${r.startDate}</td>
									<td>${r.endDate}</td>
									<td>${r.sourceLocation.cityName}</td>
									<td>${r.destinationLocation.cityName}</td>
									<td>${r.amount }</td>
								</tr>
							</c:forEach>
							
						</table>
					</div>
					
					
					<h6 class="card-header">Cancellations</h6>
		        	<div class="table-responsive" style="height:150px">
		        	
		        	<%
		        		request.setAttribute("CancelledReservations", services.CancelledReservations(Integer.parseInt(request.getParameter("customerNo"))));
		        		services.close();
		        	%>
		        	
	            		<table class="table table-bordered table-hover" >
							<tr>
								<th>Reg.No</th>
								<th>Reservations</th>
								<th>From</th>
								<th>To</th>
								<th>Source</th>
								<th>Destination</th>
								<th>Amount</th>
							</tr>
							
							<c:forEach items="${CancelledReservations}" var="r">
								<tr>
									<td>${r.rentalNo}</td>
									<td>${r.reservationDate }</td>
									<td>${r.startDate}</td>
									<td>${r.endDate}</td>
									<td>${r.sourceLocation.cityName}</td>
									<td>${r.destinationLocation.cityName}</td>
									<td>${r.amount }</td>
								</tr>
							</c:forEach>
							
						</table>
					</div>
					
					
         		</div>
	        </div>
		</div>
		</div>
</body>
</html>