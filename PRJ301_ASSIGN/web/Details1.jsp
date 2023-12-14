<%-- 
    Document   : Details1
    Created on : Sep 28, 2023, 3:41:13 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product Details</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <!--<link href="css/fontawesome.min.css" rel="stylesheet">-->
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!-- Navigation-->
        <jsp:include page="Bar.jsp"></jsp:include>
            <!-- Product section-->
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img style="max-width: 80%;" class="card-img-top mb-5 mb-md-0" src="${details.image}" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${details.name}</h1>
                        <div class="fs-5 mb-4">
                            <span style="font-size: 30px; color: red; font-weight: 500"><fmt:formatNumber value="${details.price}" type="number" pattern="###,###đ"/></span>
                        </div>
                        <p style="font-weight: 400;" class="lead">${details.des}</p>


                        <div style="display: flex; gap: 5px;">
                            <span style="font-size: 15px; font-weight: 700;">Size: </span>

                            <c:forEach items="${listSize}" var="listSize">
                                <button class="sizeProduct" id="sizeProduct" onclick="getSize(${listSize.quantity}, '${listSize.size}')" type="submit" name="size" value="${listSize.size}">${listSize.size}</button>

                            </c:forEach>
                        </div>
                        <div id="message" style="display: none; color: red;"></div>

                        <span style="font-size: 15px; font-weight: 700;">Quantity: </span><span id="quantitySize" style="font-size: 15px;">${details.count}</span>
                        <div class="d-flex">

                            <div class="buys-Option" style="display: flex; gap: 10px;">
                                <a id="buynow" href="addCart?id=${id}&num=1&o=1">
                                    <button class="btn btn btn-dark" type="button">
                                        Buy Now
                                    </button>
                                </a>

                                <a id="addtocart" href="addCart?id=${id}&num=1&o=2">
                                    <button class="btn btn btn-dark" type="button">
                                        <i class="bi-cart-fill me-1"></i>
                                        Add to cart
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 style="text-align: center;" class="fw-bolder mb-4">New Products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${productNews}" var="productNews">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <a href="details?pid=${productNews.id}"><img class="card-img-top" src="${productNews.image}" alt="imageProduct" /></a>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${productNews.name}</h5>
                                        <!-- Product price-->
                                        <h5><fmt:formatNumber value="${productNews.price}" type="number" pattern="###,###đ"/></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>




                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
