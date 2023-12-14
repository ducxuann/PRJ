<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
        <link rel="stylesheet" href="../Admin/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../Admin/assets/vendors/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="../Admin/assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="../Admin/assets/vendors/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="../Admin/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="../Admin/assets/css/style.css">
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
                            <h3 class="page-title"> Add Users </h3>



                        </div>
                        <div style="background-color: white;" class="row">
                            <div class="col-lg-12 grid-margin">
                                <form method="post" action="../processadduser" style="padding: 20px 10px;">
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Username</label>
                                        <div class="col-sm-5">
                                            <input name="username" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Password</label>
                                        <div class="col-sm-5">
                                            <input name="password" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">IsAdmin</label>
                                        <select name="is" autofocus>
                                            <option value="2">Admin</option>
                                            <option value="1">Seller</option>  
                                            <option value="0">User</option>  

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">FirstName</label>
                                        <div class="col-sm-5">
                                            <input name="firstname" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">LastName</label>
                                        <div class="col-sm-5">
                                            <input name="lastname" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Security</label>
                                        <div class="col-sm-5">
                                            <input name="security" type="number" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">Email</label>
                                        <div class="col-sm-5">
                                            <input name="email" type="text" class="form-control" pattern=".+@gmail\.com" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label lass="col-sm-1 col-form-label">SetActive</label>
                                        <select name="isActive" autofocus>
                                            <option value="1">Active</option>  
                                            <option value="0">Not Active</option>  

                                        </select>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <button type="submit" class="btn btn-primary">ADD</button>
                                        </div>
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