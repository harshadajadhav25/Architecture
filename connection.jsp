<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Connection Test</title>
</head>
<body>
    <h1>Database Connection Test</h1>

<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/bookdb"; // Update with your DB name
    String user = "root";  // MySQL username
    String password = "123456";  // MySQL password

    Connection connection = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver"); // Use the appropriate driver class

        // Establish the connection
        connection = DriverManager.getConnection(url, user, password);
        
        // Check if the connection was successful
        if (connection != null) {
%>
            <p style="color: green;">Connection to the database was successful!</p>
<%
        } else {
%>
            <p style="color: red;">Failed to make connection!</p>
<%
        }
    } catch (SQLException e) {
%>
        <p style="color: red;">SQLException: <%= e.getMessage() %></p>
<%
    } catch (ClassNotFoundException e) {
%>
        <p style="color: red;">ClassNotFoundException: <%= e.getMessage() %></p>
<%
    } finally {
        if (connection != null) {
            try {
                connection.close(); // Close the connection if it was established
            } catch (SQLException e) {
%>
                <p style="color: red;">Failed to close connection: <%= e.getMessage() %></p>
<%
            }
        }
    }
%>

</body>
</html>
