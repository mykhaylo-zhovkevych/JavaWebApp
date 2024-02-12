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
		
		//oldCODE_______________________________
	/*
		RequestDispatcher rd = request.getRequestDispatcher(JWAView.LoginView);
		rd.forward(request, response);*/
		/*HttpSession session = request.getSession(false);
		String op = request.getParameter("operation");
		if(op.equals("logout")){
			session.invalidate();
			ServletUtility.setSuccessMessage("logout was Sucessfull", request); }
		ServletUtility.forward(JWAView.LoginView, request, response); }
	*/
		 HttpSession session = request.getSession(false);
		    String op = request.getParameter("operation");
		    if (op != null && op.equals("logout")) {
		        session.invalidate();
		        ServletUtility.setSuccessMessage("Logout was successful", request);
		        ServletUtility.forward(JWAView.LoginView, request, response);
		        return;
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
	    HttpSession session = request.getSession(true);
	    user = UserModel.UserLogin(name, pwd);
	    
	    if (user != null) {
	        
	    	session.setAttribute("user", user.getName());
	    	if (user.isRoot()) {
                // Redirect to root page for root user
                ServletUtility.redirect(JWAView.rootctl, request, response);
            } else {	
  
            	//Set attribute for session
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


