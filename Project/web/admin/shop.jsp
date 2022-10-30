<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Shop Management</title>
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
                            <form action="" class="app-search d-none d-md-block me-3">
                                <li class="in">
                                    <input value="${search}" type="text" name="key" placeholder="Search..." class="form-control mt-0">
                                </li>
                            </form>
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="resources/img/logo_admin.jpg" alt="user-img" class="img-circle" width="36">
                                    <span class="text-white font-medium">${sessionScope.account.fullname}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <div class="scroll-sidebar">
                    <nav class="sidebar-nav">
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <ul id="sidebarnav">
                                    <li class="sidebar-item pt-2">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard"
                                           aria-expanded="false">
                                            <i class="fa fa-dashboard" aria-hidden="true"></i>
                                            <span class="hide-menu">Dashboard</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="account?key="
                                           aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="hide-menu">Account Management</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="shop?key="
                                           aria-expanded="false">
                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                            <span class="hide-menu">Shop Management</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item pt-2">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="service"
                                           aria-expanded="false">
                                            <i class="fa fa-server" aria-hidden="true"></i>
                                            <span class="hide-menu">Service Management</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="home"
                                           aria-expanded="false">
                                            <i class="fa fa-sign-out" aria-hidden="true"></i>   
                                            <span class="hide-menu">Back To Shop</span>
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
                            <h4 class="page-title">Shop Management</h4>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="white-box">
                            <div id="ct-visits">
                                <div class="box-title analytics-info">
                                    <h3 class="box-title">Total Shop: ${num} <i class="fa fa-cart-plus" style="color: #ff0000"></i></h3>
                                </div>
                                <form action="shop" method="get">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>#</th>
                                            <th>SHOP NAME</th>
                                            <th>SELLER<th>
                                            <th>PHONE<th>
                                            <th>EMAIL<th>
                                            <th>ACTION</th>
                                        </tr>
                                        <c:forEach items="${listshop}" var="shop">
                                            <c:forEach items="${user}" var="u">
                                                <c:if test="${shop.ID == u.shopId}">
                                                    <tr>
                                                        <td>${shop.getID()}</td>
                                                        <td>${shop.getShopName()}</td>
                                                        <td>${u.fullname}</td>
                                                        <td>&nbsp;</td>
                                                        <td>${u.phone}</td>
                                                        <td>&nbsp;</td>
                                                        <td>${u.email}</td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <a href="shopdetail?id=${shop.ID}"><i class="fa fa-eye"></i></a>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <a href="#"><i class="fa fa-close"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom_admin.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
    </body>
</html>
