<%-- 
    Document   : orderdetail
    Created on : Oct 25, 2022, 11:25:59 PM
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
                <div class="container">
                    <div class="row">
                        <div class="col-12" style="padding-top: 10px">
                            <div class="card">
                                <div class="card-body text-center">
                                    <h5 class="card-title m-b-0"><i class="fa fa-shopping-cart green-color" ></i>
                                        Products</h5>
                                </div>
                                <div class="table-responsive p-5">
                                    <table class="table table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <c:forEach var="od" items="${listO}">
                                                <tr>
                                                    <td>${od.productName}</td>
                                                    <td><img onmouseover="bigImg(this)" onmouseout="normalImg(this)"  
                                                             src="resources/img/products/${od.productImgURL}" alt="" 
                                                             style="width: 100px; height: 100px"></td>
                                                    <td>₫ ${od.productPrice}</td>
                                                    <td>${od.quantity}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <br>
                                    <br>
                                    <h3 style="color:black;">Total: ₫ ${Total}</h3>
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