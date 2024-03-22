<%@ include file="header.jsp"%>
<%@ page import="javawebapplication.controller.JWAView" %>

<html>

<head>
    <meta charset="UTF-8">
    <title>Welcome Root User</title>
    <link href="css/rootPage.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
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

    <h1 id="title">Welcome Root User!</h1>
    <div id="middle">
    <p>This is the page for root user.</p>
    <a>http://mz-project-java.ch/</a>
    </div>
    
    <div id="buttonContainer">
    
    <form id="userlist" action="<%=JWAView.userListctl%>" method="get">
        <button type="submit">User List</button>
    </form>
    <form id="dictionary" action="<%=JWAView.dataTable%>" method="get">
        <button type="submit">View Data Table</button>
    </form>
    <form id="approvals" action="<%=JWAView.rootVerifier%>" method="get">
        <button type="submit">Approvals</button>
    </form>  
    
    </div>  
    
</div>
</body>
</html>