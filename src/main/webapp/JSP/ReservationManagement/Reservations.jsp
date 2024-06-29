<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<%
	String Page=request.getParameter("page");
	if(Page!=null)
	{
	    ReservationServices reservationService = new ReservationServices();
	    List<Rentals> reservations=null;
		if(Page.equals("Today"))
		{
		     reservations= reservationService.ReservationsForToday();
		}
		else if(Page.equals("Tommorow"))
		{
			reservations = reservationService.ReservationsForTommorow();
		}
		else if(Page.equals("ThisMonth"))
		{
			reservations = reservationService.ReservationsForThisMonth();
		}
		else if(Page.equals("NextMonth"))
		{
			reservations = reservationService.ReservationForNextMonth();
		}
		else if(Page.equals("7Days"))
		{
			reservations = reservationService.ReservationForNext7Days();
		}
		
		if (reservations != null) {
			request.setAttribute("PageName",Page);
	        request.setAttribute("Reservations", reservations);
	    }
	    reservationService.close(); 
	}
%>
<jsp:include page="ReservationDisplay.jsp"></jsp:include>