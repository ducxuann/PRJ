
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!-- Navigation-->
        <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%; z-index: 10000;">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="LoadDB">BÔNG</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <!--<li class="nav-item"><a class="nav-link active">Home</a></li>-->
                        
                    </ul>
                    
                    <form method="post" action="search">
                        <div class="" style="margin-right: 50px;"> 
                            <button type="submit" role="button" aria-label="Search" class="search-btn" style="background-color: rgb(248, 249, 250); border: 0px solid;">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button> 
                            <input value="${valueSearch}" type="text" name="txt" placeholder="Tìm Kiếm" style="font-weight: 600; margin-left: 5px; color: black;">
                        </div>
                    </form>           


                    <form class="d-flex align-items-center gap-lg-2 text-decoration-none">
                        <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <a class="me-1" style="text-decoration: none; cursor: pointer;" href="profiles">Manager Profile</a>
                        </c:if>  
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <a class="me-1" style="text-decoration: none; cursor: pointer;" href="admin">Admin</a>
                        </c:if>    

                            
                        <c:if test="${sessionScope.acc != null}">
                            <span class="me-1" style="text-decoration: none;">Hello ${sessionScope.acc.firstname} ${sessionScope.acc.lastname}</span>
                            <a class="me-1" style="text-decoration: none; cursor: pointer;" href="logout">Logout</a>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <a class="me-1" style="text-decoration: none; cursor: pointer;" href="Login/Login.jsp">Login</a>
                            <a class="me-2" style="text-decoration: none; cursor: pointer;" href="Login/Register.jsp">Register</a>
                        </c:if>
                            
                        
                        <a href="showCart" style="text-decoration:none; color:inherit; border-radius: 5px; padding: 5px; border: 1px solid black;">
                        
                           <i class="fa-duotone fa-cart-shopping"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${requestScope.size}</span>
                       
                        </a>
                    </form>
                </div>
            </div>
            
            
        </nav>
        </div>
        
        