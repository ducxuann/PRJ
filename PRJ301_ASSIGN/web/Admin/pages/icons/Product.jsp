<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
        <link rel="stylesheet" href="Admin/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="Admin/assets/vendors/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="Admin/assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="Admin/assets/vendors/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="Admin/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="Admin/assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="Admin/assets/images/favicon.png" />
        <script src="https://kit.fontawesome.com/ecdabb78c5.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class=" container-scroller">
            <jsp:include page="../../BarAdmin.jsp"></jsp:include>
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:../../partials/_sidebar.html -->
                    <nav class="sidebar sidebar-offcanvas" id="sidebar">
                        <ul class="nav">
                            <li class="nav-item nav-category">Main</li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                                <span class="icon-bg"><i class="mdi mdi-contacts menu-icon"></i></span>
                                <span class="menu-title">Users</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/orderdetail">
                                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                                <span class="menu-title">Order</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/productdetail">
                                <span class="icon-bg"><i class="mdi mdi-chart-bar menu-icon"></i></span>
                                <span class="menu-title">Product</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/categoryadmin">
                                <span class="icon-bg"><i class="mdi mdi-table-large menu-icon"></i></span>
                                <span class="menu-title">Category</span>
                            </a>
                        </li>
                        <li class="nav-item sidebar-user-actions">
                            <div class="sidebar-user-menu">
                                <a href="../logout" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                                    <span class="menu-title">Log Out</span></a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title"> Product Manager </h3>
                            <a href="addproduct"><button type="button" class="btn btn-primary">Add New Product</button></a>

                        </div>


                        <div style="background-color: white;" class="row">
                            <div class="col-lg-12 grid-margin">
                                <table id="formProduct" class="table table-hover" style="text-align: center; margin-top: 10px; display: inline-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Action</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProduct}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.name}</td>
                                                <td><img class="card-img-top" src="${o.image}" style="max-width: 100%" alt="..."></td>
                                                <td><fmt:formatNumber value="${o.price}" type="number" pattern="###,###đ"/></td>
                                                <td>${o.cname}</td> 
                                                <td>${o.count}</td> 
                                                <td>
                                                    <a href="editproduct?id=${o.id}"><i style="font-size: 20px; margin-right: 15px" class="fa-solid fa-user-pen"></i></a>
                                                    <a href="deleteproduct?id=${o.id}" style="color: red;"><i style="font-size: 20px;" class="fa-solid fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>

                                <form onsubmit="return validateForm()" name="formEdit" style="display: none; padding: 20px 10px;" id="formEdit" action="processeditpradmin" method="post">
                                    <input hidden name="id" value="${list.id}" type="text" class="form-control" placeholder="Enter ID" readonly>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" value="${list.name}" type="text" class="form-control" placeholder="Enter Name">
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" value="${list.image}" type="text" class="form-control" placeholder="Enter Image">
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input min="0" name="price" value="${list.price}" type="number" class="form-control" placeholder="Enter Price">
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea  name="description" class="form-control" placeholder="Enter Description" rows="3">${list.des}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <h2 style="color: green;">Current: ${list.cname}</h2>
                                        <select name="category">
                                            <c:forEach items="${listCategory}" var="list">
                                                <option value="${list.cid}">${list.cname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div style="display: flex; flex-direction: column" class="form-group">

                                        <c:forEach items="${listSize}" var="size">
                                            <label for="size-${size.size}">Size ${size.size}:</label>
                                            <input min="0" value="${size.quantity}" class="form-control" type="number" name="size-${size.size}" style="display: inline-block; width: 20%;" placeholder="Enter quantity size" required><br>
                                        </c:forEach>


                                    </div>

                                    <button type="submit" class="btn btn-primary">Save Change</button>
                                </form>

                                <div style="text-align: center; text-decoration: none">
                                    <c:forEach begin="1" end="${endP}" var="i" >
                                        <a style="padding: 5px 15px 5px 15px; border: 1px solid black;" class="${tag == i?"active":""}" href="productdetail?index=${i}">${i}</a>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script>


                        const formProduct = document.getElementById('formProduct');
                        const formEdit = document.getElementById('formEdit');


                        if (window.location.href.indexOf("editproduct") != -1) {
                            formProduct.style.display = "none";
                            formEdit.style.display = "block";
                        } else {
                            formEdit.style.display = "none";


                        }


                    </script>
                    <!-- partial:../../partials/_footer.html -->
                    <footer class="footer">
                        <div class="footer-inner-wraper">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            </div>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
            </div>
        </div>
        <!-- plugins:js -->
        <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="../../assets/js/off-canvas.js"></script>
        <script src="../../assets/js/hoverable-collapse.js"></script>
        <script src="../../assets/js/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page -->
        <!-- End custom js for this page -->
    </body>
</html>