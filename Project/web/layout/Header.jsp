<%-- 
    Document   : Header
    Created on : Oct 1, 2022, 6:35:53 PM
    Author     : Minhm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                            <li><a href="userprofile"><i class="fa fa-user-circle-o" aria-hidden="true"></i>View Profile</a></li>
                                            <li><a href="viewChat"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-inbox" viewBox="0 0 16 16">
                                                        <path d="M4.98 4a.5.5 0 0 0-.39.188L1.54 8H6a.5.5 0 0 1 .5.5 1.5 1.5 0 1 0 3 0A.5.5 0 0 1 10 8h4.46l-3.05-3.812A.5.5 0 0 0 11.02 4H4.98zm9.954 5H10.45a2.5 2.5 0 0 1-4.9 0H1.066l.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438L14.933 9zM3.809 3.563A1.5 1.5 0 0 1 4.981 3h6.038a1.5 1.5 0 0 1 1.172.563l3.7 4.625a.5.5 0 0 1 .105.374l-.39 3.124A1.5 1.5 0 0 1 14.117 13H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .106-.374l3.7-4.625z"/>
                                                    </svg> Chat</a></li>
                                            <!-- Admin -->
                                            <c:if test="${sessionScope.account.roleId == 1}">
                                                <li><a href="dashboard"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a></li>
                                                </c:if>
                                            <!-- Seller -->
                                            <c:if test="${sessionScope.account.roleId == 2}">
                                                <li><a href="mktdashboard"><i class="fa fa-dashboard" aria-hidden="true"></i>Management</a></li>
                                                </c:if>
                                            <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
                                            <li><a href="register"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
                                            <li><a href="introduction"><i class="fa fa-info-circle" aria-hidden="true"></i>About US</a></li>
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
                        <nav class="navbar">
                            <a href="home">Levents<span>shop</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <ul class="navbar_menu">
                                <li><a href="home">home</a></li>
                                <li><a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">Product</a></li>
                                <li><a href="bloglist?key=">blogs</a></li>
                                <li><a href="helpcenter">service</a></li>
                                <li><a href="#">contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <nav class="navbar">
                        <ul class="navbar_user">
                            <li class="checkout">
                                <a href="ViewCartServlet">
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
