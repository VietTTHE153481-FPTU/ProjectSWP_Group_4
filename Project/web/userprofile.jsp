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
            <%@include file ="Header.jsp" %>
            <div class="container product_section_container">
                <div class="row">
                    <div class="col product_section clearfix">
                        <div class="container rounded bg-white mt-5 mb-5">
                            <div class="row">
                                <div class="col-md-5 border-right">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="img-thumbnail" src="resources/img/user_no-frame.png"><span class="font-weight-bold">${account.fullname}</span><span class="text-black-50">${account.email}</span><span> </span>
                                    </div>
                                </div>
                                <div class="col-md-5 border-right">
                                    <div class="p-3 py-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Your Profile</h4>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-md-12"><label class="labels">User Name :</label>${account.username}
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12"><label class="labels">Full Name</label><input value="${account.fullname}" type="text" name="fullname" class="form-control" readonly required>
                                            </div>
                                            <div class="col-md-12"><label class="labels">PhoneNumber</label><input value="${account.phone}" type="text" name="phone" class="form-control" readonly required>
                                            </div>
                                            <div class="col-md-12"><label class="labels">Email</label><input value="${account.email}" type="text" name="email" class="form-control" readonly required>
                                            </div>
                                            <div class="col-md-12"><label class="labels">Password</label><input value="${account.password}" type="password" name="password" class="form-control" readonly required>
                                            </div>
                                            <div class="col-md-12" style="display: none;" id="change_pass">
                                                <form action="account" method="post" onsubmit="return check()">
                                                    <input type="password" id="pass_old1" value="${account.password}" hidden>
                                                    <label class="labels">Old Password</label>
                                                    <input type="password" id="pass_old2" class="form-control" placeholder="Nhập mật khẩu cũ (Có 1 đến 20 kí tự)" pattern="^.{1,20}$">            
                                                    <label class="labels">New Password</label>
                                                    <input type="password" id="pass_new1" class="form-control" placeholder="Nhập mật khẩu mới (Có 1 đến 20 kí tự)" pattern="^.{1,20}$">
                                                    <label class="labels">Re-enter New Password</label>
                                                    <input type="password" id="pass_new2" name="pass_new" class="form-control" placeholder="Xác nhận mật khẩu mới"> 
                                                    <span id="message" style="color: red;"></span>
                                                </form>
                                            </div> 
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-md-6"><label class="labels">Gender</label>
                                                <input type="radio" name="gender" checked value="${account.gender}"> Male
                                                <input type="radio" name="gender" value="${account.gender}"> Female
                                            </div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button class="btn btn-primary profile-button" onclick="change()">Change Information</button>
                                            <button class="btn btn-primary profile-button" type="submit" value="Xác nhận">Save Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file ="Footer.jsp" %>
        </div>
        <script>
            function change() {
                var x = document.getElementById("change_pass");
                x.style.display = "block";
            }
            function check() {
                var o1 = document.getElementById("pass_old1");
                var o2 = document.getElementById("pass_old2");
                var n1 = document.getElementById("pass_new1");
                var n2 = document.getElementById("pass_new2");
                if (o1.value != o2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập đúng mật khẩu cũ";
                    return false;
                } else if (n1.value != n2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập lại đúng mật khẩu mới";
                    return false;
                }
                return true;
            }
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
