<%-- 
    Document   : userprofile
    Created on : Oct 6, 2022, 10:28:30 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
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
            <%@include file ="layout/Header.jsp" %>
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
                                <c:if test="${requestScope.mess!=null}">
                                    <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        ${requestScope.mess}
                                    </div>
                                </c:if>
                                <form method="post" action="userprofile">
                                    <div class="p-3 py-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Your Profile</h4>
                                        </div>
                                        <h6 style="color: red; text-align: center">${mes}</h6>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Full Name</label>
                                                <input value="${account.fullname}" type="text" name="fullname" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12"><label class="labels">PhoneNumber</label><input value="${account.phone}" type="text" name="phone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12"><label class="labels">Email</label><input value="${account.email}" type="text" name="email" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Gender</label>
                                                <c:if test="${account.gender == false}">
                                                    <input type="radio" name="gender" checked value="0"> Male
                                                    <input type="radio" name="gender"  value="1"> Female
                                                </c:if>
                                                <c:if test="${account.gender == true}">
                                                    <input type="radio" name="gender" value="0"> Male
                                                    <input type="radio" name="gender" checked  value="1"> Female
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button style="width: 300px" class="btn btn-primary profile-button" type="submit" value="Xác nhận">Save Profile</button>
                                        </div>
                                        <div class="mt-2 text-center">
                                            <a style="width: 300px" class="btn btn-primary profile-button" href="password">Change Password</a>
                                        </div>
                                        <c:choose>
                                            <c:when test="${account.roleId != 2}">
                                                <div class="mt-2 text-center">
                                                    <a style="width: 300px" class="btn btn-primary profile-button" href="address">Addresses</a>                                         
                                                </div>
                                                <div class="mt-2 text-center">
                                                    <a style="width: 300px" class="btn btn-primary profile-button" href="vieworders">View your orders</a>                                              
                                                </div>
                                                <div class="mt-2 text-center">
                                                    <a style="width: 300px" class="btn btn-primary profile-button" href="Wishlist">My Wishlist</a>                                              
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${account.roleId == 2}">
                                                <div class="mt-2 text-center">
                                                    <a style="width: 300px" class="btn btn-primary profile-button" href="viewshop?id=${account.shopId}&page=1&key=&cid=${0}&sortType=${0}&sortMode=${0}">View shop</a>                                              
                                                </div> 
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${account.roleId == 3}">
                                                <div class="mt-2 text-center">
                                                    <a style="width: 300px" class="btn btn-primary profile-button" href="registerseller">Become a seller</a>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file ="layout/Footer.jsp" %>
            <script>
                $(document).ready(function () {
                    $('button').click(function () {
                        $('.alert').show();
                    });
                });
            </script>
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
