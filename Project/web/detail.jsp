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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${detail.getProductName()}</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/css/search.css"/>
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container single_product_container">
                <div class="row">                   
                    <div class="col">
                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="products?page=1&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
                                <li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>${detail.getProductName()}</a></li></li>
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
                                        <div class="single_product_image_background" style="background-image:url(resources/img/products/${detail.getUrl()})"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="product_details">
                            <div class="product_details_title">
                                <h1>${detail.getProductName()}</h1>
                                <dt>Description</dt>
                                <p>${detail.getDescription()}</p>
                            </div>
                            <div class="product_price">${detail.getSellPrice()}₫
                                <c:if test="${detail.getSalePercent()>0}">
                                    <span>${detail.getOriginalPrice()}₫ </span>
                                    <span style="text-decoration: none; color: red;">-${detail.getSalePercent()}%</span>
                                </c:if>
                            </div>
                            <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                                <span>Quantity:</span>
                                <div class="quantity_selector">
                                    <span class="minus"><i class="fa fa-minus" aria-hidden="true"><a href="sub?id=${detail.getProductID()}"></a></i></span>
                                    <span id="quantity_value">${detail.getAmount()}</span>
                                    <span class="plus"><i class="fa fa-plus" aria-hidden="true"><a href="cart?id=${detail.getProductID()}"></a></i></span>
                                </div>
                            </div>
                            <br/>
                            <div class="red_button add_to_cart_button"><a href="cart?id=${detail.getProductID()}">add to cart</a></div>
                        </div>
                    </div>       
                </div>
                <div>
                    
                </div>      
            </div>
            <%@include file="layout/Footer.jsp" %>
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
