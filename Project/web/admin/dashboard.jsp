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
        <link rel="stylesheet" href="plugins/bower_components/chartist/chartist.min.css">
        <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/chartist-plugin-tooltip.css">
        <link href="styles/css/style.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="account?key="
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="viewreport"
                                           aria-expanded="false">
                                            <i class="fa fa-server" aria-hidden="true"></i>
                                            <span class="hide-menu">Reports from users</span>
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
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total Customer</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash">
                                            <canvas width="67" height="30" style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-success">${customercount} <i class="fa fa-user"></i></span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total Seller</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash3"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-info">${sellercount} <i class="fa fa-user"></i></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total Products</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash2"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-purple">${productcount} <i class="fa fa-product-hunt"></i></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="white-box col-lg-8">
                                <canvas id="myChart2" style="width:100%;max-width:100%"></canvas>
                                <h3 class="box-title">Clicks tracker</h3>
                                <div id="ct-visits" style="height: 100px">
                                </div>
                            </div>
                            <div class="white-box col-lg-4">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            
            
            
            
            var xValues2 = ["Today", "Yesterday", "2days ago", "3days ago", "4days ago", "5days ago", "6days ago"];
            var yValues2 =
                    [
            ${requestScope.graph.get(0)}
                        , ${requestScope.graph.get(1)}
                        , ${requestScope.graph.get(2)}
                        , ${requestScope.graph.get(3)}
                        , ${requestScope.graph.get(4)}
                        , ${requestScope.graph.get(5)}
                        , ${requestScope.graph.get(6)}
                    ];

            new Chart("myChart2", {
                type: "line",
                data: {
                    labels: xValues2,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: "rgba(0,0,255,1.0)",
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues2
                        }]
                },
                options: {
                    legend: {display: false},
                    scales: {
                        yAxes: [{ticks: {min: 6, max: 16}}],
                    }
                }
            });

//            var myCanvas1 = document.getElementById("myCanvas1");
//            myCanvas1.width = 300;
//            myCanvas1.height = 300;
//
//            var ctx = myCanvas1.getContext("2d");
//            function drawLine(ctx, startX, startY, endX, endY, color) {
//                ctx.save();
//                ctx.strokeStyle = color;
//                ctx.beginPath();
//                ctx.moveTo(startX, startY);
//                ctx.lineTo(endX, endY);
//                ctx.stroke();
//                ctx.restore();
//            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
