<%-- 
    Document   : loginAdmin
    Created on : Jun 28, 2022, 2:41:46 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="styles/adlogin_style.css" type="text/css"/>
        <link rel="stylesheet" href="styles/bootstrap4/bootstrap.min.css" type="text/css">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #999999">
        <section class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-3 rounded border shadow p-3 mb-5 bg-white " id="col-Login" >
                    <p class="text-center"><strong>Administrator</strong></p>
                    <h6 style="color: red; margin-bottom: 40px">${requestScope.error}</h6>
                    <form class="login-form" action="admin" method="post">
                        <div class="form-group" id="errorLogin" >
                        </div>
                        <div class="form-group">
                            <label >Username</label>
                            <input type="text" id="user" name="user" class="form-control" placeholder="Username" required>    
                        </div>
                        <div class="form-group">
                            <label >Password</label>
                            <input type="password" id="password" name="pass" class="form-control"  placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="login" class="btn btn-primary float-left">Login</button>                              
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>
