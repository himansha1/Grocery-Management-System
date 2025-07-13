<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order-heading {
        color: #28a745;
        margin-top: 50px;
        font-size: 2em;
    }

    .continue-shopping {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1em;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .continue-shopping:hover {
        background-color: #0056b3;
    }

    .order-message {
        margin-top: 30px;
        color: #555;
        font-size: 1.2em;
    }
</style>
</head>
<body>

<center>
<h1 class="order-heading">Your Order Has Been Placed!</h1>
<p class="order-message">Thank you for shopping with us. We will process your order shortly.</p>
<a href="ProductServlet" class="continue-shopping">Continue Shopping</a>
</center>


<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>