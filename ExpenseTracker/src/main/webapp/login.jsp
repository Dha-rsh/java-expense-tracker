<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/register.css">
</head>
<body>
<div class="page-container">
<form action="login" method="post">
<h2>Login Page</h2>
 	Mail <input type="text" name="email" required><br>
   Password: <input type="password" name="password" required><br>
   <input type="submit" value="Login">
</form>
</div>
</body>
</html>
