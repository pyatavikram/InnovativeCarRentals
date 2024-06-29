<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.iss.models.*,com.iss.Services.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservations</title>
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
        <a class="navbar-brand" href="#">Reservation Management</a>
        <div class="navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/CarRental"><i class="fas fa-home"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addReservation.jsp"><i class="fas fa-plus"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-cog"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
        <div class="container">
            <a class="navbar-brand" href="#"> View Reservations For ${PageName}</a>
        </div>
    </nav>
    <form action="Countries.jsp?action=search" method="post">
        <div class="input-group mb-3">
            <input type="text" id="t1" name="search" class="form-control" placeholder="Search Reservations" aria-label="Search Reservations">
            <div class="input-group-append">
                <button type="submit" ><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Reg. No</th>
                    <th>Reservation Date</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${Reservations}" var="r">
                    <tr>
                        <td>${r.rentalNo}</td>
                        <td>${r.reservationDate}</td>
                        <td>${r.startDate}</td>
                        <td>${r.endDate}</td>
                        <td>${r.sourceLocation.cityName}</td>
                        <td>${r.destinationLocation.cityName}</td>
                        <td>${r.amount}</td>
                        <td>
                            <span>
					                <a href="editCountry.jsp?id=${c.countryNo}" class="btn btn-sm btn-warning mr-2"><i class="fas fa-edit"></i></a>
					                <a href="Countries.jsp?id=${c.countryNo}&action=delete" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
					         </span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

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
