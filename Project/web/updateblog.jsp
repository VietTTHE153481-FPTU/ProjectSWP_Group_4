<%-- 
    Document   : updateblog
    Created on : Oct 28, 2022, 3:25:19 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Blog</title>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="styles/css/dashboard.css"/>
    </head>
    <body>
        <div class="wrapper">
            <div id="content">
                <%@include file="layout/sidebar.jsp"%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <span><i class="fa fa-cloud-upload"></i>&nbsp;&nbsp;</span>Update Blog
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <div class="container" style="padding-top: 10px">
                                            <div class="container rounded bg-white mt-5">
                                                <div class="row">
                                                    <div class="col-md-4 border-right">
                                                        <div class="d-flex flex-column align-items-center">
                                                            <img class="align-self-center mr-3 mt-5" src="resources/img/Blog/${blog.imageLink}" width="350">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <!--<h4 class="text-center">${success}</h4>-->
                                                        <div class="p-3 py-5">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                                                                    <a href="ManageBlog?UserId=${account.userID}">&nbsp;Back To List</a>
                                                                </div>
                                                                <h6 class="text-right">Edit Profile</h6>
                                                            </div>
                                                            <form method="get" action="update">
                                                                <input type="hidden" name="BlogId" value="${blog.id}"/>
                                                                <div class="row mt-2">
                                                                    <div class="col-md-12"><input type="text" class="form-control" name="title" value="${blog.title}"></div>
                                                                </div>
                                                                <div class="row mt-3">
                                                                    <div class="col-md-12">
                                                                        <textarea type="text" class="form-control" name="content" rows="12">${blog.content}</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay"></div>
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/seller/scrollbar.concat.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#dismiss, .overlay').on('click', function () {
                    $('#sidebar').removeClass('active');
                    $('.overlay').fadeOut();
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').addClass('active');
                    $('.overlay').fadeIn();
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>
        <script src="js/seller/jquery.dataTables.min.js"></script>
        <script src="js/seller/dataTables.bootstrap5.min.js"></script>
        <script src="js/seller/script1.js"></script>
    </body>
</html>
