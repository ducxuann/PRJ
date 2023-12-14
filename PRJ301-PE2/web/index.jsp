<%-- 
    Document   : index
    Created on : Dec 6, 2023, 9:45:00 AM
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
        <form id='f' action="list" method="post">
            StudentID: <select name="sid" onchange="document.getElementById('f').submit()">
                <option value="0" >All</option>
                <c:forEach items="${sts}" var="s">
                    <option value="${s.getStudentID()}" ${(s.getStudentID() == id) ? "selected = \"selected\"" : ""}>${s.getStudentID()}</option>
                </c:forEach>
            </select>
            <br>
            <table border = 1>
                <tr>
                    <td>StudentID</td>
                    <td>StudentName</td>
                    <td>BirthDate</td>
                    <td>ClassName</td>
                    <td>StartDate</td>
                    <td>InstructorName</td>
                </tr>
                <c:forEach items="${students}" var="s">
                    <tr>
                        <td>${s.getStudentID()}</td>
                        <td>${s.getStudentName()}</td>
                        <td>${s.getBirthDate()}</td>
                        <td>${s.getClassName()}</td>
                        <td>${s.getStartDate()}</td>
                        <td>${s.getInName()}</td>
                        <td><a href="detail?id=${s.getStudentID()}">Detail</a></td>
                    </tr>
                </c:forEach>
            </table>

            Detail information:<br>
            Code: <input type="text" name="code" value="${student.getStudentID()}">
            Name: <input type="text" name="name" value="${student.getStudentName()}">
            <br>
            Date of birth: <input type="date" name="dob" value="${student.getBirthDate()}">
            Gender: <input type="radio" name="gender" ${student.isGender() ? 'checked' : ''} value="1">Male
            <input type="radio" name="gender" ${!student.isGender() ? 'checked' : ''} value="0">Female
        </form>
    </body>
</html>
