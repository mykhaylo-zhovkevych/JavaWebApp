<%@ include file="header.jsp"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Root User</title>
</head>
<body>
    <h1>Welcome Root User!</h1>
    <p>This is the page for root user.</p>
    <!-- You can add more content here as needed -->
    <a>http://mz-project-java.ch/</a>
    
    <form action="<%=JWAView.userListctl%>" method="get">
        <button type="submit">User List</button>
    </form>
    <form action="<%=JWAView.dataTable%>" method="get">
        <button type="submit">View Data Table</button>
    </form>
</body>
</html>