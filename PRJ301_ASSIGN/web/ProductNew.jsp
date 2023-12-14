<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--New Product-->
<div class="productNew" id="productNewww">
    <p style="text-align: center;font-size: 30px;font-weight: 800; margin-top: 18px;margin-bottom: 18px;">${p != null?"New Product":""}</p>
    <div class="allspNew" style="display: flex; text-align: center; justify-content: center;gap: 50px; padding: 50px;">

        <c:forEach items="${p}" var="o">
            <div class="card h-100" style="padding-right: 10px; padding-left: 10px;">
                <p style="font-weight: 500; font-size: 20px;"><a href="details?pid=${o.id}" title="View"><img class="card-img-top" src="${o.image}" style="max-width: 100%"/></a></p>
                <h5><a class="fw-bolder" href="details?pid=${o.id}" title="View" style="text-decoration: none; color: black;">${o.name}</a></h5>
                <p style="font-size: 23px;"><fmt:formatNumber value="${o.price}" type="number" pattern="###,###đ"/></p>
                <!-- Product actions-->
                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
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
        </c:forEach>
    </div>
</div>
