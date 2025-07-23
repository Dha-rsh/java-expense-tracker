<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/register.css">
</head>
<body>
<div class="page-container">
    <div class="container">
        <div class="form-wrapper">
            <form action="register" method="post">
                <h2>Register</h2>    
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                    <p class="error"><%= error %></p>
                <%
                    }
                %>

                Name: <input type="text" name="name" required><br>
                Email: <input type="email" name="email" required><br>
                Password: <input type="password" name="password" required><br>
                <input type="submit" value="Register">

                <p class="login-link">
                    Already registered? <a href="login.jsp">Login here</a>
                </p>
            </form>
        </div>

        <jsp:include page="footer.jsp" />
    </div>
    </div>
</body>
</html>
