<%-- 
    Document   : registerseller
    Created on : Sep 18, 2022, 9:54:58 PM
    Author     : Admin
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
        <style>
            body {
                background-image: url("https://images.unsplash.com/photo-1531685250784-7569952593d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80");
            }
            .card {
                background-image: url("https://images.unsplash.com/photo-1531685250784-7569952593d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80");
            }
        </style>
        <div class="card">
            <div class="card-body mx-auto">
                <h2 class="card-title mt-3 text-center">Become a seller</h2>
                <p class="text-center" style="font-size: 22px">Get started with your information</p>
                <h6 style="color: red">${requestScope.mess}</h6>
                <form action="registerseller" method="post">                        
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" name="Username" class="form-control" placeholder="Username">
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" name="Shopname" class="form-control" placeholder="Shopname">
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-primary btn-block">Submit</button>
                    </div> 
                </form>
            </div>
        </div>
    </body>
</html>

