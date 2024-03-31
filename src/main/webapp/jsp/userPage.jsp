<%@ page import="java.util.*" %>
<%@ include file="header.jsp"%>
<%@ page import="javawebapplication.controller.JWAView" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Page</title>
    <link href="css/userPage.css" rel="stylesheet">
</head>
<body>
        <div class="sidebar">
<h2>sidebar</h2>
        <ul>
            <li><a href="<%=JWAView.HomeServlet%>"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="#"><i class="fas fa-user"></i>Profile</a></li>
            <li><a href="#"><i class="fas fa-address-card"></i>About</a></li>
            <li><a href="#"><i class="fas fa-project-diagram"></i>portfolio</a></li>
            <li><a href="#"><i class="fas fa-blog"></i>Blogs</a></li>
            <li><a href="#"><i class="fas fa-address-book"></i>Contact</a></li>
            <li><a href="#"><i class="fas fa-map-pin"></i>Map</a></li>
        </ul> 
       	  <div class="social_media">
         	 <a href="#"><i class="fab fa-facebook-f"></i></a> <!-- wath the tag i do -->
        	 <a href="#"><i class="fab fa-twitter"></i></a>
       		 <a href="#"><i class="fab fa-instagram"></i></a>
     	 </div>
</div>
<div class="wrapper">
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
</div>
</body>
</html>