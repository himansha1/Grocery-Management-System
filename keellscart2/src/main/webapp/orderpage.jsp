<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="includes/adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
h2 {
        color: #333;
        margin-bottom: 10px;
    }

    .button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 10px 0;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
	.button2{
		background-color: green;
	}
	.button1{
		background-color: red;
	}
    .button:hover {
        background-color: #0056b3;
    }

    table {
        width: 85%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
    .uppercenter{
    	margin-top: 20px;
    }
</style>
</head>
<body>

<center class="uppercenter">
<h1><i class="fa-solid fa-truck-fast"></i> Orders Table</h1>
<button class="button" onclick="document.location='insertorder.jsp'">Add new order</button>

<table border="1">
	<tr>
		<th>Order Id</th>
		<th>Customer Id</th>
		<th>Item Id</th>
		<th>Quantity Id</th>
		<th>Total Id</th>
		<th>Date Id</th>
		<th>Action</th>
	</tr>
	<c:forEach var="order" items="${allOrder}">
	<tr>
		<td>${order.orderid}</td>
		<td>${order.cusid}</td>
		<td>${order.itemid}</td>
		<td>${order.quantity}</td>
		<td>${order.total}</td>
		<td>${order.date}</td>
		<td>
			<a href="updateorder.jsp?orderid=${order.orderid}&cusid=${order.cusid}&itemid=${order.itemid}&quantity=${order.quantity}&total=${order.total}&date=${order.date}" class="button button2">Update</a>
			<form action="OrderDeleteServlet" method="post">
				<input type="hidden" name="orderid" value="${order.orderid}">
				<button class="button button1">Delete</button>
			</form>
		</td>
	</tr>
	</c:forEach>
</table>
</center>


<center>
<h1><i class="fa-solid fa-bowl-food"></i> Products Table</h1>
<button class = "button" onclick="document.location='productinsert.jsp'">Add new product</button>
<table id = "product" border="1">
     
      <tr>
          <th>Product ID</th>
          <th>Product Name</th>
          <th>Product Price</th>
          <th>Update</th>
          <th>Delete</th>
       </tr>
       

      <c:forEach var="product" items="${customer}">
      
       <c:set var="itemid" value="${product.itemid}"/>
       <c:set var="itemname" value="${product.itemname}"/>
       <c:set var="price" value="${product.price}"/>
       
        <tr>
            <td>${product.itemid}</td>
            <td>${product.itemname}</td>
            <td>${product.price}</td>
            
     
        
        
        <c:url value = "updateproduct.jsp" var = "uproduct">
             <c:param name = "itemid" value = "${itemid}"/>
             <c:param name = "itemname" value = "${itemname}"/>
             <c:param name = "price" value = "${price}"/>
        </c:url>
        
         <td><a href = "${uproduct}">
            <button class = "button button2" type="button">Update</button>
            </a></td>
            
         <c:url value = "deleteproduct.jsp" var = "dproduct">
             <c:param name = "itemid" value = "${itemid}"/>
             <c:param name = "itemname" value = "${itemname}"/>
             <c:param name = "price" value = "${price}"/>
        </c:url>
           
         <td><a href = "${dproduct}">
            <button class = "button button1" type="button">Delete</button>
         </a></td>
         
        </tr>
          
      </c:forEach>
  </table><br><br>
</center>

<center>
<h1><i class="fa-solid fa-user"></i> Customer Details Table</h1>
<button class = "button" onclick="document.location='insert.jsp'">Add new customer</button>
<table border="1">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Contact No</th>
      <th>Address</th>
      <th>UserName</th>
       <th>Manage Details</th>
      
    </tr>
    <c:forEach var="grocery" items="${allGroceries }">
    <tr>
    <td>${grocery.userid }</td>
    <td>${grocery.name }</td>
    <td>${grocery.email }</td>
    <td>${grocery.phone}</td>
    <td>${grocery.address }</td>
    <td>${grocery.username }</td>
      
     <td>
     <a href="update.jsp?userid=${grocery.userid}&name=${grocery.name}&email=${grocery.email}&phone=${grocery.phone}&address=${grocery.address}&username=${grocery.username}">
     
     <button class="button button2">Update</button>
     </a>
     <form action="DeleteServlet" method="post">
     
     <input type="hidden" name="userid" value="${grocery.userid}"/>
               <button class="button button1">Delete</button>   
     
     </form>
     
     </td>    
    </tr>  
    </c:forEach>
</table>
</center>

</body>
</html>