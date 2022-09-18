<%-- 
    Document   : editproduct
    Created on : Jul 14, 2022, 9:13:25 AM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Product - Dashboard</title>
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link href="styles/css/style.min.css" rel="stylesheet">
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <a class="navbar-brand" href="dashboard.jsp">
                            <b class="logo-icon">
                                <img src="images/logo-icon.jpg" alt="homepage" />
                            </b>
                            <span class="logo-text">
                                <img src="images/logo-text.jpg" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <ul class="navbar-nav ms-auto d-flex align-items-center">
                            <li>
                                <a class="profile-pic" href="#">
                                    <img src="images/logo_admin.png" alt="user-img" width="36"
                                         class="img-circle"><span class="text-white font-medium">${sessionScope.admin.username}</span></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <div class="scroll-sidebar">
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <li class="sidebar-item pt-2">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="profile.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span class="hide-menu">Profile</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="adproducts"
                                   aria-expanded="false">
                                    <i class="fa fa-product-hunt" aria-hidden="true"></i>
                                    <span class="hide-menu">Products</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    <span class="hide-menu">Logout</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </aside>
            <div class="page-wrapper">
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Products Admin</h4>
                        </div>
                    </div>
                </div>
                <div class="container-fluid"> 
                    <c:set var="p" value="${requestScope.detail}"/>
                    <form action="editproduct" method="post">
                        <div class="row">
                            <div class="col-lg-6 col-xs-12 col-md-12">
                                <div class="white-box">
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            Product ID 
                                            <input value="${p.id}" type="number" name="id" class="form-control validate" readonly required/>
                                        </div>
                                    </div>
                                    <div> Product name
                                        <input value="${p.name}" type="text" name="name" class="form-control validate" required/>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            Price
                                            <input value="₫ ${p.price} " name="price" type="text" class="form-control validate"/>
                                        </div>
                                    </div>
                                    <div>Describe
                                        <input value="${p.describe}" type="text" name="describe" class="form-control validate"/>
                                    </div>
                                    <br/>
                                    <div> Materials
                                        <textarea name="materials" class="form-control validate" rows="3">${p.materials}</textarea>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            Release Date:
                                            <input value="${p.releaseDate}" type="date" name="date" class="form-control validate"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <center>
                                        <input type="submit" value="Edit Product" 
                                               class="btn btn-primary btn-block text-uppercase mb-3">
                                        </a>
                                    </center>
                                    <a href="adproducts" class="fa fa-angle-double-left">&nbsp; Back</a>
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
                                <div class="image-area"><img id="imageResult" src="${p.image}" class="img-fluid rounded shadow-sm mx-auto d-block"></div>
                            </div>
                        </div>
                    </form>
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
    </body>
</html>
