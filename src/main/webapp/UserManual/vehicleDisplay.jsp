<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    VehicleDetailsServices detailsService = new VehicleDetailsServices();
%>


    <c:choose>
        <c:when test="${empty param.page}">
        	<div class="col-9">
            <div class="row">
                <c:forEach items="${VehicleTypes}" var="vehicleType">
                    <div class="col-md-6 mt-3">
                        <h6 class="card-header">${vehicleType.type}</h6>
                        <div class="scrollable-images">
                            <c:set var="currentType" scope="request" value="${vehicleType.type}" />
                            <%
                                List<Vehicles> vehicles = detailsService.getDataWithString((String) request.getAttribute("currentType"));
                                request.setAttribute("Vehicles", vehicles);
                            %>
                            <c:forEach items="${Vehicles}" var="vehicle">
                                <c:set var="Picture" scope="request" value="${vehicle.picture}" />
                                <%
                                    String base64Image = Base64.getEncoder().encodeToString((byte[]) request.getAttribute("Picture"));
                                    request.setAttribute("base64Image", base64Image);
                                %>
                                <div class="image-wrapper">
                                    <a href="Homepage.jsp?page=VehicleImage&VehicleNo=${vehicle.vehicleNo}">
                                        <img src="data:image/jpeg;base64,${base64Image}" class="vehicle-image" alt="Vehicle Image">
                                    </a><br>
                                   
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </div>
        </c:when>
	        <c:when test="${param.page eq 'VehicleImage'}">
	        <%
	            Vehicles vehicle = new VehicleDetailsServices().Find(Integer.parseInt(request.getParameter("VehicleNo")));
	            request.setAttribute("VehicleDetails", vehicle);
	        %>
	        
	        	
	            <div class="col-9">
	               
	                <c:set var="Picture" scope="request" value="${VehicleDetails.picture}" />
	                <%
	                    String base64Image = Base64.getEncoder().encodeToString((byte[]) request.getAttribute("Picture"));
	                    request.setAttribute("base64Image", base64Image);
	                %>
	                <div class="image-wrapper">
	                    <a href="data:image/jpeg;base64,${base64Image}">
	                        <img src="data:image/jpeg;base64,${base64Image}" class="vehicle-Outerimage" alt="Vehicle Image">
	                    </a>
	                    <form action="Homepage.jsp?page=Rental&VehicleNo=${VehicleDetails.vehicleNo }" method="post">
							<button class="button" style="--clr: #00ad54;">
							    <span class="button-decor"></span>
							    <div class="button-content">
							        <div class="button__icon">
							            <svg viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" width="24">
							                <circle opacity="0.5" cx="25" cy="25" r="23" fill="url(#icon-payments-cat_svg__paint0_linear_1141_21101)"></circle>
							                <mask id="icon-payments-cat_svg__a" fill="#fff">
							                    <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z">
							                    </path>
							                </mask>
							                <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z" fill="#fff"></path>
							                <path d="M25.958 20.962l-1.47-1.632 1.47 1.632zm2.067.109l-1.632 1.469 1.632-1.469zm-.109 2.068l-1.469-1.633 1.47 1.633zm-5.154 4.638l-1.469-1.632 1.469 1.632zm-.276 1.841l-1.883 1.13 1.883-1.13zM34.42 15.93l-2.084-.695 2.084.695zm-19.725 6.42l18.568-6.189-1.39-4.167-18.567 6.19 1.389 4.166zm5.265 1.75l-5.12-3.072-2.26 3.766 5.12 3.072 2.26-3.766zm2.072 3.348l5.394-4.854-2.938-3.264-5.394 4.854 2.938 3.264zm5.394-4.854a.732.732 0 01-1.034-.054l3.265-2.938a3.66 3.66 0 00-5.17-.272l2.939 3.265zm-1.034-.054a.732.732 0 01.054-1.034l2.938 3.265a3.66 3.66 0 00.273-5.169l-3.265 2.938zm.054-1.034l-5.154 4.639 2.938 3.264 5.154-4.638-2.938-3.265zm1.023 12.152l-3.101-5.17-3.766 2.26 3.101 5.17 3.766-2.26zm4.867-18.423l-6.189 18.568 4.167 1.389 6.19-18.568-4.168-1.389zm-8.633 20.682c1.61 2.682 5.622 2.241 6.611-.725l-4.167-1.39a.732.732 0 011.322-.144l-3.766 2.26zm-6.003-8.05a3.66 3.66 0 004.332-.419l-2.938-3.264a.732.732 0 01.866-.084l-2.26 3.766zm3.592-1.722a3.66 3.66 0 00-.69 4.603l3.766-2.26c.18.301.122.687-.138.921l-2.938-3.264zm11.97-9.984a.732.732 0 01-.925-.926l4.166 1.389c.954-2.861-1.768-5.583-4.63-4.63l1.39 4.167zm-19.956 2.022c-2.967.99-3.407 5.003-.726 6.611l2.26-3.766a.732.732 0 01-.145 1.322l-1.39-4.167z" fill="#fff" mask="url(#icon-payments-cat_svg__a)"></path>
							                <defs>
							                    <linearGradient id="icon-payments-cat_svg__paint0_linear_1141_21101" x1="25" y1="2" x2="25" y2="48" gradientUnits="userSpaceOnUse">
							                        <stop stop-color="#fff" stop-opacity="0.71"></stop>
							                        <stop offset="1" stop-color="#fff" stop-opacity="0"></stop>
							                    </linearGradient>
							                </defs>
							            </svg>
							        </div>
							        <span class="button__text">BookNow</span>
							    </div>
							</button>
						</form>
	                </div>
	                <div style="height: 320px; overflow-y: auto;">
					    <table class="table">
					        <tr>
					            <th>Model:</th>
					            <td>${VehicleDetails.vehiclemodels.modelNo}</td>
					        </tr>
					        <tr>
					            <th>Make:</th>
					            <td>${VehicleDetails.vehiclemodels.name}</td>
					        </tr>
					        <tr>
					            <th>Color:</th>
					            <td>${VehicleDetails.color}</td>
					        </tr>
					        <tr>
					            <th>Capacity:</th>
					            <td>${VehicleDetails.capacity}</td>
					        </tr>
					        <tr>
					            <th>Fuel:</th>
					            <td>${VehicleDetails.fuel}</td>
					        </tr>
					        <tr>
					            <th>Mileage:</th>
					            <td>${VehicleDetails.mileage}</td>
					        </tr>
					        <tr>
					            <th>Daily Rate:</th>
					            <td>${VehicleDetails.dailyRate}</td>
					        </tr>
					        <tr>
					            <th>Additional Daily Rate:</th>
					            <td>${VehicleDetails.additionalDailyRate}</td>
					        </tr>
					        <tr>
					            <th>Hourly Rate:</th>
					            <td>${VehicleDetails.hourlyRate}</td>
					        </tr>
					        <tr>
					            <th>Additional Hourly Rate:</th>
					            <td>${VehicleDetails.additionalHourlyRate}</td>
					        </tr>
					    </table>
					    
						
					    
					</div>

	            </div>
	      
	    </c:when>
        <c:otherwise>
            <div class="col-9">
                <h6 class="card-header">${param.page}</h6>
                <c:set var="LongImage" scope="request" value="${param.page}" />
                <%
                    List<Vehicles> vehicles = detailsService.getDataWithString((String) request.getAttribute("LongImage"));
                    request.setAttribute("Vehicles", vehicles);
                %>
                <div class="scrollable-Innerimages">
                    <c:forEach items="${Vehicles}" var="vehicle">
                        <c:set var="Picture" scope="request" value="${vehicle.picture}" />
                        <%
                            String base64Image = Base64.getEncoder().encodeToString((byte[]) request.getAttribute("Picture"));
                            request.setAttribute("base64Image", base64Image);
                        %>
                        <div class="image-wrapper">
                            <a href="Homepage.jsp?page=VehicleImage&VehicleNo=${vehicle.vehicleNo}">
                                <img src="data:image/jpeg;base64,${base64Image}" class="vehicle-Innerimage" alt="Vehicle Image">
                            </a>
                            <p>${vehicle.vehiclemodels.name}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
