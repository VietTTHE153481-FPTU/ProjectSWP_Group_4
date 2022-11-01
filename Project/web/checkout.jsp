<%-- 
    Document   : checkout
    Created on : Nov 1, 2022, 8:16:58 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
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
        <style>
            .notiship{
                display: flex;
                border: 1px dashed rgba(0,0,0,.09);
                margin: 10px;
                justify-content: space-evenly;
            }
            .noti{
                flex: 4;
            }
            .notibox{
                display: flex;
                padding: 16px 30px;
            }
            .notibox span{
                padding-top: 5px;
            }
            .notiinputbox{
                flex: 1;
            }
            .notiinput{
                margin-left: 15px;
                margin-bottom: 0;
                font-weight: 300;
                padding: 5px;
                border: 1px solid #7f7f7f;
            }
            .ship{
                margin-top: 10px;
                flex: 6;
            }

        </style>
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="pt-5 pb-5">
                    <div class="container">
                        <c:if test="${sessionScope.cart.Size() > 0}">
                            <div class="row w-100">
                                <div class="col-lg-12 col-md-12 col-12">
                                    <h2 class="display-5 mb-2 text-center">Check Out</h2>
                                    <div class="mb-5 text-left">
                                        <h4 style="color:orange;">Address</h4>
                                        <br/>
                                        <p>
                                            <span style="font-weight: bold">${sessionScope.account.getFullname()}  ${sessionScope.account.getPhone()}</span>
                                            <span></span>
                                            &nbsp&nbsp&nbsp&nbsp
                                            <a><a href="address">Change address</a>
                                        </p>
                                    </div>
                                    <table id="shoppingCart" class="table table-condensed table-responsive">
                                        <tr>
                                            <th style="width:50%">Product</th>
                                            <th style="width:12%">Price</th>
                                            <th style="width:10%">Quantity</th>
                                        </tr>
                                        <c:forEach items="${sessionScope.cart.getListItem()}" var="i">
                                            <tr>
                                                <td data-th="Product">
                                                    <div class="row">
                                                        <div class="col-md-3 text-left">
                                                            <img src="resources/img/products/${i.item_product.url}" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                        </div>
                                                        <div class="col-md-9 text-left mt-sm-2">
                                                            <h4>${i.item_product.productName}</h4>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td data-th="Price">${i.item_product.FormatPrice(i.item_product.sellPrice)} ₫</td>
                                                <td data-th="Quantity">${i.numO}</td>          
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <div class="notiship">
                                        <div class="noti">
                                            <div class="notibox">
                                                <span>Notice: </span>
                                                <div class="notiinputbox">
                                                    <form name="checkout" method="post">
                                                        <input class="notiinput" type="text" name="notice" placeholder="Notice for Seller"/>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ship">
                                            <span style="color: #008fa1">Shipping fees:</span>
                                            
                                        </div>
                                    </div>
                                            <div class="float-right text-right">
                                                <h4>Total Amount:</h4>&nbsp;
                                                <h4 style="color: #ff3333">${sessionScope.cart.FormatPrice(sessionScope.cart.totalmoney())} ₫</h4>
                                            </div>
                                </div>
                                <div class="row mt-4 d-flex align-items-center">
                                    <div class="col-sm-6 order-md-2 text-right">
                                        <a href="#" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Check out</a>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                                        <a href="ViewCartServlet">
                                            <i class="fa fa-arrow-left mr-2"></i>Go back Cart</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
            <script src="js/cart/jquery-3.3.1.slim.min.js"></script>
            <script src="js/cart/popper.min.js"></script>
            <script src="js/cart/bootstrap.min.js"></script>
    </body>
</html>

