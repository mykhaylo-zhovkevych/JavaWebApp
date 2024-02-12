package javawebapplication.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javawebapplication.bean.UserBean;
import javawebapplication.utitlity.ServletUtility;



@WebServlet(name = "loginindividual", urlPatterns = {"/loginindividual"})
public class loginindividual extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Map<String, String> userDatabase = new HashMap<>(); // Simulated user database
    
    static {
        // Simulated user data (username:password)
        userDatabase.put("user1", "password1");
        userDatabase.put("user2", "password2");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBean user = new UserBean();
        String username = request.getParameter("name");
        String password = request.getParameter("password");

        // Validate the username and password
      //  if (isValidCredentials(username, password)) {
      //      HttpSession session = request.getSession(true); // Create a new session if it doesn't exist
      //      session.setAttribute("username", username); // Store user-specific data in the session
        //    response.sendRedirect(request.getContextPath() + JWAView.userpage); // Redirect to the user's personalized page
        ServletUtility.forward(JWAView.userpage, request, response);
    //    } else {
            // If the credentials are invalid, set an error message attribute in the request
    //        ServletUtility.setErrorMessage("Invalid username or password", request);
            //ServletUtility.forward(JWAView.LoginView, request, response);
        }
  //  }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private boolean isValidCredentials(String username, String password) {
        // Check against the simulated user database
        return userDatabase.containsKey(username) && userDatabase.get(username).equals(password);
    }
}


