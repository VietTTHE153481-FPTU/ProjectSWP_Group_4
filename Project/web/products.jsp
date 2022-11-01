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
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="row">
                    <div class="col product_section clearfix">
                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li class="active"><a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}"><i class="fa fa-angle-right" aria-hidden="true"></i>Products</a></li>
                            </ul>
                        </div>
                        <form action="products" method="get">
                            <input value="1" type="hidden" name="page">
                            <div class="sidebar">
                                <div class="sidebar_section">
                                    <div class="form-floating mb-2">
                                        <div class="input-append span12">
                                            <input type="text" class="form-control" placeholder="Search here..." name="key" value="${query.replace('+', ' ')}">
                                        </div>
                                    </div>
                                    <!--Category-->
                                    <div class="sidebar_title">
                                        <h5>Product Category</h5>
                                    </div>
                                    <ul class="sidebar_categories">
                                        <c:forEach items="${categorys}" var="icategory">
                                            <li class="${tag == icategory.getCategoryID() ? "active":""}">
                                                <a href="products?page=1&key=&cid=${icategory.getCategoryID()}&sid=${0}&sortType=${0}&sortMode=${0}">
                                                    <span><i class="fa fa-angle-double-right" aria-hidden="true"></i></span>
                                                        ${icategory.getCategoryName()}
                                                </a>
                                            </li>
                                            <c:forEach items="${subcategorys}" var="isubcategory">
                                                <c:if test="${isubcategory.getCateID() == icategory.getCategoryID()}">
                                                    <li>
                                                        <a class="form-check-label" href="products?page=1&key=&cid=${icategory.getCategoryID()}&sid=${isubcategory.getSubCateID()}&sortType=${0}&sortMode=${0}">
                                                            ${isubcategory.getSubCateName()} 
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <input type="hidden" name="cid" value="0"/>
                            <input type="hidden" name="sid" value="0"/>            
                            <input value="0" type="hidden" name="sortType">
                            <input value="0" type="hidden" name="sortMode">
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
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==1&&sortMode==1?'0':'1'}&sortMode=${sortType==1&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==1&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==1&&sortMode==2?'0':'1'}&sortMode=${sortType==1&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==1&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-outline-dark dropdown-toggle ${sortType==2?'active':''}" data-toggle="dropdown">
                                                        Sort by sale
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==2&&sortMode==1?'0':'2'}&sortMode=${sortType==2&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==2&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==2&&sortMode==2?'0':'2'}&sortMode=${sortType==2&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==2&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-outline-dark dropdown-toggle ${sortType==3?'active':''}" data-toggle="dropdown">
                                                        Sort by name
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==3&&sortMode==2?'0':'3'}&sortMode=${sortType==3&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==3&&sortMode==2?'<i class="fa fa-check"></i>':''}</a></li>
                                                        <li><a class="dropdown-item" href="products?page=1&key=${key}&cid=${cid}&sid=${sid}&sortType=${sortType==3&&sortMode==1?'0':'3'}&sortMode=${sortType==3&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==3&&sortMode==1?'<i class="fa fa-check"></i>':''}</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-grid">
                                                <ul>
                                                    <c:forEach items="${listPdByCid}" var="pd">
                                                        <div class="product-item">
                                                            <div class="product discount product_filter">
                                                                <div class="product_image">
                                                                    <a href="detail?id=${pd.getProductID()}">
                                                                        <img src="resources/img/products/${pd.getUrl()}" height="230px"/>
                                                                    </a>
                                                                </div>
                                                                <div class="favorite favorite_left"></div>
                                                                <a href="detail?id=${pd.getProductID()}">
                                                                    <c:if test="${pd.getSalePercent()>0}">
                                                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${pd.FormatPrice(pd.getSalePercent())}%</span></div>
                                                                    </c:if>
                                                                    <div class="product_info">
                                                                        <h6 class="product_name">${pd.getProductName()}</h6>
                                                                        <div class="product_price">₫ ${pd.FormatPrice(pd.getSellPrice())}
                                                                            <c:if test="${pd.getSalePercent()>0}">
                                                                                <span>₫ ${pd.FormatPrice(pd.getOriginalPrice())}</span>
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
                                            <nav class="my-3" aria-label="Page navigation">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item ${page>1?'':'disabled'}"><a class="page-link" href="products?page=${page-1}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">Previous</a></li>
                                                        <c:if test="${page-2>0}">
                                                        <li class="page-item"><a class="page-link" href="products?page=${page-2}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page-2}</a></li>
                                                        </c:if>
                                                        <c:if test="${page-1>0}">
                                                        <li class="page-item"><a class="page-link" href="products?page=${page-1}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page-1}</a></li>
                                                        </c:if>
                                                    <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                                        <c:if test="${page+1<=maxPage}">
                                                        <li class="page-item"><a class="page-link" href="products?page=${page+1}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page+1}</a></li>
                                                        </c:if>
                                                        <c:if test="${page+2<=maxPage}">
                                                        <li class="page-item"><a class="page-link" href="products?page=${page+2}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">${page+2}</a></li>
                                                        </c:if>
                                                    <li class="page-item ${page+1<=maxPage?'':'disabled'}"><a class="page-link" href="products?page=${page+1}&key=&cid=${cid}&sid=${sid}&sortType=${sortType}&sortMode=${sortMode}">Next</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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
        <script src="js/categories_custom.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
