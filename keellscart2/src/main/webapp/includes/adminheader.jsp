<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<style>
        *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Sora', sans-serif;
}
.headerc{
    box-shadow: rgba(38, 57, 77, 0.342) 0px 20px 70px -10px;
}
.nav{
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 80px;
}
.navitems a{
    text-decoration: none;
    color: #1B4332;
    margin: 0px 35px 0px 0px;
    padding-bottom: 10px;
    font-size: 16px;
    font-weight: 400;
}
.cartbtn a{
    padding: 14px 28px;
    background: #2a9158;
    border-radius: 10px;
    text-decoration: none;
    color: #ffffff;
    font-size: 16px;
    cursor: pointer;
}
#lgout{
	background: #f95959;
}
</style>
</head>
<body>
<header>
        <div class="headerc">
            <div class="nav">
                <a href="#" class="logo"><img src="${pageContext.request.contextPath}/images/grocerylg.png" alt="" width="100px"></a>
                <div class="navitems">
                    <h2>Admin Dashboard</h2>
                </div>
                <div class="cartbtn">
                    <a href="" id="lgout">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
                </div>
            </div>
        </div>
</header>


<script src="https://kit.fontawesome.com/4139a33776.js" crossorigin="anonymous"></script>
</body>
</html>