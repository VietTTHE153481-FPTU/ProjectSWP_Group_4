<%-- 
    Document   : bloglist
    Created on : Oct 2, 2022, 3:01:19 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogs</title>
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
            <%@include file = "Header.jsp" %>
            <div class="container product_section_container">
                <div class="container">
                    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('resources/img/Blog/bg-02.jpg');">
                        <h2 class="ltext-105 cl0 txt-center">
                            Blog
                        </h2>
                    </section>
                    <section class="bg0 p-t-62">
                        <div class="row">
                            <div class="col-md-8 col-lg-9">
                                <div class="p-r-45 p-r-0-lg">
                                    <!-- item blog -->
                                    <c:forEach items="${bloglist}" var="bl">
                                        <div class="p-b-63">
                                            <a href="#" class="hov-img0 how-pos5-parent">
                                                <img src="resources/img/Blog/${bl.getImageLink()}">
                                                <div class="flex-col-c-m size-123 bg9 how-pos5">
                                                    <span class="ltext-107 cl2 txt-center">${bl.getDay()}</span>
                                                    <span class="stext-109 cl3 txt-center">
                                                        ${bl.getMonth()} ${bl.getYear()}
                                                    </span>
                                                </div>
                                            </a>
                                            <div class="p-t-32">
                                                <h4 class="p-b-15">
                                                    <a href="#" class="ltext-108 cl2 hov-cl1 trans-04">
                                                        ${bl.getTitle()}
                                                    </a>
                                                </h4>
                                                <p class="stext-117 cl6">${bl.getContent()}</p>
                                                <div class="flex-w flex-sb-m p-t-18">
                                                    <span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
                                                        <h5>
                                                            <span class="cl4">By |</span> ${bl.getAuthor()}
                                                        </h5>
                                                    </span>
                                                    <a href="#" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
                                                        Continue Reading
                                                        <i class="fa fa-long-arrow-right m-l-9"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <%@include file = "Footer.jsp" %>
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