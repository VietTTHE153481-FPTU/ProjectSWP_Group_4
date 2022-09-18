<%-- 
    Document   : detail
    Created on : Jul 17, 2022, 8:56:22 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Detail Product</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_responsive.css">
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
                                        <li class="account">
                                            <a href="#">
                                                My Account
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="account_selection">
                                                <c:choose>
                                                    <c:when test="${sessionScope.account != null}">
                                                        <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
                                                        <li><a href="register"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
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
                                    <a href="home.jsp">Levents<span>shop</span></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="home">home</a></li>
                                        <li><a href="products">shop</a></li>
                                    </ul>
                                    <ul class="navbar_user">
                                        <li class="checkout">
                                            <a href="show">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                <span id="checkout_items" class="checkout_items">${requestScope.size}</span>
                                            </a>
                                        </li>&nbsp;&nbsp;&nbsp;
                                    </ul>
                                    <a style="color: #000" href="#">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <span>${sessionScope.account.fullname}</span>
                                    </a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="container single_product_container">
                <div class="row">
                    <div class="col">
                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="products"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
                                <li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>${detail.name}</a></li></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="single_product_pics">
                            <div class="row">
                                <div class="col-lg-9 image_col order-lg-2 order-1">
                                    <div class="single_product_image">
                                        <div class="single_product_image_background" style="background-image:url(${detail.image})"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="product_details">
                            <div class="product_details_title">
                                <h2>${detail.name}</h2>
                                <dt>Description</dt>
                                <p>${detail.describe}</p>
                                <p>${detail.materials}</p>
                            </div>
                            <div class="product_price">₫ ${detail.price}</div>
                            <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                                <span>Quantity:</span>
                                <div class="quantity_selector">
                                    <span class="minus"><i class="fa fa-minus" aria-hidden="true"><a href="sub?id=${detail.id}"></a></i></span>
                                    <span id="quantity_value">${detail.quantity}</span>
                                    <span class="plus"><i class="fa fa-plus" aria-hidden="true"><a href="cart?id=${detail.id}"></a></i></span>
                                </div>
                            </div>
                            <br/>
                            <div class="red_button add_to_cart_button"><a href="cart?id=${detail.id}">add to cart</a></div>
                        </div>
                    </div>
                    <a href="products" class="fa fa-angle-double-left">&nbsp; Back</a>
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
                        <div class="col-lg-6">
                            <form action="post">
                                <div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
                                    <input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
                                    <button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
                                </div>
                            </form>
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
        <script src="js/detail_custom.js"></script>
    </body>
</html>
