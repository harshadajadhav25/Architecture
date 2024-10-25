<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Edit Book Prices</title>
</head>
<body>
    <h1 align="center">Edit Book Prices</h1>

    <form action="editBook" method="post">
        <label for="bookId">Book ID:</label>
        <input type="text" name="bookId" required/><br/>

        <label for="newPrice">New Price:</label>
        <input type="text" name="newPrice" required/><br/>

        <input type="submit" value="Update Price"/>
    </form>
</body>
</html>
