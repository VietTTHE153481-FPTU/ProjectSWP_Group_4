<%-- 
    Document   : login
    Created on : Jun 15, 2022, 6:54:09 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="styles/login_style.css" type="text/css"/>
        <link rel="stylesheet" href="styles/bootstrap4/bootstrap.min.css" type="text/css">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/login.js"></script>
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <title>Login to come to Levents Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="formWrapper" style="background-image: url(resources/img/background.jpg)">
            <div id="form">
                <div class="logo_container">
                    <i class="fa fa-shopping-bag" style="color: #ff3333" aria-hidden="true"></i>
                    <a href="home">Levents<span>shop</span></a>
                </div>
                <div class="logo">
                    <h1 class="text-center head">
                        <i class="fa fa-lock" style="color: #ff3333" aria-hidden="true"></i> Login
                    </h1>
                </div>
                <h6 style="color: red; margin-bottom: 40px">${requestScope.error}</h6>
                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <form action="login" method="post">
                    <div class="form-item">
                        <p class="formLabel">Username</p>
                        <input type="text" name="user" id="user" class="form-style" 
                               value="${cookie.cuser.value}"/>
                    </div>
                    <div class="form-item">
                        <p class="formLabel">Password</p>
                        <input type="password" name="pass" id="password" class="form-style"
                               value="${cookie.cpass.value}"/><br/>
                        <input type="checkbox" ${(cookie.crem.value!=null?'checked':'')}
                               name="rem" class="rem"/>
                        Remember Me
                    </div>
                    <input type="submit" class="login button_login" value="LOGIN"><br/>
                </form>
                <a href="reset"><small>Forgot Password</small></a>
                <div class="form-item">
                    <p class="pull-left"><small>New to Levents Shop?</small>
                        <a href="register"><small>Register</small></a>
                    </p>
                    <div class="clear-fix"></div>
                </div>
            </div>
        </div>
    </body>
</html>
