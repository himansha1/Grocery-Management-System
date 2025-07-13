<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Style.css">

 <script type="text/javascript">
        
        function confirmDelete() {
            return confirm("Are you sure you want to delete this product?");
        }
    </script>

</head>
<body>

      <%
         int itemid = Integer.parseInt(request.getParameter("itemid"));
         String itemname = request.getParameter("itemname");
         double price = Double.parseDouble(request.getParameter("price"));
   
       
       %>
       
       <h1>DELETE PRODUCT</h1>
<div>
      <form action = "Deleteproductservlet" method = "POST" onsubmit="return confirmDelete();">
            Product ID: <input type = "text" name = "itemid" value = "<%=itemid %>" readonly><br>
            Product Name: <input type = "text" name = "itemname" value = "<%=itemname %>" readonly><br>
            Product Price: <input type = "text" name = "price" value = "<%=price %>" readonly><br>
             
             <input type = "submit" name = "submit" value = "DELETE PRODUCT"><br><br>
             
      </form>
      
            
      <form action = "read" method = "POST">
      <button class="button" onclick="window.location.href='ProductRetrieveServlet'">Back To The Product</button>
      </form>
      
</div>
</body>
</html>