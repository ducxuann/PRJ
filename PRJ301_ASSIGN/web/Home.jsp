<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Boutique</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--NarBar-->
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
        <div class="block-content" style="padding: 25px 25px"><div class="row"><div class="col-sm-12"><a class="" aria-label="Banner"><img onerror="this.onerror=null;this.src='https://media.canifa.com/Simiconnector/BannerSlider/a/o/ao_len_top_banner_desktop.webp'" src="https://media.canifa.com/Simiconnector/BannerSlider/a/o/ao_len_top_banner_desktop.webp" alt="" width="100%" height="100%"></a> <!----> <!----></div></div></div>
        <!--New Product-->
        <jsp:include page="ProductNew.jsp"></jsp:include>

            <!-- Section-->
            <section class="py-3">
                <p style="text-align: center; font-size: 30px;font-weight: 800;"> All Product </p>
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center w-932">

                    <c:forEach items="${listA}" var="o">
                        <%--<c:set var="os" value="${o.price}"/>--%>
                        <div class="col mb-5">
                            <div class="card h-100">

                                <!-- Product image-->
                                <a href="details?pid=${o.id}" title="View"> <img class="card-img-top" src="${o.image}" alt="..." /> </a>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5><a class="fw-bolder" href="details?pid=${o.id}" title="View" style="text-decoration: none; color: black;">${o.name}</a></h5>
                                        <!-- Product price-->
                                        <p style="font-size: 23px"><fmt:formatNumber value="${o.price}" type="number" pattern="###,###đ"/></p>
                                    </div>
                                    <c:choose>
                                        <c:when test="${ad.isAdmin == 0}">
                                            <!--<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="addCart?id=${o.id}&&num=1">Add to cart</a></div>-->
                                        </c:when>
                                        <c:when test="${ad.isAdmin == 1}">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="manager">Edit Product</a></div>
                                        </c:when>

                                        <c:when test="${ad.isAdmin == 2}">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="admin">Admin Control</a></div>
                                        </c:when>
                                        <c:otherwise>
                                            <!--<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="addCart?id=${o.id}&&num=1">Add to cart</a></div>-->
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>
                        </div>

                    </c:forEach>


                    <!--Remove ProductNew in Category?id-->
                    <script>
                        const proNew = document.getElementById("productNewww");

                        if (window.location.href.indexOf("category") != -1) {
                            proNew.style.display = "none";
                        }

                        if (window.location.href.indexOf("search") != -1) {
                            proNew.style.display = "none";
                        }


                    </script>
                    <!--end-->

                </div>
            </div>
            <div style="text-align: center; text-decoration: none">
                <c:forEach begin="1" end="${endP}" var="i" >
                    <a style="padding: 5px 15px 5px 15px; border: 1px solid black;" class="${tag == i?"active":""}" href="LoadDB?index=${i}">${i}</a>
                </c:forEach>
            </div>
        </section>



        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

