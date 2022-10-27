<%-- 
    Document   : shop
    Created on : Oct 26, 2022, 11:47:57 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/bloglist_style.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container" >
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="breadcrumbs d-flex flex-row align-items-center">
                    <ul>
                        <li><a href="home">Home</a></li>
                        <li><a href="viewshop?id=${account.shopId}"><i class="fa fa-angle-right" aria-hidden="true"></i>Shop</a></li>
                    </ul>
                </div>
                <div class="main_content">
                            <div class="products_iso">
                                <div class="row">
                                    <div class="col">
                                   
                                        <div class="product-grid">
                                            <ul>
                                                <c:forEach items="${listPdByCid}" var="pd">
                                                    <div class="product-item">
                                                        <div class="product discount product_filter">
                                                            <a href="detail?id=${pd.getProductID()}">
                                                                <div class="product_image">
                                                                    <img src="resources/img/products/${pd.getUrl()}" height="230px"/>
                                                                </div>
                                                                <div class="favorite favorite_left"></div>
                                                                <c:if test="${pd.getSalePercent()>0}">
                                                                    <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${pd.getSalePercent()}%</span></div>
                                                                </c:if>
                                                                <div class="product_info">
                                                                    <h6 class="product_name">${pd.getProductName()}</h6>
                                                                    <div class="product_price">₫ ${pd.getSellPrice()}
                                                                        <c:if test="${pd.getSalePercent()>0}">
                                                                            <span>₫ ${pd.getOriginalPrice()}</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="red_button add_to_cart_button"><a href="cart?id=${pd.getProductID()}&numO=1">add to cart</a></div>
                                                    </div>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
            <%@include file = "layout/Footer.jsp" %>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
