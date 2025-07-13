<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN DASHBOARD</title>
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

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #28a745;
        padding-bottom: 10px;
    }

    .form-table {
        width: 100%;
        margin: 0 auto;
        border-collapse: collapse;
    }

    .form-table input[type="text"],
    .form-table input[type="email"],
    .form-table input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }

    .form-actions {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .form-actions input[type="submit"],
    .form-actions input[type="reset"] {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-actions input[type="reset"] {
        background-color: #dc3545;
    }

    .form-actions input:hover {
        background-color: #218838;
    }

    .form-actions input[type="reset"]:hover {
        background-color: #c82333;
    }

    .back-btn {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .back-btn button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-btn button:hover {
        background-color: #0056b3;
    }

</style>
</head>
<body>

<div class="container">
    <h1>Add New Customer</h1>
    <form action="InsertServlet" method="POST">
        <table class="form-table">
            <tr>
                <td><label for="name">Customer Name:</label></td>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr>
                <td><label for="email">Customer Email:</label></td>
                <td><input type="email" id="email" name="email"></td>
            </tr>
            <tr>
                <td><label for="phone">Customer Contact No:</label></td>
                <td><input type="text" id="phone" name="phone"></td>
            </tr>
            <tr>
                <td><label for="address">Customer Address:</label></td>
                <td><input type="text" id="address" name="address"></td>
            </tr>
            <tr>
                <td><label for="username">Customer UserName:</label></td>
                <td><input type="text" id="username" name="username"></td>
            </tr>
            <tr>
                <td><label for="password">Customer Password:</label></td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
        </table>

        <div class="form-actions">
            <input type="submit" value="Submit">
            <input type="reset" value="Clear Form">
        </div>
    </form>
</div>

</body>
</html>