<%-- 
    Document   : dashboard
    Created on : Oct 26, 2022, 1:52:20 AM
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
        <title>Dashboard</title>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link href="plugins/bower_components/chartist/chartist.min.css" rel="stylesheet">
        <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/chartist-plugin-tooltip.css">
        <link href="styles/css/style.min.css" rel="stylesheet">
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <a class="navbar-brand" href="home">
                            <b class="logo-icon">
                                <img src="images/logo-icon.jpg" alt="homepage" />
                            </b>
                            <span class="logo-text">
                                <img src="images/logo-text.jpg" alt="homepage" />
                            </span>
                        </a>
                        <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <ul class="navbar-nav ms-auto d-flex align-items-center">
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="resources/img/logo_admin.jpg" alt="user-img" width="36" class="img-circle">
                                    <span class="text-white font-medium">${sessionScope.account.getFullname()}</span>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="dashboard"
                                           aria-expanded="false">
                                            <i class="fa fa-dashboard" aria-hidden="true"></i>
                                            <span class="hide-menu">Dashboard</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="account"
                                           aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="hide-menu">Account Management</span>
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
                            <h4 class="page-title">Dashboard</h4>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="white-box">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card bg-primary text-white h-100"> 
                                            <div class="card-body py-3">
                                                <h3 class="text-white text-center fs-5">Total Customer</h3>
                                                <p class="text-center text-white mt-3 mb-0 fs-3 ">${customercount} <i class="fa fa-user"></i></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card bg-warning text-dark h-100">
                                            <div class="card-body py-3">
                                                <h3 class="text-white text-center fs-5">Total Product </h3>
                                                <p class="text-center text-white mt-4 mb-0 fs-3">${productcount} <i class="fa fa-archive"></i></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <div class="card bg-danger text-white h-100">
                                            <div class="card-body py-3">
                                                <h3 class="text-white text-center fs-5">Total Order</h3>
                                                <p class="text-center text-white mt-3 mb-0 fs-3">${ordercount} <i class="fa fa-file-invoice-dollar"></i></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="box-title">Detailed statistics</h3>
                                <div id="ct-visits" style="height: 405px;">
                                    <div class="chartist-tooltip" style="top: -17px; left: -12px;"><span
                                            class="chartist-tooltip-value">6</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
        <script src="plugins/bower_components/chartist/chartist.min.js"></script>
        <script src="plugins/bower_components/chartist-plugin-tooltips/chartist-plugin-tooltip.min.js"></script>
    </body>
</html>
