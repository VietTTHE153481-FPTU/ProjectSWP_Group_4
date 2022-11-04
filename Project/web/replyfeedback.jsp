<%-- 
    Document   : replyfeedback
    Created on : Nov 4, 2022, 4:41:39 PM
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
        <title>Reply Feedback</title>
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
                        <form action="ReplyFeedback" method="post">
                            <div class="row">
                                <div class="col-lg-6 col-xs-12 col-md-12">
                                    <div class="white-box">
                                        <center>
                                            <h4 style="color: red">${requestScope.err}</h4>
                                        </center>
                                        <div style="display: none"> Feedback ID
                                            <input type="text" name="id" class="form-control validate" readonly value="${requestScope.feedback.getID()}"/>
                                        </div>
                                        <div> Product ID
                                            <input type="text" name="pid" class="form-control validate" readonly value="${requestScope.product.getProductID()}"/>
                                        </div>
                                        <div> Product name
                                            <input type="text" name="name" class="form-control validate" required readonly value="${requestScope.product.getProductName()}"/>
                                        </div>
                                        <div>Description
                                            <textarea name="description" class="form-control validate" rows="3" readonly>${requestScope.product.getDescription()}</textarea>
                                        </div>
                                        <div> Star
                                            <input type="text" name="star" class="form-control validate" readonly value="${requestScope.feedback.getStar()}"/>
                                        </div>
                                        <div>Customer Feedback
                                            <textarea name="feedback" class="form-control validate" rows="5" readonly>${requestScope.feedback.getFeedbackDetai()}</textarea>
                                        </div>                                       
                                        <a href="ManageFeedback" class="fa fa-angle-double-left">&nbsp; Back</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12 col-md-12">
                                    <div class="white-box">                                        
                                        <div>Reply 
                                            <textarea name="reply" class="form-control validate" rows="3"></textarea>
                                        </div>
                                        <br/>
                                        <br/>
                                        <center>
                                            <input type="submit" value="Reply" 
                                                   class="btn btn-primary btn-block text-uppercase mb-3">
                                            </a>
                                        </center>
                                    </div>
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
