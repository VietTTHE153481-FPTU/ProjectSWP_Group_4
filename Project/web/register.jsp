<%-- 
    Document   : register
    Created on : Jun 15, 2022, 11:22:11 PM
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
        <link rel="stylesheet" href="styles/bootstrap4/bootstrap.min_1.css" id="bootstrap-css">
        <link rel="stylesheet" href="styles/register_style.css" type="text/css"/>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/all.css">
        <script src="js/bootstrap.min_2.js"></script>
        <script src="js/jquery.min_1.js"></script>
        <title>Create an account</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <div class="card">
            <div class="card-body mx-auto">
                <h2 class="card-title mt-3 text-center">Create Account</h2>
                <p class="text-center" style="font-size: 22px">Get started with your free account</p>
                <h6 style="color: red">${sessionScope.mess}</h6>
                <form action="register" method="post">
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" name="user" class="form-control" placeholder="Username">
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                        </div>
                        <input type="password" name="pass" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                        </div>
                        <input type="password" name="cfpass" class="form-control" placeholder="Repeat password">
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" name="fname" class="form-control" placeholder="Fullname">
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-phone"></i></span>
                        </div>
                        <input type="text" name="phone" class="form-control" placeholder="Phone">
                    </div>
                    <center>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="sex" checked value="0" />
                            <label class="form-check-label">Male</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 me-4">
                            <input class="form-check-input" type="radio" name="sex" value="1" />
                            <label class="form-check-label">Female</label>
                        </div>
                    </center>
                    <br/>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i></span>
                        </div>
                        <input type="text" name="mail" class="form-control" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <button type="submit" name="sign up" class="btn btn-primary btn-block">Create Account</button>
                    </div> 
                    <p class="text-center">Have an account? <a href="login">Log In</a></p>                                                                 
                </form>
            </div>
        </div>
    </body>
</html>
