<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
        width: 100%;
        max-width: 600px;
        margin: 30px auto;
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #007BFF;
        padding-bottom: 10px;
    }

    .form-table {
        width: 100%;
        margin: 0 auto;
        border-collapse: collapse;
    }

    .form-table td {
        padding: 10px;
        vertical-align: middle;
    }

    .form-table input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }

    .submit-btn {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .submit-btn input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .submit-btn input[type="submit"]:hover {
        background-color: #0056b3;
    }
    
</style>
</head>
<body>

<div class="container">
    <h2>Admin Add New Order</h2>
    <form action="OrderInsertServlet" method="post">
        <table class="form-table">
            <tr>
                <td><label for="orderId">Order ID:</label></td>
                <td><input type="text" id="orderId" name="orderId"></td>
            </tr>
            <tr>
                <td><label for="cusId">Customer ID:</label></td>
                <td><input type="text" id="cusId" name="cusId"></td>
            </tr>
            <tr>
                <td><label for="itemId">Item ID:</label></td>
                <td><input type="text" id="itemId" name="itemId"></td>
            </tr>
            <tr>
                <td><label for="quantity">Quantity:</label></td>
                <td><input type="text" id="quantity" name="quantity"></td>
            </tr>
            <tr>
                <td><label for="total">Total:</label></td>
                <td><input type="text" id="total" name="total"></td>
            </tr>
            <tr>
                <td><label for="date">Order Date:</label></td>
                <td><input type="text" id="date" name="date"></td>
            </tr>
        </table>

        <div class="submit-btn">
            <input type="submit" value="Add Order">
        </div>
    </form>
</div>

</body>
</html>