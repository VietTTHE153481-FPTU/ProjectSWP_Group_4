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
        <title>Shop Categories</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_responsive.css">
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
                                        <li class="account">
                                            <a href="#">
                                                My Account
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="account_selection">
                                                <c:choose>
                                                    <c:when test="${sessionScope.account != null}">
                                                        <li><a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Profile</a></li>
                                                        <li><a href="#"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a></li>
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
                                        <li><a href="products">product</a></li>
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
                                    <a style="color: #000" href="#">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <c:if test="${sessionScope.account != null}">
                                            <span>&nbsp;Hello, ${sessionScope.account.fullname}</span>
                                        </c:if>
                                    </a>
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
                                <li class="active"><a href="products"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <form method="GET" action="products">
                                <div class="accordion" id="accordionPanelsStayOpenExample">
                                    <div class="sidebar_section">
                                        <div class="accordion-item">
                                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                                <!--Category-->
                                                <h3>Category</h3>
                                                <div class="accordion-body">
                                                    <ul class="list-group-flush">
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="subcategory" id="subcategory0" value="0" ${subcategory==0?'checked':''}>
                                                            <label class="form-check-label" for="subcategory0">
                                                                All Category 
                                                            </label>
                                                        </li>
                                                        <c:forEach items="${categorys}" var="icategory">
                                                            <li class="list-group-item"><strong>${icategory.getCategoryName()}</strong></li>
                                                                    <c:forEach items="${subcategorys}" var="isubcategory">
                                                                        <c:if test="${isubcategory.getCateID()==icategory.getCategoryID()}">
                                                                    <li class="list-group-item">
                                                                        <input class="form-check-input" type="radio" name="subcategory" id="subcategory${isubcategory.getSubCateID()}" value="${isubcategory.getSubCateID()}" ${subcategory==isubcategory.getSubCateID()?'checked':''}>
                                                                        <label class="form-check-label" for="subcategory${isubcategory.getSubCateID()}">
                                                                            ${isubcategory.getSubCateName()} 
                                                                        </label>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </ul>
                                                </div>

                                                <!-- Brand -->       
                                                <h3>Brand</h3>      
                                                <div class="accordion-body">
                                                    <ul class="list-group-flush">
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="brand" id="brand0" value="0" ${brand==0?'checked':''}>
                                                            <label class="form-check-label" for="brand0">
                                                                All Brand
                                                            </label>
                                                        </li>
                                                        <c:forEach items="${brands}" var="ibrand">
                                                            <li class="list-group-item">
                                                                <input class="form-check-input" type="radio" name="brand" id="brand${ibrand.getBrandID()}" value="${ibrand.getBrandID()}" ${brand==ibrand.getBrandID()?'checked':''}>
                                                                <label class="form-check-label" for="brand${ibrand.getBrandID()}">${ibrand.getBrandName()}</label>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>  
                                                </div> 

                                                <!-- Price -->
                                                <h3>Price</h3>

                                                <div class="accordion-body">
                                                    <ul class="list-group-flush">
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" id="price0" value="0" ${price==0?'checked':''}>
                                                            <label class="form-check-label" for="price0">
                                                                All price range
                                                            </label>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" value="1" id="price1" ${price==1?'checked':''}>
                                                            <label class="form-check-label" for="price1">
                                                                0đ-100,000₫
                                                            </label>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" value="2" id="price2" ${price==2?'checked':''}>
                                                            <label class="form-check-label" for="price2">
                                                                100,000₫-500,000₫
                                                            </label>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" value="3" id="price3" ${price==3?'checked':''}>
                                                            <label class="form-check-label" for="price3">
                                                                500,000₫-1,000,000₫
                                                            </label>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" value="4" id="price4" ${price==4?'checked':''}>
                                                            <label class="form-check-label" for="price4">
                                                                1,000,000₫-5,000,000₫
                                                            </label>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <input class="form-check-input" type="radio" name="price" value="5" id="price5" ${price==5?'checked':''}>
                                                            <label class="form-check-label" for="price5">
                                                                >5,000,000₫
                                                            </label>
                                                        </li>
                                                    </ul>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Submit -->
                                <input value="0" type="hidden" name="sortType">
                                <input value="0" type="hidden" name="sortMode">
                                <div class="d-grid gap-2 my-2">
                                    <input class="btn btn-primary-custom" type="submit" value="Find product"/>
                                </div>
                                <!-- Submit -->
                            </form>
                        </div>
                        <div class="main_content">
                            <div class="products_iso">
                                <div class="row">
                                    <div class="col">
                                        <div class="product_sorting_container product_sorting_container_top">
                                            <ul class="product_sorting">
                                                <li>
                                                    <span class="type_sorting_text">Default Sorting</span>
                                                    <i class="fa fa-angle-down"></i>
                                                    <ul class="sorting_type">
                                                        <li class="type_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>Default Sorting</span></li>
                                                        <li class="type_sorting_btn" data-isotope-option='{ "sortBy": "name" }'><span>Product Name</span></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product-grid">
                                            <ul>
                                                <c:forEach items="${requestScope.listpd}" var="p">
                                                    <li>
                                                        <div class="product-item">
                                                            <div class="product discount product_filter">
                                                                <div class="product_image">
                                                                    <img src="${p.image}"/>
                                                                </div>
                                                                <div class="favorite favorite_left"></div>
                                                                <div class="product_info">
                                                                    <h6 class="product_name"><a href="detail?id=${p.id}">${p.name}</a></h6>
                                                                    <div class="product_price">₫ ${p.price}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="product_sorting_container product_sorting_container_bottom clearfix">
                                            <div class="pages d-flex flex-row align-items-center">
                                                <div class="page_current">
                                                    <span>1</span>
                                                    <ul class="page_selection">
                                                        <c:forEach begin="1" end="${endPage}" var="i">
                                                            <li><a class="${index == i ? "active" : ""}" href="search?index=${i}&txtSearch=${txt}">${i}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="page_total"><span>of</span>${endPage}</div>
                                                <div id="next_page_1" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
                                            </div>
                                        </div>
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
