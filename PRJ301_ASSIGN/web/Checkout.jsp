 <%-- 
    Document   : Checkout
    Created on : Oct 15, 2022, 7:19:05 PM
    Author     : Tran Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Checkout</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ecdabb78c5.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <style>
            #sces{
                display: none;

            }

            #sces:active{
                display: block;
            }
        </style>
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                        <p class="mb-5 text-center">
                            <!--$showCartt.size()}-->
                            <i class="text-info font-weight-bold">${countItemCart==null?"0":countItemCart}</i> items in your cart</p>
                        <table id="shoppingCart" class="table table-condensed table-responsive">
                            <thead>
                                <tr>
                                    <th style="width:50%">Product</th>
                                    <th style="width:10%">Size</th>
                                    <th style="width:20%">Price</th>
                                    <th style="width:10%">Quantity</th>
                                    <th style="width:10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <div id="sces${success.length() > 0?"active":""}"class="alert alert-success" style="text-align: center;"role="alert">
                                    ${success}
                                </div>
                                <c:set var="o" value="${requestScope.cart}"/>
                                <c:forEach items="${o.items}" var="i">
                                    <tr>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-md-3 text-left">
                                                    <img src="${i.product.image}" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                </div>
                                                <div class="col-md-9 text-left mt-sm-2">
                                                    <h4>${i.product.name}</h4>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${i.size}</td>
                                        <td data-th="Price"><fmt:formatNumber value="${i.price}" type="number" pattern="###,###đ"/></td>
                                        <td>
                                            <input id="reduceCount" type="button" value="-" onclick="location.href = 'cartprocess?num=-1&id=${i.product.id}&s=${i.size}'">
                                            ${i.quanity}
                                            <input id="increCount" type="button" value="+" onclick="location.href = 'cartprocess?num=1&id=${i.product.id}&s=${i.size}'">
                                        </td>
                                        <td class="actions" data-th="">
                                            <div class="text-right">

                                                <form action="cartprocess" method="post">
                                                    <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                                        <input type="hidden" name="idx" value="${i.product.id}"/>
                                                        <input type="hidden" name="sizex" value="${i.size}"/>
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>


                        <c:if test="${!empty requestScope.cart.items}">
                            <form method="post" action="checkout" style="border-radius: 5px;padding: 20px; border: 1px solid black; display: ${sessionScope.acc == null?"none":"block"}">
                                <h2>Thông tin khách hàng</h2> 
                                <div class="form-group">
                                    <label><strong>Full Name</strong></label>
                                    <input value="${sessionScope.acc.firstname}${sessionScope.acc.lastname}"name="fullname" type="text" class="form-control" placeholder="Enter Full Name" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Email</strong></label>
                                    <input value="${sessionScope.acc.email}"name="email" type="text" class="form-control" placeholder="Enter Email" required>
                                </div>
                                <div class="form-group">
                                    <label><strong>Address</strong></label>
                                    <input value="${sessionScope.acc.address}"name="address" type="text" class="form-control" placeholder="Enter Address" required>
                                </div> 
                                <div class="form-group">
                                    <label><strong>Phone</strong></label>
                                    <input value="${sessionScope.acc.phone}"name="phone" type="number" class="form-control" placeholder="Enter Phone" required>
                                </div> 
                                <div class="float-right text-right">
                                    <h4>Total:</h4>
                                    <h1><fmt:formatNumber value="${o.totalMoney}" type="number" pattern="###,###đ"/></h1>
                                </div>
                                
                                <div class="col-sm-6 order-md-2 text-right">
                                    <button type="submit" class="btn btn-outline-primary mb-4 btn-lg pl-5 pr-5">Checkout</button>
                                </div>
                            </form>
                        </c:if>

                    </div>
                </div>
                <div class="row mt-4 d-flex align-items-center">


                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">


                        <c:choose>
                            <c:when test="${ad != null}">
                                <a style="text-decoration: none;"href="LoadDB">
                                    <i class="fas fa-arrow-left mr-2"></i> Continue Shopping</a>
                                </c:when>

                            <c:otherwise>
                                <a style="text-decoration: none;"href="Login/Login.jsp">
                                    Login</a>
                                </c:otherwise>
                            </c:choose>

                    </div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
