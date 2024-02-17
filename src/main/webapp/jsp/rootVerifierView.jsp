<%@page import="java.util.List"%>
<%@page import="javawebapplication.bean.UserBean"%>
<%@page import="javawebapplication.model.UserModel"%>
<%@page import="javawebapplication.controller.JWAView"%> <!-- Importing JWAView interface -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Interface</title>
</head>
<body>
    <h2>Pending Registrations</h2>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <% 
            List<UserBean> pendingUser = (List<UserBean>) request.getAttribute("pendingUser"); 
            if (pendingUser != null) { 
                for (UserBean user : pendingUser) { 
        %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getFirstName() + " " + user.getLastName() %></td>
                <td>
                <!-- not this -->
                    <form action="<%= request.getContextPath() %>/rootVerifier" method="post"> <!-- Using JWAView.rootVerifier -->
                        <input type="hidden" name="userId" value="<%= user.getId() %>">
                        <button type="submit" name="action" value="approve">Approve</button>
                        <button type="submit" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
        <% 
                } 
            } 
        %>
    </table>
</body>
</html>
