package javawebapplication.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javawebapplication.bean.UserBean;
import javawebapplication.model.UserModel;
import javawebapplication.utitlity.DataUtility;
import javawebapplication.utitlity.ServletUtility;


// mapping
@WebServlet(name = "loginctl", urlPatterns = {"/loginctl"})
public class loginctl extends HttpServlet {


    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public loginctl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//oldcode
	/*
		RequestDispatcher rd = request.getRequestDispatcher(JWAView.LoginView);
		rd.forward(request, response);*/
		/*HttpSession session = request.getSession(false);
		String op = request.getParameter("operation");
		if(op.equals("logout")){
			session.invalidate();
			ServletUtility.setSuccessMessage("logout was Sucessfull", request); }
		ServletUtility.forward(JWAView.LoginView, request, response); }
	*/	 long userId = DataUtility.getLong(request.getParameter("userId"));
		 HttpSession session = request.getSession(false);
		    String op = request.getParameter("operation");
		    if (op != null && op.equals("logout")) {
		        session.invalidate();
		        ServletUtility.setSuccessMessage("Logout was successful", request);
		        ServletUtility.forward(JWAView.LoginView, request, response);
		        return;
		        // here will this not give any error messages it will receive http 500
		    }
		   ServletUtility.forward(JWAView.LoginView, request, response);
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UserBean user = new UserBean();
	    String name = request.getParameter("name");
	    String pwd = request.getParameter("password");
	
	    
	    user = UserModel.UserLogin(name, pwd);
	    
	    if (user != null) {
	        // Check if the user is approved
	        if (!user.isApproved()) {
	            ServletUtility.setErrorMessage("User is not approved by admin yet", request);
	            ServletUtility.forward(JWAView.LoginView, request, response);
	            return; // Stop processing since there's an error
	        }
	        // This line retrieves the current HttpSession associated with the request or, if there is no session and true is passed as an argument, creates a new one
	        HttpSession session = request.getSession(true);
	        //userBean for storing the entire UserBean object.
	        session.setAttribute("userBean", user); 
	        // This line stores the UserBean object, which likely contains information about the user such as their name, roles, etc., into the session under the attribute name "userBean". 
	        // By storing the whole object, other parts of the application can retrieve and use the user's information as needed.
	        
	        session.setAttribute("user", user.getName());
	        //This line stores just the user's name in the session under the attribute name "user". This can be useful for quick access to the user's name 
	        // without needing to cast and retrieve the entire UserBean object, 
	        // especially if the user's name is frequently displayed or checked.
	        
	        if (user.isRoot()) {
	            // Redirect to root page for root user
	            ServletUtility.redirect(JWAView.rootctl, request, response);
	        } else {    
	            // Set attribute for session
	            session.setAttribute("user", user.getName());
	            ServletUtility.redirect(JWAView.loginindividual, request, response);
	        }
	    } else {
	        // Authentication failed, forward back to login view with error message
	        ServletUtility.setErrorMessage("Invalid User", request);
	        ServletUtility.forward(JWAView.LoginView, request, response);
	    }
	}
}

