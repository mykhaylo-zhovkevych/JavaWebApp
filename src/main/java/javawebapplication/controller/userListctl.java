package javawebapplication.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javawebapplication.model.UserModel;
import javawebapplication.utitlity.DataUtility;
import javawebapplication.utitlity.ServletUtility;

/**
 * Servlet implementation class userListctl
 */
@WebServlet(name="userListctl" ,urlPatterns= {"/userListctl"})
public class userListctl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userListctl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    UserModel model=new UserModel();
	    // deleting
	    long id=DataUtility.getLong(request.getParameter("id"));
	    if(id>0) {
	      UserModel.delete(id);
	      ServletUtility.setSuccessMessage("Data Deleted Successfully", request);
	    }
	    
	    List list=null;
	    list=model.list();
	    System.out.println(list.size());
	    
	    if(list==null && list.size()==0){
	      ServletUtility.setErrorMessage("Record Not Found", request);
	    }
	   
	    
	    ServletUtility.setList(list, request);
		ServletUtility.forward(JWAView.userWievList, request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
