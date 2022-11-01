<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Seller's Dashboard</title>
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
                        <div class="col-md-12">
                            <h4>Dashboard</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <div class="card bg-primary text-white h-100"> 
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Custom</h3>
                                    <p class="text-center text-white mt-3 mb-0 fs-3 ">${totalCus} <i class="fa fa-user"></i></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card bg-warning text-dark h-100">
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Product </h3>
                                    <p class="text-center text-white mt-4 mb-0 fs-3 ">${toalProduct} <i class="fa fa-product-hunt"></i></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card bg-danger text-white h-100">
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Order</h3>
                                    <p class="text-center text-white mt-3 mb-0 fs-3 "> ${totalOrders} <i class="fa fa-archive"></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <span><i class="fa fa-table me-2"></i></span> Order Dashboard
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-striped data-table" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Product Name</th>
                                                    <th>Product price</th>
                                                    <th>Status</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="o" items="${listOrder}">
                                                    <tr>
                                                        <td>${o.id}</td>
                                                        <td>${o.productName}</td>
                                                        <td>${o.productPrice}</td>
                                                        <c:if test="${o.status == 1}">
                                                            <td><span class="badge rounded-pill bg-secondary">Waiting for Confirmation</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 2}">
                                                            <td><span class="badge rounded-pill bg-warning text-dark">Packing</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 3}">
                                                            <td><span class="badge rounded-pill bg-primary">Delivering</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 4}">
                                                            <td><span class="badge bg-danger">Canceled</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 5}">
                                                            <td><span class="badge bg-success">completed</span></td>
                                                        </c:if>
                                                        <td>${o.date}</td>
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
