<%-- 
    Document   : home
    Created on : Jun 12, 2022, 7:32:35 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Levents Shop</title>
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
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/css/search.css"/>
    </head>
    <body>
        <div class="super_container">
            <%@include file = "layout/Header.jsp" %>
            <div class="main_slider" style="background-image:url(resources/img/banner/slide-01.jpg)">
                <div class="container fill_height">
                    <div class="row align-items-center fill_height">
                        <div class="col">
                            <div class="s005">
                                <form action="products" method="get">
                                    <fieldset>
                                        <legend>WHAT ARE YOU LOOKING FOR?</legend>
                                        <div class="inner-form">
                                            <div class="input-field">
                                                <input type="hidden" name="page" value="1"/>
                                                <input class="form-control" id="choices-text-preset-values" name="key" type="search" placeholder="Type to search..." />
                                                <input type="hidden" name="cid" value="0"/>
                                                <input type="hidden" name="sid" value="0"/>
                                                <input type="hidden" name="sortType" value="0"/>
                                                <input type="hidden" name="sortMode" value="0"/>
                                                <button class="btn-search" type="submit">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" viewBox="0 0 24 24">
                                                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="best_sellers">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title new_arrivals_title">
                                <h2>CATEGORIES</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="product_slider_container">
                                <div class="owl-carousel owl-theme product_slider">
                                    <c:forEach items="${categories}" var="cate">
                                        <div class="owl-item product_slider_item">
                                            <div class="product-item">
                                                <div class="product discount">
                                                    <div class="product_image">
                                                        <a href="products?page=1&key=&cid=${cate.getCategoryID()}&sid=${0}&sortType=${0}&sortMode=${0}">
                                                            <img src="resources/img/Categories/${cate.getCategoryImgURL()}" height="200px"/>
                                                        </a>
                                                    </div>
                                                    <div class="product_info">
                                                        <h6 class="product_name"><a href="products?page=1&cid=${cate.getCategoryID()}&sid=${0}&sortType=${0}&sortMode=${0}">${cate.getCategoryName()}</a></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="best_sellers">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title new_arrivals_title">
                                <h2>NEW PRODUCTS</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="product_slider_container">
                                <div class="owl-carousel owl-theme product_slider">
                                    <c:forEach items="${listpd}" var="pd">
                                        <div class="owl-item product_slider_item">
                                            <div class="product-item">
                                                <div class="product discount">
                                                    <div class="product_image">
                                                        <img src="resources/img/products/${pd.getUrl()}" height="230px"/>
                                                    </div>
                                                    <div class="favorite favorite_left"></div>
                                                    <div class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center"><span>new</span></div>
                                                    <div class="product_info">
                                                        <h6 class="product_name"><a href="detail?id=${pd.getProductID()}">${pd.getProductName()}</a></h6>
                                                        <div class="product_price">₫ ${pd.FormatPrice(pd.getSellPrice())}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
                                    <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                </div>
                                <div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
                                    <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="deal_ofthe_week">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="deal_ofthe_week_img">
                                <img src="resources/poster5.jpg">
                            </div>
                        </div>
                        <div class="col-lg-6 text-right deal_ofthe_week_col">
                            <div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
                                <div class="section_title">
                                    <h2>Deal Of The Week</h2>
                                </div>
                                <ul class="timer">
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="day" class="timer_num">03</div>
                                        <div class="timer_unit">Day</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="hour" class="timer_num">24</div>
                                        <div class="timer_unit">Hours</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="minute" class="timer_num">00</div>
                                        <div class="timer_unit">Mins</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="second" class="timer_num">00</div>
                                        <div class="timer_unit">Sec</div>
                                    </li>
                                </ul>
                                <div class="red_button deal_ofthe_week_button"><a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${2}&sortMode=${2}">shop now</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="benefit">
                <div class="container">
                    <div class="row benefit_row">
                        <div class="col-lg-3 benefit_col">
                            <div class="benefit_item d-flex flex-row align-items-center">
                                <div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
                                <div class="benefit_content">
                                    <h6>shipping</h6>
                                    <p>Apply Voucher code for Free Shipping</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 benefit_col">
                            <div class="benefit_item d-flex flex-row align-items-center">
                                <div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                                <div class="benefit_content">
                                    <h6>payments</h6>
                                    <p>Payment methods</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 benefit_col">
                            <div class="benefit_item d-flex flex-row align-items-center">
                                <div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
                                <div class="benefit_content">
                                    <h6>45 days return</h6>
                                    <p>Making it Look Like Readable</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 benefit_col">
                            <div class="benefit_item d-flex flex-row align-items-center">
                                <div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
                                <div class="benefit_content">
                                    <h6>opening</h6>
                                    <p>9.30 AM - 21.30 PM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blogs">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title">
                                <h2>LATEST BLOGS</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row blogs_container">
                        <c:forEach items="${listbg}" var="bg">
                            <div class="col-lg-4 blog_item_col">
                                <div class="blog_item">
                                    <div class="blog_background" style="background-image:url(./resources/img/Blog/${bg.getImageLink()})"></div>
                                    <div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
                                        <h4 class="blog_title">${bg.getTitle()}</h4>
                                        <c:forEach items="${author}" var="au">
                                            <c:if test="${au.getUserID() == bg.getAuthorId()}">
                                                <span class="blog_meta">by ${au.fullname} |&nbsp; ${bg.getDay()} ${bg.getMonth()} ${bg.getYear()}</span>
                                            </c:if>
                                        </c:forEach>
                                        <a class="blog_more" href="blogdetail?id=${bg.id}&key=">Read more</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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