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
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/detail_responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <style>
            .favorite{
                padding-top: 50px;
                margin-bottom: -70px;
                font-size: 15px;
                text-align: center;
            }
        </style>
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
                                <li><a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
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
                        <div class="favorite">
                            <i class="fa fa-heart-o" style="color: #ff0000">&nbsp;</i><span>Favorite (${num})</span>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="product_details">
                            <div class="product_details_title">
                                <h3>${detail.getProductName()}</h3>
                            </div>
                            <div class="original_price">
                                <c:if test="${detail.getSalePercent()>0}">
                                    <span>${detail.FormatPrice(detail.getOriginalPrice())}₫ </span>
                                </c:if>
                            </div>
                            <div class="product_price">${detail.FormatPrice(detail.getSellPrice())}₫</div>&nbsp;&nbsp;&nbsp;
                            <c:if test="${detail.getSalePercent()>0}">
                                <span style="text-decoration: none; color: red;">-${detail.FormatPrice(detail.getSalePercent())}%</span>
                            </c:if>
                            <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                                <span>Delivery method:</span>
                                <div style="padding-left: 25px">
                                    <i class="fa fa-truck"></i>&nbsp;
                                    <span style="padding-right: 50px">Express Delivery</span>
                                </div>
                            </div>
                            <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                                <span>Quantity:</span>
                                <div class="quantity_selector">
                                    <span class="minus"><i class="fa fa-minus" aria-hidden="true"><a href="sub?id=${detail.getProductID()}"></a></i></span>
                                    <span id="quantity_value">1</span>
                                    <input hidden id="numO" name="numO" type="number" value="1" />
                                    <input hidden id="ProID" name="id" type="text" value="1" />
                                    <span class="plus"><i class="fa fa-plus" aria-hidden="true"><a href="cart?id=${detail.getProductID()}"></a></i></span>
                                </div>
                                <a onclick="func();"><button id="button1" class="red_button add_to_cart_button" >ADD TO CART</button></a>
                            </div>
                            <br>
                            <form method="get" action="addToWishlist">
                                <c:if test="${account.roleId != 2}">
                                    <div class="mt-5">
                                        <input hidden type="number" value="${account.getUserID()}"/>
                                        <input hidden name="id" type="text" value="${detail.getProductID()}"/>
                                        <button class="btn btn-addwish-b2 profile-button" type="submit">
                                            <i class="fa fa-heart" style="color: #ff0000"></i>&nbsp;ADD TO YOUR WISHLIST
                                        </button>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tabs_section_container" style="padding-top: 10px">
                <div class="container">
                    <div class="row card-body">
                        <div class="col-sm-4" style="border-right: 1px dotted #cccccc">
                            <h4 class="card-title">${detail.getShopName()} Shop</h4>
                            <a href="ChatServlet?id=${detail.getShopID()}" class="card-link">Chat with Seller</a>
                            <a href="viewshop?id=${detail.getShopID()}&page=1&key=&cid=${0}&sortType=${0}&sortMode=${0}" class="card-link">View Shop</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="tabs_container">
                                <ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
                                    <li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
                                    <li class="tab" data-active-tab="tab_2"><span>Reviews</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div id="tab_1" class="tab_container active">
                                <div class="row">
                                    <div class="col-lg-5 desc_col">
                                        <div class="tab_title">
                                            <h4>Description</h4>
                                            <p>${detail.getDescription()}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab_2" class="tab_container">
                                <div class="row">
                                    <div class="col-lg-6 reviews_col">
                                        <div class="tab_title reviews_title">
                                            <h4>Reviews</h4>
                                        </div>
                                        <div class="user_review_container d-flex flex-column flex-sm-row">
                                            <div class="user">
                                                <div class="user_pic"></div>
                                                <div class="user_rating">
                                                    <ul class="star_rating">
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review">
                                                <div class="review_date">19 Oct 2022</div>
                                                <div class="user_name">Customer name</div>
                                                <p>Customer reviews</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 add_review_col">
                                        <div class="add_review">
                                            <form id="review_form">
                                                <div>
                                                    <h1>Add Review</h1>
                                                    <input id="review_name" class="form_input input_name" type="text" name="name" placeholder="Name*" required="required" data-error="Name is required.">
                                                    <input id="review_email" class="form_input input_email" type="email" name="email" placeholder="Email*" required="required" data-error="Valid email is required.">
                                                </div>
                                                <div>
                                                    <h1>Your Rating:</h1>
                                                    <ul class="user_star_rating">
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                                    </ul>
                                                    <textarea id="review_message" class="input_review" name="message"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
                                                </div>
                                                <div class="text-left text-sm-right">
                                                    <button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">submit</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>     
        </div>
        <%@include file="layout/Footer.jsp" %>
    </div>
        <script type="text/javascript"><!--
            function func() {
                var numO = document.getElementById('quantity_value').innerHTML;
                //href="cart?id=${detail.getProductID()}&numO=(int)document.getElementById('quantity_value').innerHTML"
                window.location.href = "cart?id=${detail.getProductID()}&numO=" + numO;
            }
        </script>
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
