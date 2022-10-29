<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="account?key="
                                           aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="hide-menu">Account Management</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="shop?key="
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
                            <h4 class="page-title">Profile</h4>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-xlg-3 col-md-12">
                            <div class="white-box">
                                <div class="user-bg">
                                    <div class="overlay-box">
                                        <div class="user-content">
                                            <img src="resources/img/logo_admin.jpg" class="thumb-lg img-circle" alt="img">
                                            <h4 class="text-white mt-2">${profile.fullname}</h4>
                                            <h5 class="text-white mt-2">${profile.email}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-xlg-9 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-horizontal form-material">
                                        <div class="row mt-3">
                                            <div class="col-md-6">Full Name
                                                <input value="${profile.fullname}" type="text" class="form-control validate" readonly required/>
                                            </div>
                                            <div class="col-md-6">Phone Number
                                                <input value="${profile.phone}" type="text" class="form-control validate" readonly required/>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-6">Email
                                                <input value="${profile.email}" type="email" class="form-control validate" readonly required>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-6">Gender
                                                <br>
                                                <c:if test="${profile.gender == false}">
                                                    <input type="radio" name="gender" checked value="0"> Male &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" name="gender"  value="1"> Female
                                                </c:if>
                                                <c:if test="${profile.gender == true}">
                                                    <input type="radio" name="gender" value="0"> Male &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" name="gender" checked  value="1"> Female
                                                </c:if>
                                            </div>
                                            <div class="col-md-6">Role
                                                <br>
                                                <c:if test="${profile.roleId == 1}">
                                                    <input type="radio" checked value="1"> Admin &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="2"> Seller &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="3"> Customer &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="4"> Shipper 
                                                </c:if>
                                                <c:if test="${profile.roleId == 2}">
                                                    <input type="radio" value="1"> Admin &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" checked value="2"> Seller &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="3"> Customer &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="4"> Shipper 
                                                </c:if>
                                                <c:if test="${profile.roleId == 3}">
                                                    <input type="radio" value="1"> Admin &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="2"> Seller &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" checked value="3"> Customer &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="4"> Shipper 
                                                </c:if>
                                                <c:if test="${profile.roleId == 4}">
                                                    <input type="radio" value="1"> Admin &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="2"> Seller &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" value="3"> Customer &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" checked value="4"> Shipper 
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="row mt-5">
                                            <div class="col-sm-6">
                                                <a href="account?key=" class="btn btn-success">Back</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
    </body>
</html>
