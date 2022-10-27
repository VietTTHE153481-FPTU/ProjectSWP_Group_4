<%-- 
    Document   : password
    Created on : Oct 20, 2022, 2:33:06 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/userprofile_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="row">
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div class="row">
                            <div class="col-md-5 border-right">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                    <img class="img-thumbnail" src="resources/img/user_no-frame.png"><span class="font-weight-bold">${account.fullname}</span><span class="text-black-50">${account.email}</span><span> </span>
                                </div>
                            </div>
                            <div class="col-md-5 border-right">
                                <c:if test="${requestScope.success != null}">
                                    <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        ${requestScope.success}
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.fail != null}">
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        ${requestScope.fail}
                                    </div>
                                </c:if>
                                <div class="p-3 py-5">
                                    <div style="border-bottom: 1px dotted #cccccc; padding-bottom: 15px;">
                                        <h4 class="text-left" style="padding-bottom: 15px;">Change your password</h4>
                                        <h6>For your account's security, do not share your password with anyone else.</h6>
                                    </div>
                                    <form action="password" method="POST">
                                        <div class="row mt-3">
                                      <!--  <div class="col-md-12"><label class="labels">Your Current Password</label><input type="text" class="form-control" placeholder="headline" value="${account.password}" disabled></div> -->
                                            <div class="col-md-12"><label class="labels">Current Password</label><input value="" type="password" name="oldpass" class="form-control" placeholder="Nhập mật khẩu cũ (Có 1 đến 20 kí tự)" >
                                            </div>
                                            <div class="col-md-12"><label class="labels">New Password</label><input value="" type="password" name="newpass" class="form-control" placeholder="Nhập mật khẩu mới (Có 1 đến 20 kí tự)" pattern="^.{1,20}$">
                                            </div>
                                            <div class="col-md-12"><label class="labels">Confirm Password</label><input value="" type="password" name="cfpass" class="form-control" placeholder="Xác nhận mật khẩu mới">
                                            </div>
                                        </div>
                                        <div class="mt-5 text-left">
                                            <button class="btn btn-primary profile-button" type="submit" value="Xác nhận">Confirm</button>
                                        </div>
                                    </form>
                                    <div class="mt-2 text-left">
                                        <a class="btn btn-primary profile-button" href="userprofile">View Profile</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/categories_custom.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>