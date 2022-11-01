<%-- 
    Document   : address
    Created on : Oct 20, 2022, 11:09:14 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/userprofile_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="row">
                    <div class="container rounded bg-white mt-5">
                        <div class="col-md-12">
                            <div style="padding-bottom: 15px;">
                                <div class="mt-3">
                                    <h4 class="text-left" style="padding-bottom: 15px;">My Address</h4>
                                    <button type="button" class="btn btn-primary text-right" data-toggle="modal" data-target="#myModal">
                                        Add Address
                                    </button>
                                </div>
                                <div class="modal" id="myModal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <form action="address" method="post">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">New Address</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="row mt-3">
                                                        <div class="col-md-6">
                                                            <input type="text" name="id" hidden value="${sessionScope.account.getUserID()}"/>
                                                            <input value="${fullname}" type="text" name="fullname" class="form-control" placeholder="Full name">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input value="${phone}" type="text" name="phone" class="form-control" placeholder="Phone Number">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <select id="inputCity" name="inputCity" class="form-control" required>
                                                                <option value="${inputCity}" disabled selected>Choose a city</option>
                                                                <c:forEach items="${city}" var="c">
                                                                    <option value="${c.getId()}">${c.getCityName()}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <input value="${note}" type="text" name="note" class="form-control" placeholder="Street Name, Building, House No.">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-danger" value="Add New"/>
                                                </div>
                                            </form>
                                        </div> 
                                    </div>
                                </div>












                            </div>
                        </div>
                        <div class="col-md-12 border-right">
                            <!--                            <form action="address" method="get">-->
                            <c:forEach items="${address}" var="ad">
                                <div class="modal" id="myModal2">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <form action="address" method="post">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">New Address</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="row mt-3">
                                                        <div class="col-md-6">
                                                            <input type="text" name="id" hidden value="${sessionScope.account.getUserID()}"/>
                                                            <input value="${ad.getShipName()}" type="text" name="fullname" class="form-control" placeholder="Full name">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input value="${ad.getPhoneNum()}" type="text" name="phone" class="form-control" placeholder="Phone Number">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <select id="inputCity" name="inputCity" class="form-control" required>
                                                                <option value="${inputCity}" disabled selected>Choose a city</option>
                                                                <c:forEach items="${city}" var="c">
                                                                    <c:if test="${ad.getShipCityID() == c.id}">
                                                                        <option value="${c.getId()}">${c.getCityName()}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <input value="${ad.getNoteDetail()}" type="text" name="note" class="form-control" placeholder="Street Name, Building, House No.">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-danger" value="Update"/>
                                                </div>
                                            </form>
                                        </div> 
                                    </div>
                                </div>
























                                <div class="row card-body" style="border-top: 1px dotted #cccccc">
                                    <div class="col-sm-10" style="border-right: 1px dotted #cccccc">
                                        <h5 class="card-title">${ad.getShipName()} <span style="color: #999999">| ${ad.getPhoneNum()}</span></h5>
                                        <p class="card-text">${ad.getNoteDetail()}</p>
                                        <c:forEach items="${city}" var="c">
                                            <c:if test="${ad.getShipCityID() == c.id}">
                                                <p class="card-text">${c.cityName}</p>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="col-sm-2 text-center">
                                        <div class="row">

                                            <a class="col-sm-6" >
                                                <button type="button" class="btn btn-primary text-right" data-toggle="modal" data-target="#myModal2"> Edit</button>
                                            </a>


                                            <a onclick="doDelete('${ad.getID()}')" class="col-sm-6">
                                                <button type="button" class="btn btn-primary text-right"> Delete</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--                            </form>-->
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete this Address?")) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/categories_custom.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
