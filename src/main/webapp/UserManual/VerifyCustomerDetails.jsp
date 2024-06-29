<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
    <c:if test="${param.login eq 'login'}">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Customers customer = new CustomerServices().VerifyLoginDetails(username, password);
     
            if(customer!=null)
            {
                HttpSession sessions = request.getSession();
                sessions.setAttribute("customer", customer);
                response.sendRedirect("Homepage.jsp");
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }
        %>
    </c:if>

</body>
</html>
