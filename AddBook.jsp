<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<h1 align="Center"> Add Book </h1>

<br />
<table align="center">
<form method="post">
 <tr>
 <td>
  <label for="bookname">Book Name:</label>
 </td>
 <td>
  <input type="text" name="bookname"/> 
 </td>
 </tr>
 <tr>
 <td>
  <label for="price">Price:</label>
 </td>
 <td>
  <input type="text" name="price" />
 </td>
 <tr>
  <td>
   <input type="submit" value="Add Book" />
  </td>
 </tr>
</form>
</table>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ page import = "java.sql.*" %>

<%
    Connection connection = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/bookdb", "root", "123456");
      
    Statement statement = connection.createStatement();
      
    String bookname = request.getParameter("bookname");  
    if (bookname != null)
    {
     int price = Integer.parseInt(request.getParameter("price"));
	 
     String insertStmt = "Insert into books value(\'" + bookname + "\', " + price +")";

     statement.executeUpdate(insertStmt);
      
     response.sendRedirect("DisplayBook.jsp"); 
    }
    statement.close();
    connection.close();
%>