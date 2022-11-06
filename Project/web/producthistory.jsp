<%-- 
    Document   : producthistory
    Created on : Nov 5, 2022, 12:42:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product History</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    </head>
    <style>
        .success {
            margin-top: 160px;
            text-align: center;
            padding: 40px 0;
            background: #EBF0F5;
        }
        h1 {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
        }
        p {
            color: #404F5E;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-size:20px;
            margin: 0;
        }
        i {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left:-15px;
        }
        .card {
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            margin: 0 auto;
        }
    </style>
    <body>
        <div class="success">
            <div class="card">
                <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
                    <i class="checkmark">✓</i>
                </div>
                <h1>Success</h1> 
                <p>We received your purchase request;<br/> we'll be in touch shortly!</p>
            </div>
        </div>
        <div class="super_container">
            <%@include file = "layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="product-grid">
                    <ul>
                        <c:forEach items="${listPdByCid}" var="pd">
                            <div class="product-item">
                                <div class="product discount product_filter">
                                    <div class="product_image">
                                        <a href="detail?id=${pd.getProductID()}">
                                            <img src="resources/img/products/${pd.getUrl()}" height="230px"/>
                                        </a>
                                    </div>
                                    <div class="favorite favorite_left"></div>
                                    <a href="detail?id=${pd.getProductID()}">
                                        <c:if test="${pd.getSalePercent()>0}">
                                            <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${pd.FormatPrice(pd.getSalePercent())}%</span></div>
                                        </c:if>
                                        <div class="product_info">
                                            <h6 class="product_name">${pd.getProductName()}</h6>
                                            <div class="product_price">₫ ${pd.FormatPrice(pd.getSellPrice())}
                                                <c:if test="${pd.getSalePercent()>0}">
                                                    <span>₫ ${pd.FormatPrice(pd.getOriginalPrice())}</span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="red_button add_to_cart_button"><a href="cart?id=${pd.getProductID()}&numO=1">add to cart</a></div>
                            </div>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <%@include file = "layout/Footer.jsp" %>
        </div>
        <script type="text/javascript">
            product_viewed();
            function product_viewed() {
                
                var id_product =$('#product_viewed_id').val();
                if(id_product != undefined){
                    var id= id_product;
                    var name= document.getElementById('viewed_productname'+id).value;
                    var originalprice= document.getElementById('viewed_originalprice'+id).value;
                    var sellprice= document.getElementById('viewed_sellprice'+id).value;
                    var salepercent= document.getElementById('viewed_salepercent'+id).value;
                    var image= document.getElementById('viewed_image'+id).value;

                    var newItem = {
                        'id':id_product,
                        'name':name,
                        'originalprice':originalprice,
                        'sellprice':sellprice,
                        'salepercent':salepercent,
                        'image':image
                    }
                    
                    if(localStorage.getItem('viewed')==null){
                        localStorage.setItem('viewed','[]');
                    }
                    
                    var old_data = JSON.parse(localStorage.getItem('viewed'));
                    
                    var matches = $.grep(old_data, function(obj){
                        return obj.id==id;
                    })
                    
                    if(matches.length){
                        
                    }else{
                        old_data.push(newItem);
                        $('viewed').append('')
                    }
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

