package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DoctorLogout")
public class DoctorLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        // Retrieve the current session
        HttpSession session = req.getSession();
        
        // Remove the doctor object from the session
        session.removeAttribute("doctObj");
        
        // Set a success message for the logout
        session.setAttribute("sucMsg", "Doctor Logout Successfully");
        
        // Redirect to the login page
        resp.sendRedirect("doctor_login.jsp");
    }
}
