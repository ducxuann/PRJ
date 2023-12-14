<%-- 
    Document   : show
    Created on : Dec 5, 2023, 11:17:38 AM
    Author     : xuanduc
--%>

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
                    <th>Code</th>
                    <th>Name</th>
                     <th>Date Of Birth</th>
                      <th>Gender</th>
                       <th>Subject</th>
                        <th>Select</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lst_subject}" var="c">
                    <tr>
                        <td>${s.code}</td>
                        <td>${s.name}</td>
                        <td>${c.dob}</td>
                        <td>${c.gender}</td>
                        <td>${c.subject}</td>
                        <td>${c.selecy}</td>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>

        
    </body>
</html>

