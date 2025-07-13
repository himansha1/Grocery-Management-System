<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
<link rel="stylesheet" href="signin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
</head>
<body>

<main class="form-signin">
  <form action="RegisterServlet" method="post">
    <img class="" src="images/grocerylg.png" alt="" width="180" height="180">
    <h1 class="h3 mb-3 fw-normal">Create a new account</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="username" name="username" required>
      <label for="floatingInput">Username</label>
    </div>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingPassword" placeholder="Email" name="email" required>
      <label for="floatingPassword">Email</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingPassword" placeholder="Phone" name="name" required>
      <label for="floatingPassword">Name</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingPassword" pattern="\d{10}" placeholder="Username" name="phone" required>
      <label for="floatingPassword">Phone</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="address" required>
      <label for="floatingPassword">Address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" minlength="5" placeholder="Password" name="password" required>
      <label for="floatingPassword">Password</label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" type="submit">Register</button>
    
    
    <p  class="mt-4"><a href="customerlogin.jsp">Login</a></p>
  </form>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>