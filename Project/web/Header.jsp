<%-- 
    Document   : Header
    Created on : Oct 1, 2022, 6:35:53 PM
    Author     : Minhm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <header class="header trans_300">
                <div class="top_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6 text-right">
                                <div class="top_nav_right">
                                    <ul class="top_nav_menu">
                                        <c:if test="${sessionScope.account.roleId != 1 && sessionScope.account.roleId != 2}">
                                            <li class="account">
                                                <a style="color: #ffffff" href="registerseller">
                                                    Become a seller
                                                </a>
                                            </li>
                                        </c:if>
                                        <li class="account">
                                            <a style="color: #ffffff" href="#">
                                                <c:if test="${sessionScope.account == null}">
                                                    My Account
                                                    <i class="fa fa-angle-down"></i>
                                                </c:if>
                                                <c:if test="${sessionScope.account != null}">
                                                    <i class="fa fa-user" aria-hidden="true"></i>
                                                    <span>&nbsp;Hello, ${sessionScope.account.fullname}</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </c:if>
                                            </a>
                                            <ul class="account_selection">
                                                <c:choose>
                                                    <c:when test="${sessionScope.account != null}">
                                                        <!-- Default -->
                                                        <li><a href="profile"><i class="fa fa-user-circle-o" aria-hidden="true"></i>View Profile</a></li>
                                                        <!-- Admin -->
                                                        <c:if test="${sessionScope.account.roleId == 1}">
                                                            <li><a href="dashboard.jsp"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a></li>
                                                            </c:if>
                                                        <!-- Seller -->
                                                        <c:if test="${sessionScope.account.roleId == 2}">
                                                            <li><a href="#"><i class="fa fa-dashboard" aria-hidden="true"></i>Management</a></li>
                                                            </c:if>
                                                        <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
                                                        <li><a href="register"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
                                                        <li><a href="#"><i class="fa fa-info-circle" aria-hidden="true"></i>About US</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main_nav_container">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-right">
                                <div class="logo_container">
                                    <a href="home">Levents<span>shop</span></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="home">home</a></li>
                                        <li><a href="products?page=1&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">Product</a></li>
                                        <li><a href="#">blogs</a></li>
                                        <li><a href="#">contact</a></li>
                                    </ul>
                                    <ul class="navbar_user">
                                        <li class="navbar-brand">
                                            <form action="search?index=1" method="post" class="app-search d-none d-md-block me-3">
                                                <div class="input-group input-group-sm">
                                                    <input name="txtSearch" type="text" placeholder="Search..." class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
                                                    <div class="input-group-append">&nbsp;
                                                        <button type="submit" class="btn btn-secondary">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </li>
                                        <li class="checkout">
                                            <a href="show">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                    </ul>&nbsp;&nbsp;&nbsp;
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
    </body>
</html>
