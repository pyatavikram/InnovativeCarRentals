<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>




<%
   
	StateServices stateService = new StateServices();

	if(request.getParameter("action")!=null)
	{
		if(request.getParameter("action").equals("update"))
		{
			int id = Integer.parseInt(request.getParameter("referenceId"));
	        String Name = request.getParameter("stateName");
	        Integer CountryNo = Integer.parseInt(request.getParameter("countryid"));
	        
	        CountryServices services=new CountryServices();
	        Countries country=services.Find(CountryNo);
	        services.closeEntityManagerFactory();
	        
	        States state = new States();
	        state.setStateNo(id);
	        state.setStateName(Name);
	        
	        state.setCountry(country);
	        
	        stateService.updateState(state);
	        response.sendRedirect("States.jsp");
		}
		else if(request.getParameter("action").equals("delete"))
		{
			if(request.getParameter("referenceId")!=null)
			{
				int ID = Integer.parseInt(request.getParameter("referenceId"));
				States temp=new States();
				temp.setStateNo(ID);
				stateService.deleteState(temp);
				 response.sendRedirect("States.jsp");
			}
		}
		else if(request.getParameter("action").equals("search"))
		{
			System.out.print("true");
			List<States> list=stateService.search(request.getParameter("search"));
			request.setAttribute("states",list);
			stateService.closeEntityManagerFactory();
		}
	}
	else
	{
	    List<States> states = stateService.getAll();
	    request.setAttribute("states", states);
	    stateService.closeEntityManagerFactory();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>States</title>
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
        .form-floating input[type="text"] {
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Location Management</a>
            <div class="navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addState.jsp"><i class="fas fa-plus"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp"><i class="fas fa-cog"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
            <div class="container">
                <a class="navbar-brand" href="#">State Details</a>
            </div>
        </nav>

	<form action="States.jsp?action=search" method="post">
		
        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search States" aria-label="Search States">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
	</form>
		
        <div class="table-responsive" style="height:340px">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>State</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${states}" var="c">
                    	
					    <tr>
					        <td class="d-flex justify-content-between">
					            <span>${c.stateName}</span>
					            <span>
					            <a href="editState.jsp?referenceId=${c.stateNo}" class="btn btn-sm btn-warning mr-2"><i class="fas fa-edit"></i></a>
                                <a href="States.jsp?referenceId=${c.stateNo}&action=delete" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
                            </span>
					        </td>
					    </tr>
					</c:forEach>

                </tbody>
            </table>
        </div>

     </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>Copyright © Innovative Car Rental System. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
