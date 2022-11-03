<%-- 
    Document   : manageblog
    Created on : Oct 27, 2022, 9:54:04 AM
    Author     : trung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${blog.title}</title>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="styles/css/dashboard.css"/>
        <style>
            .an {
                display: block;
                display: -webkit-box;
                height: 16px * 1.3 *3;
                font-size: 16px;
                line-height: 1.3;
                -webkit-line-clamp: 3;  /* số dòng hiển thị */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                margin-top:10px;
            }
        </style>
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
                                    <span><i class="fa fa-list-alt"></i>&nbsp;&nbsp;</span>Blog Content Listing Page
                                    <div class="card-link">
                                        <div class="mt-2">
                                            <a style="width: 120px" class="btn btn-info" href="addblogdetail?BlogId=${blogid}">Add New</a>                                         
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <span>Number of posts on listing page: ${num}</span>
                                        <div class="container" style="padding-top: 10px">
                                            <c:forEach items="${blogdetail}" var="bd">
                                                <div class="media">
                                                    <div class="col-md-4">
                                                        <div class="media-left media-middle">
                                                            <img src="resources/img/Blog/${bd.imgBlogDetail}" class="img-thumbnail align-self-center mr-3" style="width:300px; height: 320px">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="media-body">
                                                            <h4 class="media-heading">${bd.title}</h4>
                                                            <div class="an">
                                                                <p style="color: #333333">${bd.content}</p>
                                                            </div>                 
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="media-body media-middle">
                                                            <div class="mt-2 text-center">
                                                                <a style="width: 120px" class="btn btn-info" href="updateblogdetail?BlogDetailID=${bd.blogDetailID}">Edit Content</a>                                         
                                                            </div>
                                                            <div class="mt-2 text-center">
                                                                <a style="width: 120px" class="btn btn-info" href="deleteblogdetail?BlogDetailId=${bd.blogDetailID}&BlogId=${blogid}">Delete</a>                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><hr>
                                            </c:forEach>
                                            <i class="fa fa-long-arrow-left mr-1 mb-1"></i><a href="ManageBlog" style="color: #00cccc">Back To Blog List</a>
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
