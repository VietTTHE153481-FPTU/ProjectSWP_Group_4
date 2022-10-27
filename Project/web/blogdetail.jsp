<%-- 
    Document   : blogdetail
    Created on : Oct 3, 2022, 8:20:34 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${blog.title}</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/bloglist_style.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="breadcrumbs d-flex flex-row align-items-center">
                    <ul>
                        <li><a href="home">Home</a></li>
                        <li><a href="bloglist?key="><i class="fa fa-angle-right" aria-hidden="true"></i>Blogs</a></li>
                        <li class="active"><a href="blogdetail"><i class="fa fa-angle-right" aria-hidden="true"></i>${blog.title}</a></li>
                    </ul>
                </div>
                <section class="bg0 p-t-1 p-b-20">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-lg-9 p-b-80">
                                <div class="p-r-45 p-r-0-lg">
                                    <h6 class="ltext-109 cl2 p-b-28">
                                        ${blog.title}
                                    </h6>
                                    <p class="stext-117 cl6 p-b-26" style="color: #000">${blog.content}</p>
                                    <div class="wrap-pic-w how-pos5-parent">
                                        <img src="resources/img/Blog/${blog.getImageLink()}">
                                        <div class="flex-col-c-m size-123 bg9 how-pos5">
                                            <span class="ltext-107 cl2 txt-center">
                                                ${blog.day}
                                            </span>
                                            <span class="stext-109 cl3 txt-center">
                                                ${blog.month} ${blog.year}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="p-t-32">
                                        <span class="flex-w flex-m stext-111 cl2 p-b-19">
                                            <span>
                                                <span class="cl4">By</span> Name Author
                                                <span class="cl12 m-l-4 m-r-6">|</span>
                                            </span>
                                            <span>
                                                ${blog.day} ${blog.month}, ${blog.year}
                                                <span class="cl12 m-l-4 m-r-6">|</span>
                                            </span>
                                        </span>
                                        <c:forEach items="${blogdetail}" var="bd">
                                            <h4 class="text-center ltext-108 cl2 p-b-28">
                                                ${bd.title}
                                            </h4>
                                            <div class="wrap-pic-w how-pos5-parent">
                                                <img src="resources/img/Blog/${bd.getImgBlogDetail()}"/>
                                            </div>
                                            <br>
                                            <p class="stext-117 cl6 p-b-26">
                                                ${bd.content}
                                            </p>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-lg-3 p-b-80">
                                <div class="side-menu">
                                    <form action="blogdetail" method="get">
                                        <div class="bor17 of-hidden pos-relative">
                                            <input value="${key}" class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="key" placeholder="Search"/>
                                            <input type="hidden" name="id" value="${blog.id}"/>
                                            <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="p-t-40">
                    <h5 class="mtext-113 cl2 p-b-12">
                        Leave a Comment
                    </h5>
                    <p class="stext-107 cl6 p-b-40">
                        Your email address will not be published. Required fields are marked *
                    </p>
                    <form>
                        <div class="bor19 m-b-20">
                            <textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
                        </div>
                        <div class="bor19 size-218 m-b-20">
                            <input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="name" placeholder="Enter your name">
                        </div>
                        <div class="bor19 size-218 m-b-20">
                            <input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="email" placeholder="Enter your email">
                        </div>
                        <button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
                            Post Comment
                        </button>
                    </form>
                </div>
            </div>
            <%@include file = "layout/Footer.jsp" %>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
