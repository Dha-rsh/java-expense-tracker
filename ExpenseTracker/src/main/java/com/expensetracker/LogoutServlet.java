package com.expensetracker;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
     
        HttpSession session = req.getSession(false); 
        if (session != null) {
            session.invalidate();
        }
        res.sendRedirect("register.jsp");
    }
}
