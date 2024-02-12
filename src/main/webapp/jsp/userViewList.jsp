<%@page import="javawebapplication.utitlity.DataUtility"%>
<%@page import="javawebapplication.bean.UserBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="javawebapplication.utitlity.ServletUtility"%>
<%@ include file="header.jsp"%>
<%
    int index = 1;
    List list = javawebapplication.utitlity.ServletUtility.getList((jakarta.servlet.http.HttpServletRequest)request);
    Iterator it = list.iterator();
    while(it.hasNext()) {
        UserBean user = (UserBean)it.next();
%>

<%= javawebapplication.utitlity.ServletUtility.getSuccessMessage((jakarta.servlet.http.HttpServletRequest) request) %>

<table class="table table-striped">
    <thead>
        <tr> 
            <th scope="col">Id</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Name (ID)</th>
            <th scope="col">Password</th>
            <th scope="col">Date of Birth</th>
            <th scope="col">Mobile No</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row"><%= user.getId() %></th>
            <td><%= user.getFirstName() %></td>
            <td><%= user.getLastName() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getDob() %></td>
            <td><%= user.getMobileNo() %></td>
            <td><a href="userclt?id=<%=user.getId()%>">Edit</a><br><a href="userListctl?id=<%=user.getId()%>">Delete</a></td>
           
        </tr>
    </tbody>
</table>
<% } %>
<%@ include file="footer.jsp"%>
