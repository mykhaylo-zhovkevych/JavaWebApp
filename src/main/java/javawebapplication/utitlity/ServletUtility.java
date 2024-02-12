package javawebapplication.utitlity;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/*
 Its custom class that will help us to during the Java web application development. 
 We are going to write some common methods to manage the Request and Response of the servlets or any other activities related to Java servlets.
 
 All the method of this class is just used to manage the resources of related to servlet. Like

    Send request one page to another page.
    Send Error message.
    To forward page.
    To redirect a page.
    Get and Set the list.
*/



public class ServletUtility {
	  static String Error = "Invalid data";
	  static String SucessMessage = "Done";
	  
	  // Forward the request
	  public static void forward(String page, HttpServletRequest request, HttpServletResponse response)
	      throws IOException, ServletException {
	    RequestDispatcher rd = request.getRequestDispatcher(page);
	    System.out.println(page);
	    rd.forward(request, response);
	  }
	  
	  // redirect the request
	  public static void redirect(String page, HttpServletRequest request, HttpServletResponse response)
	      throws IOException, ServletException {
	    response.sendRedirect(page);
	  }
	  
	  //hander of exceptions    
	  public static void handleException(Exception e, jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
	      throws IOException, ServletException {
	    request.setAttribute("exception", e);
	    ServletUtility.forward("Error Message", request, response);
	    e.printStackTrace();
	  }
	  
	  public static String getErrorMessage(String property,HttpServletRequest request) {
	    String val = (String) request.getAttribute(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  public static String getMessage(String property, HttpServletRequest request) {
	    String val = (String) request.getAttribute(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  public static void setErrorMessage(String msg, HttpServletRequest request) {
		    request.setAttribute(Error, msg);
		}

		public static String getErrorMessage(HttpServletRequest request) {
		    String val = (String) request.getAttribute(Error);
		    if (val == null) {
		        return "";
		    } else {
		        return val;
		    }
		}
	  public static void setSuccessMessage(String msg, jakarta.servlet.http.HttpServletRequest request) {
	    request.setAttribute(SucessMessage, msg);
	  }
	  public static String getSuccessMessage(HttpServletRequest request) {
	    String val = (String) request.getAttribute(SucessMessage);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  
	  public static String getParameter(String property, HttpServletRequest request) {
	    String val = (String) request.getParameter(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  public static void setList(List<?> list, HttpServletRequest request) {
	    request.setAttribute("list", list);
	  }
	  
	  public static List<?> getList(HttpServletRequest request) {
	    return (List<?>) request.getAttribute("list");
	  }
	  /**
	   * Sets Page Number for List pages
	   * 
	   * @param pageNo
	   * @param request
	   */
	  
	  /*
	  public static void setPageNo(int pageNo, HttpServletRequest request) {
	    request.setAttribute("pageNo", pageNo);
	  }
	  public static int getPageNo(HttpServletRequest request) {
	    return (Integer) request.getAttribute("pageNo");
	  }
	  
	  public static void setSize(int size, HttpServletRequest request) {
	    request.setAttribute("size", size);
	  }
	  public static int getSize(HttpServletRequest request) {
	    return (Integer) request.getAttribute("size");
	  }
	  public static void setPageSize(int pageSize, HttpServletRequest request) {
	    request.setAttribute("pageSize", pageSize);
	  }
	  public static int getPageSize(HttpServletRequest request) {
	    return (Integer) request.getAttribute("pageSize");
	  }  */
	  public static void setOpration(String msg, HttpServletRequest request) {
	    request.setAttribute("Opration", msg);
	  }
	 
	  
	  public static String getOpration(HttpServletRequest request) {
	    String val = (String) request.getAttribute("Opration");
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }

	
}
