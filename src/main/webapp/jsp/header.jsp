<%@ page import="javawebapplication.controller.JWAView" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!--the header above all pages -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User</title>
    <style>
        /* Your CSS styles here */
        /* Move right and left buttons to the right side */
        .navbar-collapse {
            display: flex;
            justify-content: space-between;
        }
    </style>
    <link href="css/headerstyle.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <!-- <link href="../css/headerstyle.css" rel="stylesheet" type="text/css"> -->
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <script>
    // JavaScript code to navigate through browser history
    function goBack() {
        window.history.back();
    }

    function goForward() {
        window.history.forward();
    }
</script>

</head>

<body>
    <% String userSession = (String)session.getAttribute("user"); %>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <a class="navbar-brand" href="/JavaWebProject">
            <div class="box">
                <div class="inner">
                    <span>FORUM</span>
                </div>
                <div class="inner">
                    <span>Forum</span>
                </div>
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <% if(userSession == null) { %>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="<%=JWAView.home%>">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JWAView.userctl%>">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JWAView.loginctl%>">Login</a>
                </li>
            </ul>
            <% } else { %>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href=<%=JWAView.loginctl+"?operation=logout"%>>Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
             
            
            
			
              <!--    <li class="nav-item">
                    <a class="nav-link " href="<%=JWAView.userListctl%>">UserList</a>
                </li> --> 
            </ul>
            <% } %>
            <!-- Add right and left buttons here -->
            <div>
                <button type="button" class="btn btn-primary" onclick="goBack()">Left</button>
                <button type="button" class="btn btn-primary" onclick="goForward()">Right</button>
            </div>
        </div>
    </nav>
</body>
</html>


