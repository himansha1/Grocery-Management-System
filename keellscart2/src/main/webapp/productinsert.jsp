<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Style.css">
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

    .form-table input[type="text"] {
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
    <h1>ADD NEW PRODUCT</h1>
    <form action="Productinsert" method="POST">
        <table class="form-table">
            <tr>
                <td><label for="itemid">Product ID:</label></td>
                <td><input type="text" id="itemid" name="itemid"></td>
            </tr>
            <tr>
                <td><label for="itemname">Product Name:</label></td>
                <td><input type="text" id="itemname" name="itemname"></td>
            </tr>
            <tr>
                <td><label for="price">Product Price:</label></td>
                <td><input type="text" id="price" name="price"></td>
            </tr>
        </table>

        <div class="form-actions">
            <input type="submit" name="submit" value="Add New Product">
            <input type="reset" value="Clear Form">
        </div>
    </form>
</div>  
  
</body>
</html>