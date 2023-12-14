<%-- 
    Document   : index
    Created on : Nov 30, 2023, 9:24:35 AM
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
        
        <% 
            String id = request.getParameter("id");
            if(id != null){
            %>
             
            <h2><%= id %></h2>
            <% 
                }
            %>
    </body>
</html>
