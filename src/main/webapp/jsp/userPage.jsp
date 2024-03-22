<%@ page import="java.util.*" %>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Page</title>
</head>
<body>

<% 
String user = (String) session.getAttribute("user");
if (user == null) {
    // Redirect to login if no user in session
    response.sendRedirect("login");
    return;
}
%>

<%= "Welcome: " + user %>
    
<p>This is your personalized page.</p>
    
    
    <% if(request.getAttribute("originalText") != null) { %>
    <h2><%= request.getAttribute("action") %> Result:</h2>
    <p>Original text: <%= request.getAttribute("originalText") %></p>
    <p>Processed text: <%= request.getAttribute("processedText") %></p>
<% } %>
<!-- Encryption/Decryption Form -->
<form action="<%=request.getContextPath()%>/SchieferJava" method="POST">
    <label for="action">Choose an action:</label>
    <select name="action" id="action">
        <option value="encrypt">Encrypt</option>
        <option value="decrypt">Decrypt</option>
    </select>
    <label for="message">Message:</label>
    <input type="text" id="message" name="message">
    <button type="submit">Submit</button>
</form>

<form action="<%=request.getContextPath()%>/logout" method="post">
    <input type="submit" value="Logout">
</form>
    
</body>
</html>