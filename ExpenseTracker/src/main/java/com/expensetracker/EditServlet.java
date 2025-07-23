package com.expensetracker;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

 
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM expenses WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("id", id);
                req.setAttribute("date", rs.getString("date"));
                req.setAttribute("category", rs.getString("category"));
                req.setAttribute("amount", rs.getDouble("amount"));
                req.setAttribute("description", rs.getString("description"));
                req.getRequestDispatcher("edit_expense.jsp").forward(req, res);
            } else {
                res.sendRedirect("view_expense.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading expense for edit.");
        }
    }

    // Handle form submission for update
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String date = req.getParameter("date");
        String category = req.getParameter("category");
        double amount = Double.parseDouble(req.getParameter("amount"));
        String description = req.getParameter("description");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE expenses SET date=?, category=?, amount=?, description=? WHERE id=?"
            );
            ps.setString(1, date);
            ps.setString(2, category);
            ps.setDouble(3, amount);
            ps.setString(4, description);
            ps.setInt(5, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                res.sendRedirect("view_expense.jsp");
            } else {
                res.getWriter().println("Failed to update expense.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error during update.");
        }
    }
}
