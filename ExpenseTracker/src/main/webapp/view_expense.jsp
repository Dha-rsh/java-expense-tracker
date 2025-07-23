<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Expenses</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container">
    <h2>All Expenses</h2>
    <table class="expense-table">
        <tr>
            <th>Date</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection con = com.expensetracker.DBConnection.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM expenses");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("category") %></td>
            <td><%= rs.getDouble("amount") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <a href="edit?id=<%= rs.getInt("id") %>">Edit</a> |
                <a href="delete?id=<%= rs.getInt("id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <br>
    <a href="dashboard">Back to Dashboard</a>
</div>
</body>
</html>
