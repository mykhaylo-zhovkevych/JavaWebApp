package javawebapplication.controller;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class dataTableFilter
 */
@WebFilter(filterName = "dataTableFilter", urlPatterns = {"/dataTable"})
public class dataTableFilter implements Filter {
	
       
	   public void init(FilterConfig fConfig) throws ServletException {
	    }

	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	            throws IOException, ServletException 
	    
	    {
	        HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpServletResponse httpResponse = (HttpServletResponse) response;

	        HttpSession session = httpRequest.getSession(false); // Do not create a new session if it doesn't exist

	        boolean loggedIn = session != null && session.getAttribute("user") != null;

	        if (loggedIn) {
	            // Check if user is root
	            String username = (String) session.getAttribute("user");
	            if (username.equals("root")) {
	                // If user is root, allow access to userListctl servlet
	                chain.doFilter(request, response);
	                return;
	            }
	        }

	        // If user is not logged in or not root, redirect to login page
	        httpResponse.sendRedirect(httpRequest.getContextPath() + "/loginctl");
	    }

	    public void destroy() {
	    }
	}