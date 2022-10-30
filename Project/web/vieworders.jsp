<%-- 
    Document   : certificateSecu
    Created on : Oct 11, 2022, 10:08:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
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
        <div class="super_container" >
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="breadcrumbs d-flex flex-row align-items-center">
                    <ul>
                        <li><a href="home">Home</a></li>
                        <li><a href="userprofile"><i class="fa fa-angle-right" aria-hidden="true"></i>My Profile</a></li>
                        <li class="active"><a href="vieworders"><i class="fa fa-angle-right" aria-hidden="true"></i>OrderLists</a></li>
                    </ul>
                </div>
                <div class="container" style="margin-top: 1% ; margin-bottom: 1%;padding-left: 40px;padding-right: 70px;background-color: #f5f5f5">
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center row">
                            <div class="col-md-10">
                                <div class="rounded">
                                    <div class="table-responsive p-5">
                                        <table class="table table-striped table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="background-color: #FE7C7F">Order </th>
                                                    <th style="background-color: #FE7C7F">Status</th>
                                                    <th style="background-color: #FE7C7F">Created</th>
                                                    <th style="background-color: #FE7C7F">Order Information</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-body">
                                                <c:forEach var="o" items="${orders}">
                                                    <tr class="cell-1">
                                                        <td>#OR${o.id}</td>
                                                        <td>
                                                            <span class="badge badge-pill badge-info">${o.status}</span>
                                                        </td>
                                                        <td>${o.date}</td>

                                                        <td><a href="orderdetails?id=${o.id}" style="cursor: pointer ">View</a></td>

                                                    </tr>
                                                    <c:set var="total" value="${total + o.totalPrice}" />
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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