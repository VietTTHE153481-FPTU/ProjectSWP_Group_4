<%-- 
    Document   : feedbackdetail
    Created on : Nov 4, 2022, 12:31:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Feedback</title>
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
            .rating {
                display: inline-block;
                position: relative;
                height: 50px;
                line-height: 50px;
                font-size: 50px;
            }
            .rating label {
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                cursor: pointer;
            }
            .rating label:last-child {
                position: static;
            }
            .rating label:nth-child(1) {
                z-index: 5;
            }
            .rating label:nth-child(2) {
                z-index: 4;
            }
            .rating label:nth-child(3) {
                z-index: 3;
            }
            .rating label:nth-child(4) {
                z-index: 2;
            }
            .rating label:nth-child(5) {
                z-index: 1;
            }
            .rating label input {
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0;
            }
            .rating label .icon {
                float: left;
                color: transparent;
            }
            .rating label:last-child .icon {
                color: #000;
            }
            .rating:not(:hover) label input:checked ~ .icon,
            .rating:hover label:hover input ~ .icon {
                color: #fcc603;
            }
            .rating label input:focus:not(:checked) ~ .icon:last-child {
                color: #000;
                text-shadow: 0 0 5px #09f;
            }
        </style>
        <script>
            let starValue = 0;
            /* for star rating */
            function starChange(value) {
                console.log('New star rating: ' + value);
                starValue = value;
            }
            /* for submit feedback */
            function submitFeedback() {
                document.getElementById('star-value').value = starValue;
                document.getElementById('submit-feedback').submit();
            }
        </script>
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="container">
                    <div class="row mt-3">
                        <div class="col-md-5">
                            <img src="./resources/img/products/${product.url}" style="width: 200px; margin: 40px 0 0 40px;">
                            <div class="card-body p-5">
                                <h3 class="title mb-3">${product.productName}</h3>
                                <p class="price-detail-wrap"> 
                                    <span class="price h3 text-warning"> 
                                        <span  class="currency" >${product.sellPrice}</span>
                                    </span> 
                                </p> 
                                <hr>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="card">
                                <div class="feedback-form mt-5 mb-5 ml-5 mr-5">
                                    <!--                                <div class="header">
                                                                        <h3 class="text-success">Add feedback for product</h3>
                                                                    </div>-->
                                    <div class="star-rating">
                                        <form class="rating">
                                            <label>
                                                <input type="radio" name="stars" value="1" onclick="starChange(this.value)"/>
                                                <span class="icon">★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="stars" value="2" onclick="starChange(this.value)"/>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="stars" value="3" onclick="starChange(this.value)"/>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>   
                                            </label>
                                            <label>
                                                <input type="radio" name="stars" value="4" onclick="starChange(this.value)"/>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="stars" value="5" onclick="starChange(this.value)"/>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                                <span class="icon">★</span>
                                            </label>
                                        </form>
                                    </div>
                                    <div class="feedback-text">
                                        <form action="feedbackdetail" id="submit-feedback" method="post" onsubmit="submitFeedback()" >                                    
                                            <label for="feedback-text" class="form-label">Your Feedback: </label>
                                            <textarea name="feedback-text" class="form-control" id="feedback-text" rows="5" placeholder="Write your Feedback here"></textarea>
                                            <input type="hidden" id="star-value" name="star-value">
                                            <input type="hidden" id="productId" name="productid" value="${pid}">
                                            <input type="hidden" id="orderId" name="orderid" value="${oid}">
                                            <input type="submit" class="btn btn-success mt-5" value="Submit">                                   
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    window.onload = function () {
                        formatCurrency();
                    };
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'VND',

                        // These options are needed to round to whole numbers if that's what you want.
                        //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                        //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
                    });
                    function formatCurrency() {

                        var listCurrency = document.getElementsByClassName("currency");
                        for (let i = 0; i < listCurrency.length; i++) {
                            listCurrency[i].innerHTML = formatter.format(listCurrency[i].innerHTML);
                        }
                    }
                </script>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
    </body>
</html>
