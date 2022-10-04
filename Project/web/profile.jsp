<%-- 
    Document   : profile
    Created on : Jun 30, 2022, 3:15:20 AM
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
                        <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <ul class="navbar-nav ms-auto d-flex align-items-center">
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="resources/img/logo_admin.jpg" alt="user-img" width="36"
                                         class="img-circle"><span class="text-white font-medium">${sessionScope.account.fullname}</span></a>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard.jsp"
                                           aria-expanded="false">
                                            <i class="fa fa-dashboard" aria-hidden="true"></i>
                                            <span class="hide-menu">Dashboard</span>
                                        </a>
                                    </li>
                                    <c:if test="${account.roleId==1}">
                                    <li class="sidebar-item">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="account"
                                           aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="hide-menu">Account Management</span>
                                        </a>
                                    </li>
                                    </c:if>
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
                                            <a href="javascript:void(0)"><img src="resources/img/logo_admin.jpg"
                                                                              class="thumb-lg img-circle" alt="img"></a>
                                            <h4 class="text-white mt-2">${account.fullname}</h4>
                                            <h5 class="text-white mt-2">${account.email}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<c:set var="p" value="${requestScope.ac}"/>--%>
                        <div class="col-lg-8 col-xlg-9 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form class="form-horizontal form-material">
                                        <div class="form-group mb-4">
                                            <div class="col-md-12 border-bottom p-0">Full Name
                                                <input value="${account.fullname}" type="text" name="fullname" class="form-control validate" readonly required/>
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-md-12 border-bottom p-0">Phone Number
                                                <input value="${account.phone}" type="text" name="phone" class="form-control validate" readonly required/>
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-md-12 border-bottom p-0">Password
                                                <input value="${account.password}" type="password" name="password" class="form-control validate" readonly required/>
                                                <button onclick="change()">Đổi mật khẩu</button> <br>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="display: none;" id="change_pass">
                                            <form action="account" method="post" onsubmit="return check()">
                                                <input type="password" id="pass_old1" value="${sessionScope.acc.pass}" hidden>
                                                <h3>Nhập lại mật khẩu cũ*</h3>
                                                <input type="password" id="pass_old2" required placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$" >            
                                                <br>
                                                <h3>Nhập mật khẩu mới*</h3>
                                                <input type="password" id="pass_new1" required placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$"> <br>
                                                <h3>Nhập lại mật khẩu mới*</h3>
                                                <input type="password" id="pass_new2" name="pass_new" required placeholder="Phải giống MK mới ở trên"> 
                                                <br><br>
                                                <span id="message" style="color: red;"></span> <br>
                                                <input type="submit" value="Xác nhận"> 
                                            </form>
                                        </div>  
                                        <div>Gender
                                            <br/>
                                            <br/>
                                            <input type="radio" name="gender" checked value="${account.gender}"> Male &nbsp;&nbsp;&nbsp;
                                            <input type="radio" name="gender" value="${account.gender}"> Female
                                        </div>
                                        <br/>
                                        <div class="form-group mb-4">
                                            <div class="col-md-12 border-bottom p-0">Email
                                                <input value="${account.email}" type="email" class="form-control p-0 border-0" name="email" readonly required>
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-sm-12">
                                                <a href="home" class="btn btn-success">Back</a>
                                                <a href="profileupdate" class="btn btn-success">Update Profile</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function change() {
                var x = document.getElementById("change_pass");
                x.style.display = "block";
            }
            function check() {
                var o1 = document.getElementById("pass_old1");
                var o2 = document.getElementById("pass_old2");
                var n1 = document.getElementById("pass_new1");
                var n2 = document.getElementById("pass_new2");
                if (o1.value != o2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập đúng MK cũ";
                    return false;
                } else if (n1.value != n2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập lại đúng MK mới";
                    return false;
                }
                return true;
            }
        </script>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
    </body>
</html>
