package javawebapplication.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SchieferJava
 */
@WebServlet(name = "SchieferJava", urlPatterns = {"/SchieferJava"})
public class SchieferJava extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve action and message from the request
        String action = request.getParameter("action");
        String message = request.getParameter("message");
        char key = 2; // Your encryption key
        
        String processedText; // Declare the variable to hold the result

        
        if ("encrypt".equals(action)) {
            processedText = encrypt(message, key);
            request.setAttribute("originalText", message); // Save original text for display
            request.setAttribute("processedText", processedText); // Save encrypted text for display
            request.setAttribute("action", "Encryption");
        } else if ("decrypt".equals(action)) {
            processedText = decrypt(message, key);
            request.setAttribute("originalText", message); // Save original text for display
            request.setAttribute("processedText", processedText); // Save decrypted text for display
            request.setAttribute("action", "Decryption");
        } else {
            // Handle other actions or error
            processedText = "Invalid action";
            request.setAttribute("originalText", message);
            request.setAttribute("processedText", processedText);
            request.setAttribute("action", "Error");
        }
        
        // Forward to the JSP page to display the result
        request.getRequestDispatcher(JWAView.userpage).forward(request, response);
    }
    
    // Function to encrypt a message
    private String encrypt(String text, char key) {
        char[] chars = text.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            chars[i] += key;
        }
        return new String(chars);
    }

    // Function to decrypt a message
    private String decrypt(String text, char key) {
        char[] chars = text.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            chars[i] -= key;
        }
        return new String(chars);
    }
}