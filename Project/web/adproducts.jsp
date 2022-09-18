<%-- 
    Document   : adproducts
    Created on : Jun 30, 2022, 4:05:56 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Page</title>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link href="styles/css/style.min.css" rel="stylesheet">
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <a class="navbar-brand" href="dashboard.jsp">
                            <b class="logo-icon">
                                <img src="images/logo-icon.jpg" alt="homepage" />
                            </b>
                            <span class="logo-text">
                                <img src="images/logo-text.jpg" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <ul class="navbar-nav ms-auto d-flex align-items-center">
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="images/logo_admin.png" alt="user-img" width="36"
                                         class="img-circle"><span class="text-white font-medium">${sessionScope.admin.username}</span></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <div class="scroll-sidebar">
                    <nav class="sidebar-nav">
                        <c:choose>
                            <c:when test="${sessionScope.admin != null}">
                                <ul id="sidebarnav">
                                    <li class="sidebar-item pt-2">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard.jsp"
                                           aria-expanded="false">
                                            <i class="fa fa-dashboard" aria-hidden="true"></i>
                                            <span class="hide-menu">Dashboard</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="account"
                                           aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="hide-menu">Profile</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="adproducts"
                                           aria-expanded="false">
                                            <i class="fa fa-product-hunt" aria-hidden="true"></i>
                                            <span class="hide-menu">Products</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="adlogout"
                                           aria-expanded="false">
                                            <i class="fa fa-sign-out" aria-hidden="true"></i>   
                                            <span class="hide-menu">Logout</span>
                                        </a>
                                    </li>
                                </ul>
                            </c:when>
                        </c:choose>
                    </nav>
                </div>
            </aside>
            <div class="page-wrapper">
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Products Admin</h4>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="white-box">
                            <center>
                                <a href="newproduct" class="btn btn-primary btn-block text-uppercase mb-3">
                                    Add new product
                                </a>
                            </center>
                            <div id="ct-visits" style="height: auto;">
                                <table class="table table-hover">
                                    <tr>
                                        <th>ID</th>
                                        <th>PRODUCT NAME</th>
                                        <th>PRICE</th>
                                        <th>DESCRIBE</th>
                                        <th>MATERIALS</th>
                                        <th>ACTION</th>
                                    </tr>
                                    <c:forEach items="${requestScope.product}" var="p">
                                        <c:set var="id" value="${p.id}"/>
                                        <tr>
                                            <td>${id}</td>
                                            <td>${p.name}</td>
                                            <td>₫ ${p.price}</td>
                                            <td>${p.describe}</td>
                                            <td>${p.materials}</td>
                                            <td>
                                                <a href="loadproduct?id=${p.id}">
                                                    <i class="fa fa-edit"></i>
                                                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="#" onclick="Delete('${id}')">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <br/>
                            <center>
                                <a href="newproduct" class="btn btn-primary btn-block text-uppercase mb-3">
                                    Add new product
                                </a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function Delete(id) {
                if (confirm("Are you sure want to delete Product with Id = " + id + "?")) {
                    window.location = "deleteproduct?id=" + id;
                }
            }
        </script>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom_admin.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
    </body>
</html>
