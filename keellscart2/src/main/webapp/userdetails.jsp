<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User details</title>
<style>

.welcomemessage{
	margin-top: 20px;
}
.topbar {
	margin-top: 20px;
    width: 100%;
    height: 150px;
    background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.0), rgba(0, 0, 0, 0.0)),url('images/banner.jpg'); 
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
.form-wrapper {
	margin-top: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-container {
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: rgba(38, 57, 77, 0.6) 0px 20px 70px -10px;
    width: 700px;
    text-align: center;
}
.form-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}
.form-row2{
	margin-top: 20px
}
.form-group {
    display: flex;
    flex-direction: column;
    width: 48%;
    margin: 5px;
}

.form-group label {
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.form-group input {
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    transition: border-color 0.3s ease;
}

.form-group input:focus {
    border-color: #4CAF50;
}

.save-button {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}
.save-button2{
	background-color: #0d6efd;
}
.save-button2 a{
	color: white;
	text-decoration: none;
}
.delete-button{
 	width: 100%;
    padding: 10px;
    background-color: red;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

</style>
</head>
<body>

<center class="welcomemessage">
	<p>Welcome, <%= session.getAttribute("username") %></p>
</center>

<div class="topbar">
    	<div class="topbarchild">
    		<h2 id="th2">Account</h2>
    		<p id="tp">Account Details</p>
    	</div>
    </div>
    
    <div class="form-wrapper">
    <div class="form-container">
        <h2>Account Information</h2>
        <form action="UpdateDetailsServlet" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">Name</label>
                    <input type="text" name="name" id="firstName" value="<%= session.getAttribute("name") %>">
                </div>
                <div class="form-group">
                    <label for="Username">Username</label>
                    <input type="text" id="lastName" value="<%= session.getAttribute("username") %>" readonly>
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <input type="text" name="address" id="lastName" value="<%= session.getAttribute("address") %>">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" placeholder="Email" value="<%= session.getAttribute("email") %>" readonly>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" id="phone" value="<%= session.getAttribute("phone") %>">
                </div>
                <div class="form-group">
                    <label for="phone">Password</label>
                    <input type="password" name="password" id="phone" placeholder="Don't save without password">
                </div>
            </div>
            <div class="form-row">
                <button type="submit" class="save-button">Save Details</button>
            </div>
        </form>
        
        <form action="CustomerDeleteServlet" method="post">
            <input type="submit" value="Delete Account" class="delete-button"/>
        </form>
        
        <div class="form-row form-row2">
                <button type="button" class="save-button save-button2"><i class="fa-solid fa-bowl-food"></i><a href="OrderHistoryServlet">View Order History</a></button>
         </div>
    </div>
</div>
   
   <a href="OrderHistoryServlet">View Order History</a> 
    
<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>