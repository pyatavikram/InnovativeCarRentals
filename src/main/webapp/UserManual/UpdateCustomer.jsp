<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>
<%
    CustomerServices customerService = new CustomerServices();
    try {
        int customerNo = Integer.parseInt(request.getParameter("customerNo"));
        Customers customer = customerService.findCustomer(customerNo);
        
        if (customer != null) {
            customer.setName(request.getParameter("customerName"));
            customer.setPhoneNumber(request.getParameter("phoneNumber"));
            customer.setEmailAddress(request.getParameter("emailAddress"));
            customer.setUsername(request.getParameter("username"));
            customer.setPassword(request.getParameter("password"));
            customer.setAddressLine1(request.getParameter("addressLine1"));
            customer.setAddressLine2(request.getParameter("addressLine2"));
            customer.setCountry(new CountryServices().Find(Integer.parseInt(request.getParameter("country"))));
            customer.setState(new StateServices().Find(Integer.parseInt(request.getParameter("state"))));
            customer.setCity(new CityServices().Find(Integer.parseInt(request.getParameter("city"))));
            
            customerService.updateCustomer(customer);
            
            HttpSession sessions = request.getSession();
            sessions.setAttribute("customer", customer);
            response.sendRedirect("Homepage.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("EditProfile.jsp?customerNo=" + request.getParameter("customerNo"));
    } finally {
        customerService.close();
    }
%>
