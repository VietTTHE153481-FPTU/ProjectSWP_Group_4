<%-- 
    Document   : forgetpassword
    Created on : Sep 25, 2022, 7:23:42 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Forget Password</title>
        <meta charset="UTF-8">
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                background-image: url(resources/img/background.jpg);
            }
            .card{
                background-image: url(resources/img/background.jpg);
                width: 100%;
                height: 100vh;
                align-items: center;
                padding-top: 10%;
                padding-bottom: 10%;
                margin: 0;
            }
            .card-body{
                border-radius: 15px;
                border: solid rgba(255,253,253,0.9);
                background-color: rgba(255,253,253,0.9);
                display: flex;
                width: 40%;
                margin: 0 auto;
                align-items: center;
                flex-direction: column;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <div class="body">
            <div class="card">
                <div class="card-body mx-auto">
                    <h2 class="card-title mt-3 text-center">Reset your password</h2>
                    <p class="text-center" style="font-size: 22px">Please enter your login email, we will send a new random password to your inbox:</p>
                    <h6 style="color: red">${requestScope.mess}</h6>
                    <form id="resetForm" action="reset" method="post">               
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-envelope"></i></span>
                            </div>
                            <input required type="email" name="mail" class="form-control" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <button type="submit" name="reset" class="btn btn-primary btn-block">Send Email</button>
                        </div>
                        <c:set var="message" value="${requestScope.message}"/>
                        <c:if test="{message != null}">
                            <script>
                                confirm(message);
                            </script>
                        </c:if>
                        <p class="text-left"><a href="login">Go back log in page</a></p>                                                             
                    </form>
                </div>
            </div>    
        </div>

    </body>
</html>
