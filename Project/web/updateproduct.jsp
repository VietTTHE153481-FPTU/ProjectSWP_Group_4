<%-- 
    Document   : addcategory
    Created on : Jul 1, 2022, 4:36:37 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Product</title>
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
                <div class="page-wrapper">
                    <div class="page-breadcrumb bg-white">
                        <div class="row align-items-center">
                            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                <h4 class="page-title">Products</h4>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">       
                        <form action="UpdateProduct" method="post">
                            <div class="row">
                                <div class="col-lg-6 col-xs-12 col-md-12">
                                    <div class="white-box">
                                        <c:set var="p" value="${requestScope.product}"/>
                                        <center>
                                            <h4 style="color: red">${requestScope.err}</h4>
                                        </center>
                                        
                                        <div> Product name
                                            <input type="text" name="name" class="form-control validate" required value="${p.getProductName()}"/>
                                        </div>
                                        <div>Description
                                            <textarea name="description" class="form-control validate" rows="3" value="${p.getDescription()}"></textarea>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                Original Price
                                                <input name="originalprice" type="text" class="form-control validate" value="${p.FormatPrice(p.getOriginalPrice())}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                Sell Price
                                                <input name="sellprice" type="text" class="form-control validate" value="${p.FormatPrice(p.getSellPrice())}"/>
                                            </div>
                                        </div>                     
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                Amount:
                                                <input name="amount" type="text" class="form-control validate" value="${p.getAmount()}"/>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group mb-3">
                                            SubCategory:
                                            <select name="subcategory" class="form-select-sm">
                                                <option value="0">Select a subcategory</option>
                                                <c:forEach items="${requestScope.subcategories}" var="subcate">
                                                    <c:if test="${subcate.getSubCateID() == p.getSubCategoryID()}">
                                                        <option value="${subcate.getSubCateID()}" selected>${subcate.getSubCateName()}</option>
                                                    </c:if>
                                                    <option value="${subcate.getSubCateID()}">${subcate.getSubCateName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        
                                        <center>
                                            <input type="submit" value="Update Product" 
                                                   class="btn btn-primary btn-block text-uppercase mb-3">
                                            </a>
                                        </center>
                                        <a href="ManageProduct" class="fa fa-angle-double-left">&nbsp; Back</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12 col-md-12">
                                    <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                                        <input accept="image/*" 
                                               id="upload" name="image" type="file" onchange="readURL(this);" class="form-control border-0">
                                        <label id="upload-label" for="upload" class="font-weight-light text-muted">Choose File</label>
                                        <div>
                                            <label for="upload" class="btn btn-light m-0 rounded-pill px-4"> <i class="fa fa-cloud-upload mr-2 text-muted"></i>&nbsp;<small class="text-uppercase font-weight-bold text-muted">Choose file</small></label>
                                        </div>
                                    </div>
                                    <div class="image-area"><img id="imageResult" src="#" class="img-fluid rounded shadow-sm mx-auto d-block"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imageResult')
                                .attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $(function () {
                $('#upload').on('change', function () {
                    readURL(input);
                });
            });
            var input = document.getElementById('upload');
            var infoArea = document.getElementById('upload-label');

            input.addEventListener('change', showFileName);
            function showFileName(event) {
                var input = event.srcElement;
                var fileName = input.files[0].name;
                infoArea.textContent = 'File name: ' + fileName;
            }
        </script>
        <script src="plugins/bower_components/jquery/jquery.min.js"></script>
        <script src="styles/bootstrap4/bootstrap.bundle.min.js"></script>
        <script src="js/dashboards/custom_admin.js"></script>
        <script src="js/dashboards/app-style-switcher.js"></script>
        <script src="js/dashboards/waves.js"></script>
        <script src="js/dashboards/sidebarmenu.js"></script>
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
