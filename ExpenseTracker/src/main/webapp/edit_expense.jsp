<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Expense</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/add.css">
</head>
<body>
<div class="container">
    <h2>Edit Expense</h2>
    <form action="edit" method="post">
        <input type="hidden" name="id" value="${id}" />
        <label>Date:</label>
         <input type="date" name="date" value="${date}" required><br>
       <label>Category:</label> 
        <input type="text" name="category" value="${category}" required><br>
        <label>Amount: </label>
        <input type="number" step="0.01" name="amount" value="${amount}" required><br>
        <label>Description:</label>
         <input type="text" name="description" value="${description}" required><br>
        <input type="submit" value="Update">
    </form>
    <br>
    <a href="view_expense.jsp">Cancel</a>
    </div>
</body>
</html>
