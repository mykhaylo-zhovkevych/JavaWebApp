package javawebapplication.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class SaveSectionServlet
 */

@WebServlet(name = "SaveSectionServlet", urlPatterns = { "/SaveSectionServlet" })
public class SaveSectionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestBody = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        
        // Assuming requestBody is a JSON object with a title and content

        // Save to a file
        String filePath = "C:/Users/mzovk/downloads/new.txt";
        try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(filePath, true)))) {
            out.println(requestBody); // Write the JSON as a string to the file
        } catch (IOException e) {
            throw new ServletException("File writing error", e);
        }

        // Send a simple response back to the client
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"status\":\"success\"}");
    }
}
