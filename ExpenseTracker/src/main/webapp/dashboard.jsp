<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.expensetracker.model.Expense" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Welcome to Your Dashboard</h2>
        
        <div style="text-align:center; margin-bottom: 20px;">
            <a href="add_expense.jsp">Add Expense</a> |
            <a href="view_expense.jsp">View Expenses</a> |
            <a href="logout">Logout</a>
        </div>

        <hr>

        <h3>Your Expenses</h3>
        <table>
          <tr>
            <th>Date</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
          <%
            List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
            if (expenses != null && !expenses.isEmpty()) {
                for (Expense e : expenses) {
          %>
          <tr>
            <td><%= e.getDate() %></td>
            <td><%= e.getCategory() %></td>
            <td style="text-align:right;">₹<%= e.getAmount() %></td>
            <td><%= e.getDescription() %></td>
            <td>
              <a href="edit?id=<%= e.getId() %>">Edit</a> |
              <a href="delete?id=<%= e.getId() %>">Delete</a>
            </td>
          </tr>
          <%
                }
            } else {
          %>
          <tr>
            <td colspan="5" style="text-align:center;">No expenses found.</td>
          </tr>
          <%
            }
          %>
        </table>
    </div>
</body>
</html>
