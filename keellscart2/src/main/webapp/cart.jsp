<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="customerpackage.CartItem" %>
    <%@ page import="java.util.List" %>
    <%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cart-heading {
		margin-top: 20px;
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .empty-cart-message {
        text-align: center;
        color: #555;
        font-size: 1.2em;
        margin-top: 20px;
    }

    .cart-table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .cart-table th, .cart-table td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    .cart-table th {
        background-color: #007BFF;
        color: white;
    }

    .cart-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .cart-table tr:hover {
        background-color: #f1f1f1;
    }

    .cart-table .delete-button {
        padding: 8px 12px;
        background-color: #dc3545;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .cart-table .delete-button:hover {
        background-color: #c82333;
    }

    .total-price {
        text-align: center;
        font-size: 1.5em;
        margin-top: 20px;
        color: #333;
    }

    .place-order-button {
        display: block;
        width: 200px;
        margin: 20px auto;
        padding: 10px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1em;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .place-order-button:hover {
        background-color: #218838;
    }
    
    
    .back-button {
    display: block;
    width: 220px;
    margin: 20px auto;
    padding: 10px;
    background-color: #007BFF; /* Blue color */
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s ease;
	}
		
	.back-button:hover {
    background-color: #0056b3; 
	}
	
	a {
    text-decoration: none; /
	}
    
</style>
</head>
<body>
<h1 class="cart-heading">Your Cart</h1>
<%
if (session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
}
%>

<center>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        out.println("<p>Your cart is empty!</p>");
    } else {
%>
</center>
<table border="1" class="cart-table">
    <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Remove Item</th>
    </tr>
    <%
        double totalPrice = 0;
        for (CartItem item : cart) {
            double itemTotal = item.getPrice() * item.getQuantity();
            totalPrice += itemTotal;
    %>
    <tr>
        <td><%= item.getItemname() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= itemTotal %></td>
        <td>
        	<form action="CartServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="itemId" value="<%= item.getItemid() %>">
                <input type="submit" value="Delete" class="delete-button">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<p class="total-price">Total Price: <%= totalPrice %></p>
<form action="OrderServlet" method="post">
    <input type="submit" value="Place Order" class="place-order-button" />
</form>

<a href="ProductServlet">
  <button class="back-button">Go Back To Product Page</button>
</a>
<% } %>


<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>