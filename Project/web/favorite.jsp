<%-- 
    Document   : yourcart
    Created on : Oct 20, 2022, 5:29:00 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wishlist</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="pt-5 pb-5">
                    <div class="container">
                        <div class="row w-100">
                            <div class="col-lg-12 col-md-12 col-12">
                                <h3 class="display-5 mb-2 text-center">Wishlist&nbsp;<i class="fa fa-heart" style="color: #ff0000"></i></h3>
                                <p class="mb-5 text-center">
                                    There are <i class="text-info font-weight-bold">${num}</i>&nbsp; products in your favorite list
                                </p>
                                <table id="shoppingCart" class="table table-condensed">
                                    <tr>
                                        <th style="width:50%">Product</th>
                                        <th style="width:12%">Price</th>
                                        <th style="width:10%">Shop</th>
                                        <th style="width:10%"></th>
                                    </tr>
                                    <c:forEach items="${wishlish}" var="i">
                                        <tr>
                                            <c:forEach items="${listP}" var="p">
                                                <c:if test="${p.getProductID() == i.getProductID()}">
                                                    <td data-th="Product">
                                                        <div class="row">
                                                            <div class="col-md-3 text-left">
                                                                <img src="resources/img/products/${p.url}" class="img-thumbnail" style="height: 150px; width: 150px">
                                                            </div>
                                                            <div class="col-md-9 text-left mt-sm-2">
                                                                <h4>${p.productName}</h4>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td data-th="Price">${p.FormatPrice(p.getSellPrice())}₫</td>
                                                    <c:forEach items="${listS}" var="s">
                                                        <c:if test="${s.getID() == p.getShopID()}">
                                                            <td data-th="Shop">${s.getShopName()}</td>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td class="actions" data-th="">
                                                        <div class="text-right">
                                                            <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                                                <a href="#" onclick="doDelete('${i.getProductID()}')">
                                                                    <i class="fa fa-trash"></i>
                                                                </a>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </c:if>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure you want to remove the product from the list?")) {
                    window.location = "deleteProduct?id=" + id;
                }
            }
        </script>
        <script src="js/cart/jquery-3.3.1.slim.min.js"></script>
        <script src="js/cart/popper.min.js"></script>
        <script src="js/cart/bootstrap.min.js"></script>
    </body>
</html>