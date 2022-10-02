<%-- 
    Document   : product
    Created on : Jun 22, 2022, 9:12:20 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Categories</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
    </head>
    <body>
        <div class="super_container">
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
                                                        <li><a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i>View Profile</a></li>
                                                        <!-- Admin -->
                                                        <c:if test="${sessionScope.account.roleId == 1}">
                                                            <li><a href="#"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a></li>
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
                                        <li><a href="products?page=1&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">product</a></li>
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
            <div class="container product_section_container">
                <div class="row">
                    <div class="col product_section clearfix">
                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li class="active"><a href="products?page=1&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <div class="sidebar_section">
                                <!--Category-->
                                <div class="sidebar_title">
                                    <h5>Product Category</h5>
                                </div>
                                <ul class="sidebar_categories">
                                    <ul>
                                        <c:forEach items="${categorys}" var="icategory">
                                            <li class="${tag == icategory.getCategoryID() ? "active":""}">
                                                <a href="products?page=1&cid=${icategory.getCategoryID()}&sid=${0}&sortType=${0}&sortMode=${0}">
                                                    <span><i class="fa fa-angle-double-right" aria-hidden="true"></i></span>
                                                        ${icategory.getCategoryName()}
                                                </a>
                                            </li>
                                            <c:forEach items="${subcategorys}" var="isubcategory">
                                                <c:if test="${isubcategory.getCateID() == icategory.getCategoryID()}">
                                                    <li class="">
                                                        <a class="form-check-label" href="products?page=1&cid=${icategory.getCategoryID()}&sid=${isubcategory.getSubCateID()}&sortType=${0}&sortMode=${0}">
                                                            ${isubcategory.getSubCateName()} 
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </ul>
                                </ul>
                            </div>
                        </div>
                        <div class="main_content">
                            <div class="products_iso">
                                <div class="row">
                                    <div class="col">
                                        <div class="btn-group flex-wrap pb-3" role="group" aria-label="Basic example">
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-outline-dark dropdown-toggle ${sortType==1?'active':''}" data-toggle="dropdown">
                                                    Sort by price
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==1&&sortMode==1?'0':'1'}&sortMode=${sortType==1&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==1&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==1&&sortMode==2?'0':'1'}&sortMode=${sortType==1&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==1&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                </ul>
                                            </div>
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-outline-dark dropdown-toggle ${sortType==2?'active':''}" data-toggle="dropdown">
                                                    Sort by sale
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==2&&sortMode==1?'0':'2'}&sortMode=${sortType==2&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==2&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==2&&sortMode==2?'0':'2'}&sortMode=${sortType==2&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==2&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                </ul>
                                            </div>
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-outline-dark dropdown-toggle ${sortType==3?'active':''}" data-toggle="dropdown">
                                                    Sort by name
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==3&&sortMode==2?'0':'3'}&sortMode=${sortType==3&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==3&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                    <li><a class="dropdown-item" href="products?page=1&cid=${cid}&sid=${sid}&sortType=${sortType==3&&sortMode==1?'0':'3'}&sortMode=${sortType==3&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==3&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <ul>
                                                <c:forEach items="${listPdByCid}" var="pd">
                                                    <div class="product-item">
                                                        <div class="product discount product_filter">
                                                            <div class="product_image">
                                                                <img src="resources/img/products/${pd.getUrl()}" height="230px"/>
                                                            </div>
                                                            <div class="favorite favorite_left"></div>
                                                            <c:if test="${pd.getSalePercent()>0}">
                                                                <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${pd.getSalePercent()}%</span></div>
                                                            </c:if>
                                                            <div class="product_info">
                                                                <h6 class="product_name"><a href="detail?id=${pd.getProductID()}">${pd.getProductName()}</a></h6>
                                                                <div class="product_price">₫ ${pd.getSellPrice()}
                                                                    <c:if test="${pd.getSalePercent()>0}">
                                                                        <span>₫ ${pd.getOriginalPrice()}</span>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                                                    </div>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <nav class="my-3" aria-label="Page navigation">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${page>1?'':'disabled'}"><a class="page-link" href="products?page=${page-1}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">Previous</a></li>
                                                    <c:if test="${page-2>0}">
                                                    <li class="page-item"><a class="page-link" href="products?page=${page-2}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page-2}</a></li>
                                                    </c:if>
                                                    <c:if test="${page-1>0}">
                                                    <li class="page-item"><a class="page-link" href="products?page=${page-1}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page-1}</a></li>
                                                    </c:if>
                                                <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                                    <c:if test="${page+1<=maxPage}">
                                                    <li class="page-item"><a class="page-link" href="products?page=${page+1}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page+1}</a></li>
                                                    </c:if>
                                                    <c:if test="${page+2<=maxPage}">
                                                    <li class="page-item"><a class="page-link" href="products?page=${page+2}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page+2}</a></li>
                                                    </c:if>
                                                <li class="page-item ${page+1<=maxPage?'':'disabled'}"><a class="page-link" href="products?page=${page+1}&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">Next</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="newsletter">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
                                <h4>Newsletter</h4>
                                <p>Subscribe to our newsletter and get 20% off your first purchase</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                                <ul class="footer_nav">
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">FAQs</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook" 
                                                       aria-hidden="true"></i> Facebook</a></li><br/>
                                    <li><a href="#"><i class="fa fa-instagram" 
                                                       aria-hidden="true"></i> Instagram</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer_nav_container">
                                <div class="cr">©2022 Levents Shop. All Rights Reserved.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/categories_custom.js"></script>
    </body>
</html>
