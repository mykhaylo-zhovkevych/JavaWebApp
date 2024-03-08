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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1D1D1D;
            color: #FFFFFF;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin: 30px !important;
            font-size: 2.5em;
            text-transform: uppercase;
            letter-spacing: 2px !important;
        }

        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #333333;
            color: #FFFFFF;
            font-size: 1em;
        }

        button[type="submit"] {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #008CBA;
            color: #FFFFFF;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #005F6B;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #666666;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333333;
            color: #ffffff;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #333333;
            color: #e8e8e8;
        }
        tr:nth-child(odd) {
            background-color: #67b8e0;
            color: black;
        }

        
        .no-data {
            text-align: center;
            padding: 20px;
        }

        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            h1 {
                font-size: 2em;
            }
            
            form {
                margin-bottom: 10px;
            }

            input[type="text"], button[type="submit"] {
                font-size: 0.8em;
            }

            table {
                font-size: 0.8em;
            }
        }
        #headerContainer {
           
        }
		#footerContainer{
		background: linear-gradient(to right, #333333, #67b8e0) !important; 
		margin-top: 50px;
		
        
		}
       
    </style>
</head>

<body>

<div id="headerContainer">
    <%@ include file="header.jsp"%>
</div>

    <h1>glossary</h1>
    
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
        <table>
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
                    <td colspan="5" class="no-data">No data available</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <div id="footerContainer">
    <%@ include file="footer.jsp"%>
    </div>
</body>
</html>




