<%@ page import = "java.sql.*" %>
<jsp:include page="header.jsp" />

<h1 align="center">Book List</h1>

<%
    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bookdb", "root", "123456");

        PreparedStatement getRecords = connection.prepareStatement("SELECT bookname, price FROM books");

        ResultSet resultSet = getRecords.executeQuery();
%>

<table align="center" border="1">
    <tr>
        <th>Book Name</th>
        <th>Price</th>
    </tr>

<%
    while (resultSet.next()) {
%>
        <tr>
            <td><%= resultSet.getString("bookname") %></td>
            <td><%= resultSet.getDouble("price") %></td>
        </tr>
<%
    }
    resultSet.close();
    getRecords.close();
    connection.close();
    } catch (Exception e) {
        e.printStackTrace();
%>
    <p style="color: red; text-align: center;">Error: <%= e.getMessage() %></p>
<%
    }
%>
</table>

<jsp:include page="footer.jsp" />
