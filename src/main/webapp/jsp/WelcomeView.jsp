<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Page</title>
</head>
<body>
    Welcome, <%= session.getAttribute("username") %>!
    <p>This is your personalized page.</p>
    
    <!-- Add more user-specific features or content here -->
    
    <form action="logout" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>

