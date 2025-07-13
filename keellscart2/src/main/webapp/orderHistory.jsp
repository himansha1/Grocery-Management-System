<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="customerpackage.Order" %>
<%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
<style>
.order-heading {
        text-align: center;
        margin-top: 20px;
        color: #333;
    }
	.submitd{
		background-color: red;
	}
    .back-link {
        display: inline-block;
        margin: 20px 0;
        color: white;
        background-color: #007BFF;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        text-align: center;
    }

    .back-link:hover {
        background-color: #0056b3;
    }

    .order-table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        background-color: white;
    }

    .order-table th, .order-table td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    .order-table th {
        background-color: #007BFF;
        color: white;
    }

    .order-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .order-table tr:hover {
        background-color: #f1f1f1;
    }

    .order-table td button {
        padding: 8px 16px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .order-table td button:hover {
        background-color: #218838;
    }

    .order-table td .delete-btn {
        background-color: #dc3545;
    }

    .order-table td .delete-btn:hover {
        background-color: #c82333;
    }

    .action-forms {
        display: inline-block;
        margin: 0 5px;
    }


</style>
</head>
<body>
<h1 class="order-heading">Your Order History</h1>

<center><a href="ProductServlet" class="back-link">Back to Products</a></center>

<table border="1" class="order-table">
    <tr>
        <th>Order ID</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Order Date</th>
        <th>Modifications</th> <!-- New column for actions -->
    </tr>
    <%
        List<Order> orderHistory = (List<Order>) request.getAttribute("orderHistory");
        if (orderHistory == null || orderHistory.isEmpty()) {
            out.println("<tr><td colspan='6'>You have no order history.</td></tr>");
        } else {
            for (Order order : orderHistory) {
    %>
    <tr>
        <td><%= order.getOrderid() %></td>
        <td><%= order.getItemname() %></td>
        <td><%= order.getQuantity() %></td>
        <td><%= order.getTotal() %></td>
        <td><%= order.getOrderDate() %></td>
        <td>
            <form action="cupdateorder.jsp" method="get" class="action-forms">
                <input type="hidden" name="orderid" value="<%= order.getOrderid() %>" />
                <input type="hidden" name="itemname" value="<%= order.getItemname()%>"/>
                <input type="hidden" name="quantity" value="<%= order.getQuantity() %>" />
                <input type="hidden" name="total" value="<%= order.getTotal() %>" />
                <input type="hidden" name="orderDate" value="<%= order.getOrderDate() %>" />
                <input type="hidden" name="unitPrice" value="<%= order.getTotal() / order.getQuantity() %>"/>
                
                <button type="submit">Update</button>
                
               </form>
               
                <form action="DeleteCustomerOrderServlet" method="post" class="action-forms">
                <input type="hidden" name="orderid" value="<%= order.getOrderid() %>" />
                <button type="submit" class="submitd">Delete</button>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>