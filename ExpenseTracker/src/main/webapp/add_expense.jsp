<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Expense</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/add.css">
</head>
<body>
<div class="container">
    <h2>Add New Expense</h2>
    <form action="add_expense" method="post">
        <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" required><br><br>

        <label for="category">Category:</label><br>
        <input type="text" id="category" name="category" required><br><br>

        <label for="amount">Amount:</label><br>
        <input type="number" step="0.01" id="amount" name="amount" required><br><br>

        <label for="description">Description:</label><br>
        <input type="text" id="description" name="description" required><br><br>

        <input type="submit" value="Add Expense">
    </form>
    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
