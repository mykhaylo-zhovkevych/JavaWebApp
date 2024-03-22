package javawebapplication.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javawebapplication.bean.UserBean;

import java.io.IOException;

@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false);
	    //This line attempts to retrieve the current HTTP session associated with the request. 
	    //The false parameter means that it will not create a new session if none currently exists it will return null instead.
	    
	    UserBean user = null;
	    boolean isRoot = false;
	    // If the retrieval is successful (user != null), the servlet updates the user variable to reference this object. The isRoot flag is then updated based on whether this user has root privileges (user.isRoot()).
	    //If no UserBean object is found in the session (indicating the user might not be logged in or the session doesn't contain the user information), user remains null, and isRoot stays false.
	    String userName = null; // Variable to hold the user's name
	    
	    if (session != null) {
	        user = (UserBean) session.getAttribute("userBean");
	        if (user != null) {
	            isRoot = user.isRoot();
	            // Optionally, retrieve the user's name if needed
	            // String userName = (String) session.getAttribute("userName");
	            userName = user.getName();
	        }
	    }
	    
	    // Based on the user's root status, set an attribute for the JSP to show/hide content
	    request.setAttribute("isRoot", isRoot);
	    request.setAttribute("userName", userName);
	 

	    RequestDispatcher dispatcher = request.getRequestDispatcher(JWAView.java);
	    dispatcher.forward(request, response);
	}
}

