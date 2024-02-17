package javawebapplication.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import javawebapplication.bean.UserBean;
import javawebapplication.model.UserModel;




@WebServlet(name="dataTable", urlPatterns= {"/dataTable"})
public class dataTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public dataTable() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if (action != null) {
                switch (action) {
                    case "add":
                        String wordToAdd = request.getParameter("word");
                        String definition = request.getParameter("definition");
                        String extraInfo = request.getParameter("extraInfo");
                        if (wordToAdd != null && !wordToAdd.isEmpty()) {
                            UserModel.addWord(wordToAdd, definition, extraInfo);
                        }
                        break;
                    case "delete":
                        String wordToDelete = request.getParameter("word");
                        if (wordToDelete != null && !wordToDelete.isEmpty()) {
                            UserModel.deleteWord(wordToDelete);
                        }
                        break;
                    case "refresh":
                        // No action required here, as we handle refresh separately below
                        break;
                    default:
                        // Handle unexpected action values
                        break;
                }
            }

            // Refresh the word list after performing the action
            List<UserBean> wordList = UserModel.getAllWordsAsBean();
            request.setAttribute("wordList", wordList);
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }

        // Forward the request to the JSP page
        request.getRequestDispatcher(JWAView.showTable).forward(request, response);
    }
}
