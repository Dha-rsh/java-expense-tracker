package com.expensetracker;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String category = req.getParameter("category");
        String amountStr = req.getParameter("amount");
        String date = req.getParameter("date");
        String description = req.getParameter("description");

        if (category == null || amountStr == null || date == null || 
            category.isEmpty() || amountStr.isEmpty() || date.isEmpty()) {
            res.getWriter().println("Please fill in all required fields.");
            return;
        }

        try {
            double amount = Double.parseDouble(amountStr);

            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("user_id") == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            Integer userId = (Integer) session.getAttribute("user_id");

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO expenses (user_id, category, amount, date, description) VALUES (?, ?, ?, ?, ?)"
                 )) {

                ps.setInt(1, userId);
                ps.setString(2, category);
                ps.setDouble(3, amount);
                ps.setString(4, date);
                ps.setString(5, description);
                ps.executeUpdate();

                res.sendRedirect("dashboard.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                res.getWriter().println("Database error: " + e.getMessage());
            }

        } catch (NumberFormatException e) {
            res.getWriter().println("Amount must be a valid number.");
        }
    }
}
