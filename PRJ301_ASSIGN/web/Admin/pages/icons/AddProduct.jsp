<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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


                <!-- partial -->
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
                            <h3 class="page-title"> Add Product </h3>



                        </div>
                        <div style="background-color: white;" class="row">
                            <div class="col-lg-12 grid-margin">
                                <form onsubmit="return validateForm()" name="formAdd" method="post" action="addproduct" style="padding: 20px 10px;">
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Product Name</label>
                                        <input name="productname" type="text" class="form-control" placeholder="Enter product name" required>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Image</label>
                                        <input name="image" type="text" class="form-control" placeholder="Enter image" required>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Price</label>
                                        <input min="0" name="price" type="number" class="form-control" placeholder="Enter price" required>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Description</label>
                                        <textarea name="description" type="text" class="form-control" placeholder="Enter description" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Category</label><br>
                                        <select name="category" required>
                                            <c:forEach items="${listCategory}" var="category">
                                                <option value="${category.cid}">${category.cname}</option>  
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div style="display: flex; flex-direction: column" class="form-group">
                                        <label for="size-s">Size S:</label>
                                        <input min="0" value="0" class="form-control" type="number" id="size-s" name="size-s" style="display: inline-block; width: 20%;" placeholder="Enter quantity size" required><br>
                                        <label for="size-m">Size M:</label>
                                        <input min="0" value="0" class="form-control" type="number" id="size-m" name="size-m" style="display: inline-block; width: 20%;" placeholder="Enter quantity size" required><br>

                                        <label for="size-l">Size L:</label>
                                        <input min="0" value="0" class="form-control" type="number" id="size-l" name="size-l" style="display: inline-block; width: 20%;" placeholder="Enter quantity size" required><br>

                                        <label for="size-xl">Size XL:</label>
                                        <input min="0" value="0" class="form-control" type="number" id="size-xl" name="size-xl" style="display: inline-block; width: 20%;" placeholder="Enter quantity size" required>

                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">ADD</button>
                                    </div>


                                </form>

                            </div>
                        </div>
                    </div>

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

        <script>
            function validateForm() {
                let a = document.forms["formAdd"]["price"].value;
                let b = document.forms["formAdd"]["size-s"].value;
                let c = document.forms["formAdd"]["size-m"].value;
                let d = document.forms["formAdd"]["size-l"].value;
                let e = document.forms["formAdd"]["size-xl"].value;
                if (a < 0 || b < 0 || c < 0 || d < 0 || e < 0) {
                    alert("Không nhập giá trị âm.");
                    return false;
                }

            }
        </script>

    </body>
</html>