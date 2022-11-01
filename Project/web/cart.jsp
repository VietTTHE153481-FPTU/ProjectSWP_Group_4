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
        <title>Cart</title>
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
                        <c:if test="${sessionScope.cart.Size() == null}">
                            <div class="text-center">
                                <img src="resources/img/shopping.png" class="rounded" width="350" height="350">
                                <p class="mb-5">Your shopping cart is empty</p>
                                <div class="red_button deal_ofthe_week_button" style="padding-left: 5px; padding-right: 5px">
                                    <a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">go shopping now !!</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.cart.Size() > 0}">
                            <div class="row w-100">
                                <div class="col-lg-12 col-md-12 col-12">
                                    <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                                    <p class="mb-5 text-center">
                                        <i class="text-info font-weight-bold">${sessionScope.cart.Size()}</i>&nbsp;&nbsp; items in your cart
                                    </p>
                                    <table id="shoppingCart" class="table table-condensed table-responsive">
                                        <tr>
                                            <th style="width:50%">Product</th>
                                            <th style="width:12%">Price</th>
                                            <th style="width:10%">Quantity</th>
                                            <th style="width:10%"></th>
                                        </tr>
                                        <c:forEach items="${sessionScope.cart.getListItem()}" var="i">
                                            <tr>
                                                <td data-th="Product">
                                                    <div class="row">
                                                        <div class="col-md-3 text-left">
                                                            <img src="resources/img/products/${i.item_product.url}" class="img-thumbnail" style="height: 150px; width: 150px">
                                                        </div>
                                                        <div class="col-md-9 text-left mt-sm-2">
                                                            <h4>${i.item_product.productName}</h4>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td data-th="Price">${i.item_product.FormatPrice(i.item_product.sellPrice)} ₫</td>
                                                <td data-th="Quantity">
                                                    <div class="flex-b">
                                                        <button type="button" name="button"onclick="minus(${i.item_product.getProductID()})"><div style="padding-right: 10px">-</div></button>
                                                        <div><input style="text-align: center;width: 30px;border: solid; border-radius: 2px" type="text" name="name" value="${i.numO}" size="10" id="count" readonly></div>
                                                        <button type="button" name="button"onclick="plus(${i.item_product.getProductID()})"><div style="padding-left: 10px">+</div></button>
                                                    </div>

                                                </td>
                                                <td class="actions" data-th="">
                                                    <div class="text-right">
                                                        <button class="btn btn-white border-secondary bg-white btn-md mb-2" onclick="del(${i.item_product.getProductID()})">
                                                            <a href="#">
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <div class="float-right text-right">
                                        <h4>Total Amount:</h4>&nbsp;
                                        <h4 style="color: #ff3333">${sessionScope.cart.FormatPrice(sessionScope.cart.totalmoney())} ₫</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 d-flex align-items-center">
                                <div class="col-sm-6 order-md-2 text-right">
                                    <a href="CheckOut" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Checkout</a>
                                </div>
                                <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                                    <a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">
                                        <i class="fa fa-arrow-left mr-2"></i>Continue Shopping</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script src="js/cart/jquery-3.3.1.slim.min.js"></script>
        <script src="js/cart/popper.min.js"></script>
        <script src="js/cart/bootstrap.min.js"></script>
        <script type="text/javascript">
            function plus(a){
                window.location="DeleteInCart?mode=1&id="+a;
            }
            function minus(a){
                window.location="DeleteInCart?mode=2&id="+a;
            }
            function del(a){
                window.location="DeleteInCart?mode=3&id="+a;
            }
            
        </script>
    </body>
</html>
