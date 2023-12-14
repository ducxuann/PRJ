<%-- 
    Document   : Details
    Created on : Oct 12, 2022, 11:37:34 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Details</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
       <!-- Bootstrap icons-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="Bar.jsp"></jsp:include>
        <!--Menu CProduct-->
        <div class="sub-menu" style="background-color: #63b1bc;color: white;">      
            <ul class="nav nav-pills nav-fill">
                <c:forEach items="${listC}" var="o">
                    <li class="nav-item">                    
                        <a class="nav-link" style="color: white; font-weight: ${tag == o.cid ? "800":""}" href="category?cid=${o.cid}" style="color: white;">${o.cname}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <!-- Header-->
        <header class="bg-dark py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-3 fw-bolder">Shop in Beautique</h1>
                    <p class="lead fw-normal text-white-50 mb-0">One Product By Pro</p>
                </div>
            </div>
        </header>
        
        <!-- Section-->
        <section class="py-3">

            <div class="detailsProduct" style="display:flex; justify-content: center;">
               
                        <div class="">
                            <!-- Product image-->
                            <img class="" src="${details.image}" alt="..." />
                            <!-- Product details-->
                        </div>
                
                 <div style="width: 100%; margin-left: 40px; padding-left: 25px; padding-right: 25px;">
                        <h1 style="font-weight: 600;">${details.name}</h1>
                                <div class="detailspro">
                                    <!-- Product name-->
<!--                                    <h5 class="fw-bolder">Ao Tee</h5>-->
                                    <!-- Product price-->
                                    <p style="font-weight: 500; font-size: 25px">Price: ${details.price}</p>
<!--                                    <span style="font-weight: 600; font-size: 18px;">Size</span>
                                    <div class="d-flex" style="margin-top: 10px; margin-bottom: 20px;">
                                        <button class="btnSize thumb-size">XS</button>
                                        <button class="btnSize thumb-size">S</button>
                                        <button class="btnSize thumb-size">M</button>
                                        <button class="btnSize thumb-size">L</button>
                                        <button class="btnSize thumb-size">XL</button>
                                    </div>-->
                                    
                                    <div style="height: 1px; background: rgb(236, 236, 236); margin-top: 23px; margin-bottom: 20px;"></div>
                                    <span style="font-weight: 600; font-size: 18px;">Mô Tả Sản Phẩm</span>
                                    <div style="font-size: 18px; margin-top: 15px; margin-bottom: 15px;">${details.des}</div>
                                    <div style="height: 1px; background: rgb(236, 236, 236); margin-top: 23px; margin-bottom: 20px;"></div>
                                    <span style="font-weight: 600; font-size: 18px;">Giao Hàng</span>
                                    <div class="hidden-sm-and-down" style="margin-bottom: 20px; margin-top: 20px;">
                                        <div class="d-flex justify-center align-center hidden-sm-and-down" style="justify-content: center; border: 1px solid black; padding-top: 20px; padding-bottom: 20px; margin-top: 10px; cursor: pointer;">
                                            <div class="text-center">
                                                <div style="color: black; font-size: 18px; font-weight: 600;">Ship COD</div>
                                                    
                                            </div>
                                                
                                        </div>
                                            
                                    </div>
                                    
                                    <div class="">
                                        <a href="addCart?id=${id}&&num=1" class="btn btn-warning w-100" href="#" style="color: white; font-weight: 800; padding-top: 20px; padding-bottom: 20px;">ADD TO CART</a>
                                    </div>
                                </div>
                            <!-- Product actions-->

                </div>
                        
                            
                        </div>

                    
 
        </section>
        
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

