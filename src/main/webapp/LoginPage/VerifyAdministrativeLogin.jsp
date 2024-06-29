<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Employees employee = new EmployeeServices().VerifyLoginDetails(username, password);
     
            if(employee!=null)
            {
                HttpSession sessions = request.getSession();
                sessions.setAttribute("employee", employee);
                response.sendRedirect("/CarRental");
            } else {
                response.sendRedirect("loginpage.jsp?error=invalid");
            }
        %>
</body>
</html>