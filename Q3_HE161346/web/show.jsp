<%-- 
    Document   : show
    Created on : Dec 14, 2023, 9:21:50 AM
    Author     : xuanduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <body>
    <h2>Show Suppliers</h2>
    <form action="/show" method="get">
        Filter by Name: <input type="text" name="filterName">
        Filter by Year: <input type="text" name="filterYear">
        <input type="submit" value="Filter">
    </form>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Year</th>
            
        </tr>
        <c:forEach var="supplier" items="${suppliers}">
            <tr>
                <td>${supplier.name}</td>
                <td>${supplier.year}</td>
                <!-- Các cột khác -->
            </tr>
        </c:forEach>
    </table>
</body>
    </body>
</html>
