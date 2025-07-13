<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Style.css">

 <script type="text/javascript">
        
        function confirmUpdate() {
            return confirm("Are you sure you want to update this product details?");
        }
    </script>

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

    .form-table input[type="text"] {
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

    .back-btn {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .back-btn button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-btn button:hover {
        background-color: #218838;
    }
    
</style>
</head>
<body>

       <%
         int itemid = Integer.parseInt(request.getParameter("itemid"));
         String itemname = request.getParameter("itemname");
         double price = Double.parseDouble(request.getParameter("price"));
       
       
       %>

<div class="container">
    <h1>Update Product</h1>
    <form action="UpdateProductServlet" method="POST" onsubmit="return confirmUpdate();">
        <table class="form-table">
            <tr>
                <td><label for="itemid">Product ID:</label></td>
                <td><input type="text" id="itemid" name="itemid" value="<%= itemid %>" readonly></td>
            </tr>
            <tr>
                <td><label for="itemname">Product Name:</label></td>
                <td><input type="text" id="itemname" name="itemname" value="<%= itemname %>"></td>
            </tr>
            <tr>
                <td><label for="price">Product Price:</label></td>
                <td><input type="text" id="price" name="price" value="<%= price %>"></td>
            </tr>
        </table>

        <div class="submit-btn">
            <input type="submit" name="submit" value="Update Product Details">
        </div>
    </form>

    <div class="back-btn">
        <button onclick="window.location.href='ProductRetrieveServlet'">Back to Products</button>
    </div>
</div>
</body>
</html>