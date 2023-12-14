<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
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
        <link rel="shortcut icon" href="../Admin/assets/images/favicon.png" />
        <script src="https://kit.fontawesome.com/ecdabb78c5.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class=" container-scroller">
            <!-- partial:../../partials/_navbar.html -->

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
                            <h3 class="page-title"> Users Manager </h3>

                        </div>
                        <div style="background-color: white;" class="row">
                            <div class="col-lg-12 grid-margin">
                                <table id="formUser" class="table table-hover" style="text-align: center; margin-top: 10px; display: inline-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Admin/User</th>
                                            <th scope="col">Active</th>
                                            <th scope="col">Action</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUser}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.user}</td>
                                                <td>${o.email}</td>
                                                <td>${o.phone}</td>
                                                <td>${o.firstname} ${o.lastname}</td>
                                                <td style="color: ${o.isAdmin == 0?"black":"red"}">
                                                    <c:choose>
                                                        <c:when test="${o.isAdmin=='0'}">
                                                            User
                                                        </c:when>
                                                        <c:when test="${o.isAdmin=='1'}">
                                                            Admin
                                                        </c:when>   
                                                    </c:choose>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${o.setActive=='0'}">
                                                            Not Active
                                                        </c:when>
                                                        <c:when test="${o.setActive=='1'}">
                                                            Active
                                                        </c:when>   
                                                        <c:otherwise>
                                                            Admin
                                                        </c:otherwise>
                                                    </c:choose></td>
                                                <td>
                                                    <a href="addusers" style="color: green;"><i style="font-size: 20px; margin-right: 15px" class="fa-solid fa-plus"></i></a>

                                                    <a href="edituser?uid=${o.id}"><i style="font-size: 20px; margin-right: 15px" class="fa-solid fa-user-pen"></i></a>
                                                    <a href="users/delete?id=${o.id}" style="color: red;"><i style="font-size: 20px;" class="fa-solid fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>

                                <form method="post" action="../updateinfo" id="formEdit" style="background-color: white; display: block; margin: 20px 10px;">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input name="uid" type="text" class="form-control" value="${listInfo.id}" readonly>

                                    </div>


                                    <div class="form-group">
                                        <label>Username</label>
                                        <input name="username" type="text" class="form-control" value="${listInfo.user}" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <input name="password" type="password" class="form-control" value="${listInfo.pass}">
                                    </div>

                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" type="text" class="form-control" value="${listInfo.email}">
                                    </div>

                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input name="phone" type="text" class="form-control" value="${listInfo.phone}">
                                    </div>

                                    <div class="form-group">
                                        <label>FirstName</label>
                                        <input name="firstname" type="text" class="form-control" value="${listInfo.firstname}">
                                    </div>
                                    <div class="form-group">
                                        <label>LastName</label>
                                        <input name="lastname" type="text" class="form-control" value="${listInfo.lastname}">
                                    </div>
                                    <div class="form-group">
                                        <label>Current: <h3>
                                                <c:choose>
                                                    <c:when test="${listInfo.isAdmin=='0'}">
                                                        User
                                                    </c:when>
                                                    <c:when test="${listInfo.isAdmin=='1'}">
                                                        Admin
                                                    </c:when>   
                                                </c:choose></h3></label>
                                        <select name="is" autofocus>
                                            <option value="1">Admin</option>
                                            <option value="0">User</option>  

                                        </select>
                                    </div>  
                                    <div class="form-group">
                                        <label>Current: <h3>
                                                <c:choose>
                                                    <c:when test="${listInfo.setActive=='0'}">
                                                        Not Active
                                                    </c:when>
                                                    <c:when test="${listInfo.setActive=='1'}">
                                                        Active
                                                    </c:when>   
                                                </c:choose></h3></label>
                                        <select name="isActive" autofocus>
                                            <option value="1">Active</option>  
                                            <option value="0">Not Active</option>  

                                        </select>
                                    </div>  
                                    <button type="submit" class="btn btn-primary">Save Change</button>
                                </form>
                                <div style="text-align: center; text-decoration: none">
                                    <c:forEach begin="1" end="${endP}" var="i" >
                                        <a style="padding: 5px 15px 5px 15px; border: 1px solid black;" class="${tag == i?"active":""}" href="admin/users?index=${i}">${i}</a>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script>
                        const formUser = document.getElementById('formUser');
                        const formEdit = document.getElementById('formEdit');

                        if (window.location.href.indexOf("edituser") != -1) {
                            formUser.style.display = "none";
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