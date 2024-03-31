package javawebapplication.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javawebapplication.bean.UserBean;
import javawebapplication.utitlity.ServletUtility;

@WebServlet(name = "loginindividual", urlPatterns = {"/loginindividual"})
public class loginindividual extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Don't create a new session
        
        // Check if there's a user session. If not, redirect to loginctl.
        if (session == null || session.getAttribute("userBean") == null) {
            response.sendRedirect(request.getContextPath() + "/loginctl");
            return;
        }
//        UserBean user = new UserBean();
//        String username = request.getParameter("name");
//        String password = request.getParameter("password");

       
        ServletUtility.forward(JWAView.userpage, request, response);

        // Proceed with the intended action for this servlet if there's a valid session.
        // For example, redirect to a user's profile page or dashboard.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
/*
 * The loginctl servlet is where user authentication and session creation occur. 
 * Once authenticated, user details are stored in the session, which other parts of the application, 
 * like the loginindividual servlet, rely on to verify that the user is logged in. 
 * The loginindividual servlet ensures that only authenticated users can access certain 
 * resources by checking for a valid session and redirecting unauthenticated users to the login page.
 */
