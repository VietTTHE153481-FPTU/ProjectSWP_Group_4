<%-- 
    Document   : manageProduct
    Created on : Oct 31, 2022, 8:14:40 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Seller's Product Manage</title>
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
                    <span>Number of products: ${num}&nbsp;<i class="fa fa-cart-plus" style="color: #ff0000"></i></span>
                    <hr>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <span><i class="fa fa-table me-2"></i></span> Product Dashboard
                                </div>
                                <div>
                                    <a href="AddProduct" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Add New Product</a>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-striped data-table" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Product Name</th>
                                                    <th>Image</th>
                                                    <th>Description</th>
                                                    <th>Original Price</th>
                                                    <th>Sell Price</th>
                                                    <th>Sale Percent</th>
                                                    <th>Amount</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="o" items="${list}">
                                                    <tr>
                                                        <td>${o.getProductName()}</td>
                                                        <td>
                                                            <div class="img-thumbnail">
                                                                <img src="resources/img/products/${o.getUrl()}" style="height: 200px; width: 200px"/>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="width: 330px">
                                                                ${o.getDescription()}
                                                            </div>
                                                        </td>
                                                        <td>₫ ${o.FormatPrice(o.getOriginalPrice())}</td>
                                                        <td>₫ ${o.FormatPrice(o.getSellPrice())}</td>
                                                        <td>${o.FormatPrice(o.getSalePercent())} %</td>
                                                        <td>${o.getAmount()}</td>
                                                        <td>
                                                            <a href="UpdateProduct?id=${o.getProductID()}" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Update</a>
                                                            <a href="#" onclick="doDelete('${o.getProductID()}')" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Delete</a>
                                                        </td>
                                                    </tr>
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
        </div>
        <div class="overlay"></div>
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/seller/scrollbar.concat.min.js"></script>

        <script type="text/javascript">
            function doDelete(id){
                if(confirm("Are you sure to delete product with id="+id)){
                    window.location="DeleteProduct?id="+id;
                }
            }
        </script>
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
