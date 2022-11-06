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
                                            <li><a href="viewChat"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-paper-fill" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M6.5 9.5 3 7.5v-6A1.5 1.5 0 0 1 4.5 0h7A1.5 1.5 0 0 1 13 1.5v6l-3.5 2L8 8.75l-1.5.75ZM1.059 3.635 2 3.133v3.753L0 5.713V5.4a2 2 0 0 1 1.059-1.765ZM16 5.713l-2 1.173V3.133l.941.502A2 2 0 0 1 16 5.4v.313Zm0 1.16-5.693 3.337L16 13.372v-6.5Zm-8 3.199 7.941 4.412A2 2 0 0 1 14 16H2a2 2 0 0 1-1.941-1.516L8 10.072Zm-8 3.3 5.693-3.162L0 6.873v6.5Z"/>
                                                    </svg> Chat</a></li>
                                            <li style="display: none"><a href="History"><i class="fa fa-history" aria-hidden="true"></i>Product History</a></li>
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
                                <li><a href="bloglist">blogs</a></li>
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
                            <li class="">
                                <a href="UserNoti">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                                        <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                                    </svg>
                                </a>
                            </li>
                        </ul>&nbsp;&nbsp;&nbsp;
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
