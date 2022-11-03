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
        <title>Manage Blog</title>
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
                                    <span><i class="fa fa-list-alt"></i>&nbsp;&nbsp;</span>Blog Listing Page
                                    <div class="card-link">
                                        <div class="mt-2">
                                            <a style="width: 120px" class="btn btn-info" href="addblog?AuthorId=${sessionScope.account.userID }">Add New</a>                                         
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <form method="get" action="ManageBlog">
                                            <span>Number of posts on listing page: ${num}</span>
                                            <div class="container" style="padding-top: 10px">
                                                <c:forEach items="${list}" var="lb">
                                                    <c:if test="${sessionScope.account.userID == lb.authorId}">
                                                        <div class="media">
                                                            <div class="col-md-4">
                                                                <div class="media-left media-middle">
                                                                    <a href="ManageBlogDetail?id=${lb.id}"><img src="resources/img/Blog/${lb.imageLink}" class="img-thumbnail align-self-center mr-3" style="width: 300px; height: 320px"></a>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="media-body">
                                                                    <h4 class="media-heading">${lb.getTitle()}</h4>
                                                                    <div class="an">
                                                                        <p style="color: #333333">${lb.content}</p>
                                                                    </div>                 
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="media-body media-middle">
                                                                    <div class="mt-2 text-center">
                                                                        <a style="width: 120px" class="btn btn-info" href="update?BlogId=${lb.id}">Edit Blog</a>                                         
                                                                    </div>
                                                                    <div class="mt-2 text-center">
                                                                        <a style="width: 120px" class="btn btn-info" href="deleteblog?BlogId=${lb.id}&AuthorId=${sessionScope.account.userID}">Delete Blog</a>                                         
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><hr>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </form>
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
