<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="customerpackage.User" %>
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

    h1 {
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

    .form-table input[type="text"],
    .form-table input[type="email"],
    .form-table input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }

    .form-table input[readonly] {
        background-color: #f0f0f0;
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

<%
List<User> groceryDetails = (List<User>) request.getAttribute("Grocerydetails");
User user = groceryDetails != null && !groceryDetails.isEmpty() ? groceryDetails.get(0) : null;
%>

<%
int userid = Integer.parseInt(request.getParameter("userid"));
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String username=request.getParameter("username");
String password=request.getParameter("password");



%>

<div class="container">
    <h1>Update Customer</h1>
    <form action="UpdateServlet" method="POST">
        <table class="form-table">
            <tr>
                <td><label for="userid">Customer ID:</label></td>
                <td><input type="text" id="userid" name="userid" value="<%= userid %>" readonly></td>
            </tr>
            <tr>
                <td><label for="name">Customer Name:</label></td>
                <td><input type="text" id="name" name="name" value="<%= name %>"></td>
            </tr>
            <tr>
                <td><label for="email">Customer Email:</label></td>
                <td><input type="email" id="email" name="email" value="<%= email %>"></td>
            </tr>
            <tr>
                <td><label for="phone">Customer Contact No:</label></td>
                <td><input type="text" id="phone" name="phone" value="<%= phone %>"></td>
            </tr>
            <tr>
                <td><label for="address">Customer Address:</label></td>
                <td><input type="text" id="address" name="address" value="<%= address %>"></td>
            </tr>
            <tr>
                <td><label for="username">Customer UserName:</label></td>
                <td><input type="text" id="username" name="username" value="<%= username %>" readonly></td>
            </tr>
            <tr>
                <td><label for="password">Customer Password:</label></td>
                <td><input type="password" id="password" name="password" value="<%= password %>"></td>
            </tr>
        </table>

        <div class="submit-btn">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>

</body>
</html>