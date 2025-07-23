package com.expensetracker;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;

        try {
            con = DBConnection.getConnection();

            
            checkStmt = con.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
           

            if (rs.next()) {
                req.setAttribute("error", "Email is already registered. Please login.");
                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req, res);
                return;
            }

            
            insertStmt = con.prepareStatement("INSERT INTO users(name, email, password) VALUES (?, ?, ?)");
            insertStmt.setString(1, name);
            insertStmt.setString(2, email);
            insertStmt.setString(3, pass);

            int row = insertStmt.executeUpdate();

            if (row > 0) {
                res.sendRedirect("login.jsp");
            } else {
                req.setAttribute("error", "Registration failed. Please try again.");
                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error occurred. Please try later.");
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.forward(req, res);
        } finally {
            try {
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
