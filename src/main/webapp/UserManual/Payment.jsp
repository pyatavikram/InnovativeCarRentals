<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.iss.models.*, com.iss.Services.*, com.razorpay.*, java.time.LocalDateTime, java.util.logging.Logger" %>
<%!
    private static final Logger LOGGER = Logger.getLogger("PaymentPage");
%>

<%
    RazorpayService services = new RazorpayService();
    Order order = services.createOrder(Integer.parseInt(""+session.getAttribute("Totalamount")), "ReceiptId");

    String orderId = order.get("id");
    session.setAttribute("orderId", orderId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #1a73e8;
            border-color: #1a73e8;
        }
        .btn-primary:hover {
            background-color: #0f65d2;
            border-color: #0f65d2;
        }
        .btn-primary:focus {
            box-shadow: 0 0 0 0.2rem rgba(26,115,232,0.5);
        }
        .card {
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2 class="text-center mb-4">Payment Page</h2>
        </div>
        <div class="card-body">
            <div class="form-group">
            	 OrderId:<input type="text" class="form-control" id="orderId" name="orderId" value="${sessionScope.orderId}" readonly><br>
                 PhoneNumber:<input type="text" class="form-control" id="phoneno" name="phoneno" value="${sessionScope.customer.phoneNumber }" readonly><br>
                 Name:<input type="text" class="form-control" id="name" name="name" value="${sessionScope.customer.name }" readonly><br>
                 Email:<input type="text" class="form-control" id="email" name="email" value="${sessionScope.customer.emailAddress }" readonly><br>
                <label for="amount">Amount</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">$</span>
                    </div>
                   
                    <input type="number" class="form-control" id="amount" name="amount" value="${sessionScope.Totalamount}" readonly><br>
                </div>
            </div>
            <button type="button" id="rzp-button1" class="btn btn-primary btn-block">Submit Payment</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var options = {
        "key": "rzp_test_IA5gXxxWfzsqFs",
        "amount": document.getElementById("amount").value * 100,
        "currency": "INR",
        "name":"InnovativeCarRental",
        "description": "Test Transaction",
        "order_id": document.getElementById("orderId").value,
        "handler": function(response) {
            window.location.href = "ConfirmationPage.jsp"
        },
        "prefill": {
            "name": document.getElementById("name").value,
            "email": document.getElementById("email").value,
            "contact": document.getElementById("phoneno").value
        },
        "theme": {
            "color": "#3399ff"
        },
        "modal": {
            "ondismiss": function() {
                window.location.href = "Payment.jsp?status=failed";
            }
        }
    };
    var rzp1 = new Razorpay(options);

    document.getElementById('rzp-button1').onclick = function(e) {
        rzp1.open();
        e.preventDefault();
    }
});
</script>

</body>
</html>
