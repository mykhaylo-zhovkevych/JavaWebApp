package javawebapplication.controller;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javawebapplication.bean.UserBean;
import javawebapplication.model.UserModel;
import javawebapplication.utitlity.DataUtility;
import javawebapplication.utitlity.ServletUtility;


@WebServlet(name ="userclt", urlPatterns = {"/userclt"})
public class userctl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public userctl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Edit....
        UserModel model = new UserModel();
        
        long id = DataUtility.getLong(request.getParameter("id"));
        if(id>0) {
          UserBean bean = null;
          bean = model.FindByPk(id);
          request.setAttribute("bean", bean);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(JWAView.userview);
        rd.forward(request, response);
    }

		
	  /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the name is "root"
        String name = request.getParameter("name");
        if (name != null && name.equals("root")) {
            ServletUtility.setErrorMessage("Username 'root' is not allowed", request);
            request.getRequestDispatcher(JWAView.userview).forward(request, response);
            return; // Stop processing since there's an error
        }

        UserBean user = new UserBean();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));

        // Check if name is null or empty
        if (name == null || name.trim().isEmpty()) {
            ServletUtility.setErrorMessage("Name cannot be null or empty", request);
            request.getRequestDispatcher(JWAView.userview).forward(request, response);
            return; // Stop processing since there's an error
        }
        user.setName(name);

        // Check if password is null or empty
        String password = request.getParameter("password");
        if (password == null || password.trim().isEmpty()) {
            ServletUtility.setErrorMessage("Password cannot be null or empty", request);
            request.getRequestDispatcher(JWAView.userview).forward(request, response);
            return; // Stop processing since there's an error
        }
        user.setPassword(password);

        // Check if dob is null or empty
        String dobString = request.getParameter("dob");
        if (dobString == null || dobString.trim().isEmpty()) {
            ServletUtility.setErrorMessage("Date of Birth cannot be null or empty", request);
            request.getRequestDispatcher(JWAView.userview).forward(request, response);
            return; // Stop processing since there's an error
        }
        user.setDob(DataUtility.getDate(dobString));

        user.setMobileNo(request.getParameter("mobileNo"));
        
        
        long id = DataUtility.getLong(request.getParameter("id"));
        user.setId(id);

        // Check if the id is greater than 0, indicating an existing user to update
        if (id > 0) {
            long i = UserModel.UpdateUser(user);
            if (i > 0) {
                ServletUtility.setSuccessMessage("User updated successfully", request);
            } else {
                ServletUtility.setErrorMessage("Failed to update user", request);
            }
        } else {
            // If id is not greater than 0, proceed with adding a new user
            long i = UserModel.addUser(user);
            if (i > 0) {
                ServletUtility.setSuccessMessage("User registered successfully", request);
            } else {
                ServletUtility.setErrorMessage("An error occurred while registering user", request);
            }
        }

        // Forward the request to the user view page
        request.getRequestDispatcher(JWAView.userview).forward(request, response);
    }
}


	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    UserBean user = new UserBean();
	    user.setFirstName(request.getParameter("firstName"));
	    user.setLastName(request.getParameter("lastName"));
	    user.setName(request.getParameter("name"));
	   // user.setPassword(request.getParameter("password"));
	    user.setDob(DataUtility.getDate(request.getParameter("dob")));
	    user.setMobileNo(request.getParameter("mobile"));
	    
	    
	    if (user.getPassword() == null) {
	    	  throw new IllegalArgumentException("password cannot be null");
	    	   } else if (user.getPassword() != null) {
	    		  
	    		   user.setPassword(request.getParameter("password"));
	    	  }
	    
	    
	    long i = UserModel.addUser(user);
	    if(i>0) {
	      ServletUtility.setSuccessMessage("User register sucessfully", request);
	      
	    }else {
	      ServletUtility.setErrorMessage("Occured Error", request);
	    }
	    request.getRequestDispatcher(JWAView.userview).forward(request, response);
	  }*/
	


