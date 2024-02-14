<%@ include file="header.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="javawebapplication.controller.JWAView" %>
<%@ page import="javawebapplication.bean.UserBean" %>
<%@ page import="javawebapplication.controller.dataTable" %>
<%@ page import="javawebapplication.model.UserModel" %>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frame</title>
</head>

<body>

    <h1>Frame</h1>
    <div>
        <!-- Buttons -->
        <form method="post" action="<%= JWAView.dataTable %>">
            <input type="hidden" name="action" value="add">
            <input type="text" name="word" placeholder="Enter word to add">
            <input type="text" name="definition" placeholder="Enter definition">
            <input type="text" name="extraInfo" placeholder="Enter extra info">
            <button type="submit">Add Data</button>
        </form>
        <form method="post" action="<%= JWAView.dataTable %>">
            <input type="hidden" name="action" value="refresh">
            <button type="submit">Refresh Data</button>
        </form>
    </div>
    <div>
    <!-- Table -->
    <table id="tblData">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Definition</th>
                <th>Extra Info</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        
        <%
			List<UserBean> wordList = (List<UserBean>) request.getAttribute("wordList");
		%>
            <% 
            if (wordList != null && !wordList.isEmpty()) {
                for (UserBean word : wordList) {
            %>
            <tr>
                <td><%= word.getId() %></td>
                <td><%= word.getName() %></td>
                <td><%= word.getDefinition() %></td>
                <td><%= word.getExtraInfo() %></td>
                <td>
                    <form method="post" action="<%= JWAView.dataTable %>">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="word" value="<%= word.getName() %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <% 
                }
            } else {
            %>
            <tr>
                <td colspan="5">No data available</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
  
</div>
</body>

<%@ include file="footer.jsp"%>
</html>



