<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.List" %>
    <%@ page import="customerpackage.Product" %>
    <%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<link rel="stylesheet" href="css/customerdashboard.css">
<style>
.tableStyle{
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    width: 70%;
    border-radius: 10px 10px 0px 0px;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.10);
}
.tableStyle thead tr{
    background-color: #22744e;
    color: #ffffff;
    text-align: left;
}
.tableStyle th{
	color: white;
	background-color: #2a9158;
}
.tableStyle th,
.tableStyle td {
    padding: 15px 15px;
}
.tableStyle tbody tr {
    border-bottom: thin solid #dddddd;
}

.tableStyle tbody tr:nth-of-type(even) {
    background-color: ;
}

.tableStyle tbody tr:last-of-type {
    border-bottom: thin solid #009879;
}
.unamecenter{
	padding: 20px;
}
.topbar {
    width: 100%;
    height: 150px;
    background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),url('images/grobk2.jpg'); 
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    padding: 20px;
    color: white;
}

.topbarchild {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#th2 {
    margin-left: 50px;
}

#tp {
    margin-right: 50px;
}
.prheading{
	margin-top: 20px;
}
.search-container {
	margin-top: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px; /* Adjust spacing between search and viewCart */
}

.search-wrapper {
    position: relative;
    display: inline-block;
}

#searchInput {
	padding: 20px;
    padding-left: 30px; /* Add padding for the icon */
    height: 30px;
    font-size: 16px;
    border-radius: 50px; /* Adjust this value to control the roundness */
    border: 1px solid #ccc; /* Optional: Add a border */
    outline: none; /* Remove default outline */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Optional: Add a slight shadow */
}


.search-wrapper i {
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translateY(-50%);
    pointer-events: none; /* Ensure the icon doesn't block input interaction */
    color: #555;
}

#viewCart {
    font-size: 16px;
    text-decoration: none;
    padding: 8px 16px;
    background-color: #0d6efd; /* Add a background if needed */
    border-radius: 5px;
    color: white;
    transition: background-color 0.3s;
}

#viewCart:hover {
    background-color: #105fd3;
}

#addToCart{
	padding: 8px 20px;
	border: 1px solid #2a9158;
    border-radius: 8px;
    background: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
#addToCart:hover {
	color: white;
    background-color: #218838;
}
</style>
</head>
<body>
<%
if (session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
}
%>
    
    <center class="unamecenter">
    <p>Welcome, <span><%= session.getAttribute("username") %> !<span></p>
    </center>
    
    <div class="topbar">
    	<div class="topbarchild">
    		<h2 id="th2">Product List </h2>
    		<p id="tp">Product List</p>
    	</div>
    </div>
    
		<div class="search-container">
    		<div class="search-wrapper">
        		<input type="text" id="searchInput" placeholder="search products">
        		<i class="fa-solid fa-magnifying-glass"></i>
    		</div>
    		<div>
    		<a href="cart.jsp" id="viewCart">View Cart</a>
    		<i class="fa-solid fa-cart-shopping"></i>
    		</div>
		</div>

<center>
<table border="1" class="tableStyle">
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
    </tr>
    <%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null) {
        out.println("No products available.");
    } else {
        for (Product product : products) {
%>
    <tr>
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="itemid" value="<%= product.getItemid() %>" />
            <input type="hidden" name="itemname" value="<%= product.getItemname() %>" />
            <input type="hidden" name="price" value="<%= product.getPrice() %>" />
            <td><%= product.getItemname() %></td>
            <td>Rs. <%= product.getPrice() %>0</td>
            <td>Quantity: <input type="number" name="quantity" value="1" min="1" />
                <input type="submit" id="addToCart" value="Add to Cart" /></td>
        </form>
    </tr>
    <% }
        
     }%>
</table>
</center>



<script>
function filterTable() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {  // Start from 1 to skip table header
        tr[i].style.display = "none";  // Initially hide all rows
        td = tr[i].getElementsByTagName("td");
        for (var j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                	
                    tr[i].style.display = "";  // Show the row if a match is found
                    break;
                }
            }
        }
    }
}

// Add event listener for the input
document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>