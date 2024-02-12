

<%@ include file="header.jsp"%>


      
<body>

<%="Welcome: "+session.getAttribute("user")%>
    
    <p>This is your personalized page.</p>
    
    <!-- Add more user-specific features or content here -->
    
    <form action="logout" method="post">
        <input type="submit" value="Logout">
    </form>
    
</body>
</html>