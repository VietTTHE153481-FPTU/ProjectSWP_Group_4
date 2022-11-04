<%-- 
    Document   : yourcart
    Created on : Oct 20, 2022, 5:29:00 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wishlist</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="pt-5 pb-5">
                    <div class="container">
                        <div class="row w-100">
                            <div class="col-lg-12 col-md-12 col-12">
                                <h3 class="display-5 mb-2 text-center">Your contributions will help Levents<span style="color: #ff0000">Shop</span></h3>
                                <center>
                                    <h3>grow more and more.</h3>
                                </center>
                            </div>
                        </div>
                        <br>
                        <div class="img-fluid">
                            <center>
                                <img src="resources/img/thank-you.png">
                            </center>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script src="js/cart/jquery-3.3.1.slim.min.js"></script>
        <script src="js/cart/popper.min.js"></script>
        <script src="js/cart/bootstrap.min.js"></script>
    </body>
</html>