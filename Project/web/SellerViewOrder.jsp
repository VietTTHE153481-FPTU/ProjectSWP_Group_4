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
        <title>Seller's Order Manage</title>
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
                    <span>Number of Orders ${data.size()}&nbsp;<i class="fa fa-cart-plus" style="color: #ff0000"></i></span>
                    <hr>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <span><i class="fa fa-table me-2"></i></span> Orders Dashboard
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-striped data-table" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>OrderID</th>
                                                    <th>UserID</th>
                                                    <th>TotalPrice</th>
                                                    <th>Status</th>
                                                    <th>Note&Option</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="o" items="${data}">



                                                    <tr>

                                                        <td>${o.getId()}</td>
                                                        <td>${o.getUserId()}</td>
                                                        <td>${o.getTotalPrice()}₫ </td>
                                                        <td>
                                                            <select name="hehe" id="demoSelect" >
                                                                <c:choose>
                                                                    <c:when test="${o.getStatus() eq 'Waiting for Confirmation'}">
                                                                        <option value="1" selected>Waiting for Confirmation</option>
                                                                        <option value="2">Packaging</option>
                                                                        <option value="3">Delivering</option>
                                                                        <option value="4">Canceled</option>
                                                                        <option value="5">Completed</option>
                                                                    </c:when>
                                                                    <c:when test="${o.getStatus() eq 'Packaging'}">
                                                                        <option value="1">Waiting for Confirmation</option>
                                                                        <option value="2" selected>Packaging</option>
                                                                        <option value="3">Delivering</option>
                                                                        <option value="4">Canceled</option>
                                                                        <option value="5">Completed</option>
                                                                    </c:when>
                                                                    <c:when test="${o.getStatus() eq 'Delivering'}">
                                                                        <option value="1">Waiting for Confirmation</option>
                                                                        <option value="2">Packaging</option>
                                                                        <option value="3" selected>Delivering</option>
                                                                        <option value="4">Canceled</option>
                                                                        <option value="5">Completed</option>
                                                                    </c:when>
                                                                    <c:when test="${o.getStatus() eq 'Canceled'}">
                                                                        <option value="1">Waiting for Confirmation</option>
                                                                        <option value="2">Packaging</option>
                                                                        <option value="3">Delivering</option>
                                                                        <option value="4" selected>Canceled</option>
                                                                        <option value="5">Completed</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="1">Waiting for Confirmation</option>
                                                                        <option value="2">Packaging</option>
                                                                        <option value="3">Delivering</option>
                                                                        <option value="4">Canceled</option>
                                                                        <option value="5" selected>Completed</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </select>
                                                        </td>
                                                        <td>

                                                            <form action="ManageOrder" method="post">
                                                                <div style="width: 330px">
                                                                    <textarea name="note" cols="36" rows="5">${o.getNote()}</textarea>
                                                                </div>
                                                                <input id="demoInput" type="text" name="status" hidden/>
                                                                <input type="text" name="orderID" value="${o.getId()}" hidden>
                                                                <!--                                                                <input name="lemao" type="text" hidden value="Up">-->
                                                                <button name="bu" type="submit" class="border-0" style="background-color: none" value="Up">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-up" viewBox="0 0 16 16">
                                                                    <path fill-rule="evenodd" d="M8 10a.5.5 0 0 0 .5-.5V3.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 3.707V9.5a.5.5 0 0 0 .5.5zm-7 2.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z"/>
                                                                    </svg>
                                                                </button>
                                                                <button name="bu" type="submit" class="border-0" style="background-color: none" value="Del">
                                                                    <input name="lemao" type="submit" hidden value="Del">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                    </svg>
                                                                </button>
                                                            </form>   
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

            $('#demoSelect').change(function () {
                $('#demoInput').val($(this).val());
            }).change();


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
