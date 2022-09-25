<%-- 
    Document   : forgetpassword
    Created on : Sep 25, 2022, 7:23:42 AM
    Author     : admin
--%>

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
    </head>
    <body>
        <div class="card">
            <div class="card-body mx-auto">
                <h2 class="card-title mt-3 text-center">Reset your password</h2>
                <p class="text-center" style="font-size: 22px">Please enter your login email, we will send a new random password to your inbox:</p>
                <h6 style="color: red">${sessionScope.mess}</h6>
                <form id="resetForm" action="reset" method="post">               
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i></span>
                        </div>
                        <input type="text" name="mail" class="form-control" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <button type="submit" name="reset" class="btn btn-primary btn-block">Send Email</button>
                    </div> 
                    <p class="text-left"><a href="login">Go back log in page</a></p>                                                             
                </form>
            </div>
        </div>
    </body>
</html>
