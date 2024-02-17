package javawebapplication.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javawebapplication.bean.UserBean;
import javawebapplication.model.UserModel;
import javawebapplication.utitlity.ServletUtility;


@WebServlet(name = "rootVerifier", urlPatterns = {"/rootVerifier"})
public class rootVerifier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public rootVerifier() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<UserBean> pendingUser = UserModel.getPendingUser();

	        // Forward the list of pending registrations to the admin view
		 request.setAttribute("pendingUser", pendingUser);
		 request.getRequestDispatcher(JWAView.rootVerifierView).forward(request, response);
	    }
	

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    long userId = Long.parseLong(request.getParameter("userId"));
	    String action = request.getParameter("action");

	    if ("approve".equals(action)) {
	        // Approve the user in the database
	        boolean approved = UserModel.approveUser(userId);

	        if (approved) {
	            // Redirect to admin interface with success message
	            ServletUtility.setSuccessMessage("User approved successfully", request);
	        } else {
	            // Redirect to admin interface with error message
	            ServletUtility.setErrorMessage("Failed to approve user", request);
	        }
	    } else if ("reject".equals(action)) {
	        // Reject the user in the database (if needed)
	        // Implement reject logic as needed
	        // For example: UserModel.rejectUser(userId);

	        // Redirect to admin interface with success message
	        ServletUtility.setSuccessMessage("User rejected successfully", request);
	    }

	    // Redirect back to the admin interface
	    response.sendRedirect(request.getContextPath() + "/rootVerifier");
	}

}
