<%-- 
    Document   : list
    Created on : Dec 4, 2023, 11:34:47 PM
    Author     : xuanduc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lst_authors}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>

        
    </body>
</html>
