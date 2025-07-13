<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Order</title>

<!-- Update Script -->
<script type="text/javascript">
// Function to update the total price based on quantity
function updateTotal() {
    var quantity = document.getElementById("quantity").value;
    var unitPrice = document.getElementById("unitPrice").value;
    
    // Ensure quantity and unit price are valid before calculating the total
    if (quantity && unitPrice) {
        var total = quantity * unitPrice;
        document.getElementById("total").value = total.toFixed(2);
    }
}

// Function to set the current system date for the orderDate field
function setSystemDate() {
    var today = new Date(); 
    var formattedDate = today.getFullYear() + "-" + 
    String(today.getMonth() + 1).padStart(2, '0') + "-" +
    String(today.getDate()).padStart(2, '0') + "T" +
    String(today.getHours()).padStart(2, '0') + ":" +
    String(today.getMinutes()).padStart(2, '0');
    document.getElementById("orderDate").value = formattedDate;
}
</script>

<style>
.container {
        font-family: Arial, sans-serif;
        background-color: ;
        padding: 20px;
        border-radius: 8px;
        max-width: 600px;
        margin: 20px auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        text-align: center;
        color: #333;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .form-group input[type="number"],
    .form-group input[type="text"],
    .form-group input[type="date"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-group input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s ease;
    }

    .form-group input[type="submit"]:hover {
        background-color: #218838;
    }

    .back-link {
        display: block;
        margin-top: 20px;
        text-align: center;
        color: #007BFF;
        text-decoration: none;
        font-size: 1em;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

</head>
<body onload="setSystemDate()"> <!-- Load system date on page load -->

<div class="container">
        <h1 class="header">Update Order</h1>

        <form action="CustomerUpdateOrderServlet" method="post">
            <div class="form-group">
                <label>Order ID</label>
                <input type="number" name="orderid" value="<%= request.getParameter("orderid") %>" readonly/>
            </div>
            
            <div class="form-group">
                <label>Item Name</label>
                <input type="text" name="itemname" value="<%= request.getParameter("itemname") %>" readonly/>
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" min="1" name="quantity" value="<%= request.getParameter("quantity") %>" required oninput="updateTotal()"/>
            </div>

            <div class="form-group">
                <label for="total">Total:</label>
                <input type="text" id="total" name="total" value="<%= request.getParameter("total") %>" readonly/>
            </div>

            <div class="form-group">
                <label for="orderDate">Update Order Date (System Generated):</label>
                <input type="datetime" id="orderDate" name="orderDate" readonly/>
            </div>

            <input type="hidden" id="unitPrice" name="unitPrice" value="<%= request.getParameter("unitPrice") %>"/>
            
            <div class="form-group">
                <input type="submit" value="Update">
            </div>
        </form>

        <a href="OrderHistoryServlet" class="back-link">Back to Order History</a>
    </div>

<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>

