<%-- 
    Document   : listservice
    Created on : Oct 15, 2022, 2:30:51 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Support Service</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/service_style.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/css/search.css"/>
        <style>
            .card{
                border: none;
                background: #fff;
            }
            .search {
                width: 100%;
                margin-bottom: auto;
                margin-top: 20px;
                height: 50px;
                background-color: gainsboro;
                padding: 10px;
                border-radius: 5px;
            }
            .search-input {
                color: wheat;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                margin-top: 5px;
                caret-color: transparent;
                line-height: 20px;
                transition: width 0.4s linear
            }
            .search .search-input {
                padding: 0 10px;
                width: 100%;
                caret-color: #536bf6;
                font-size: 19px;
                font-weight: 300;
                color: black;
                transition: width 0.4s linear;
            }
            .search-icon {
                height: 34px;
                width: 34px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                background-color: #536bf6;
                font-size: 10px;
                bottom: 30px;
                position: relative;
                border-radius: 5px;
            }
            .search-icon:hover{
                color: #fff !important;
            }
            .active-menu:hover{
                color: #ff3300
            }
            .content{
                font-size: 20px;
                padding-top: 15px;
                padding-bottom: 15px;
                border-bottom: 1px dotted #999999;
            }
        </style>
    </head>
    <body>
        <div class="super_container">
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-9">
                            <div class="card p-4 mt-3">
                                <h3 class="heading mt-5 text-center">Hi! How can we help You?</h3>
                                <form method="get" action="searchservice">
                                    <div class="d-flex justify-content-center px-5">
                                        <div class="search">
                                            <input type="text" class="search-input" placeholder="Search..." name="key">
                                            <button class="search-icon"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex px-5 p-t-50">
                        <div class="col-md-6">
                            <ul class="sidebar_categories">
                                <c:forEach items="${category}" var="cate">
                                    <li>
                                        <div class="text-left">
                                            <h5 style="padding-top: 10px; padding-bottom: 10px;">
                                                <button class="active-menu" type="button" data-toggle="collapse" data-target="#${cate.getCategoryID()}" aria-expanded="false" aria-controls="multiCollapseExample1">
                                                    <strong>${cate.getCategoryName()}</strong>
                                                </button>
                                            </h5>
                                        </div>
                                    </li>
                                    <div class="${tag1 == cate.getCategoryID() ? "show":""} collapse" id="${cate.getCategoryID()}">
                                        <c:forEach items="${listservice}" var="list">
                                            <c:if test="${list.getCategoryID() == cate.getCategoryID()}">
                                                <ul>
                                                    <li class="${tag2 == list.getTitleID() ? "active":""}">
                                                        <a href="servicecategories?seid=${cate.getCategoryID()}&stid=${list.getTitleID()}&key=">
                                                            <span class="active">&nbsp;&nbsp;&nbsp;${list.getTitle()}</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h3 style="padding-bottom: 10px; border-bottom: 1px dotted #999999">${title.getTitle()}</h3>
                            <c:forEach items="${listContentByStId}" var="lcontent">
                                <div class="content">
                                    <ul class="list-group">
                                        <li class="list-group-item-light">
                                            <a style="color: #000000" href="#">
                                                ${lcontent.getContent()}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:forEach>
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
