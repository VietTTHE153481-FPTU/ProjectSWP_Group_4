<%-- 
    Document   : searchservice
    Created on : Oct 25, 2022, 7:11:49 PM
    Author     : Admin
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
            a:link {
                text-decoration: none
            }
            .card-inner {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-clip: border-box;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: .25rem;
                border:none;
                cursor: pointer;
                transition: all 2s;
            }
            .card-inner:hover{
                transform: scale(1.1);
            }
            .mg-text span{
                font-size: 15px;
            }
            .mg-text{
                line-height: 24px;
            }
            .content{
                font-size: 15px;
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
                <div class="container mt-4">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-9">
                            <div class="card p-4 mt-3">
                                <h3 class="heading mt-5 text-center">Hi! How can we help You?</h3>
                                <form method="get" action="searchservice">
                                    <div class="d-flex justify-content-center px-5">
                                        <div class="search">
<!--                                            <input type="hidden" name="seid" value="${seid}"/>
                                            <input type="hidden" name="stid" value="${stid}"/>-->
                                            <input value="${key}" type="search" class="search-input" placeholder="Search..." name="key"/>
                                            <button type="submit" class="search-icon"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                                <div class="row mt-4">
                                    <h4><span>There are ${num} search result for </span><span style="color: #ff0000">"${key}"</span></h4>
                                </div>
                                <div class="row mt-4">
                                    <ul class="list-group">
                                        <c:forEach items="${listcontent}" var="c">
                                            <div class="content">
                                                <li class="list-group-item-light">
                                                    <a href="servicecategories?seid=&stid=${c.getTitlteID()}" style="color: black">${c.getContent()}</a>
                                                </li>
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
