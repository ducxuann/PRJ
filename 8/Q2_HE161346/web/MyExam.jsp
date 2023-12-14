<%-- 
    Document   : MyExam
    Created on : Dec 14, 2023, 9:47:59 AM
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
        <form action="add" method="post">
            Code: <input type="text" name="code" value="${code}"><br>
            Full name: <input type="text" name="name" value="${name}"><br>
            Gender: 
            <label>
                <input type="radio" name="gender" value="male" ${gen?"checked = \"checked\"":""}>Male
            </label>
            <label>
                <input type="radio" name="gender" value="female" ${!gen?"checked = \"checked\"":""}> Female
            </label>
            <br>
            <input type="submit" value="ADD">
            <br>

            List of Students: 
            <table border="1">
                <tr>
                    <td>Id</td>
                    <td>FullName</td>
                    <td>Gender</td>
                </tr>
                <c:forEach items="${list}" var="s">
                    <tr>
                        <td>${s.getCode()}</td>
                        <td>${s.getName()}</td>
                        <c:choose>
                            <c:when test="${s.isGender()}">
                                <td>Male</td>
                            </c:when>    
                            <c:otherwise>
                                <td>Female</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${empty code and empty name}">
                <h1>${mess}</h1>
            </c:if>
            
        </form>
    </body>
</html>
