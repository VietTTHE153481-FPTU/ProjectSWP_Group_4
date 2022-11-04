<%-- 
    Document   : feedback
    Created on : Nov 3, 2022, 11:37:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
            .animated {
                -webkit-transition: height 0.2s;
                -moz-transition: height 0.2s;
                transition: height 0.2s;
            }

            .stars
            {
                margin: 20px 0;
                font-size: 24px;
                color: #d17581;
            }
        </style>
    </head>
    <body>
        <div class="super_container">
            <%@include file="layout/Header.jsp" %>
            <div class="container product_section_container">
                <div class="pt-5 pb-5">
                    <div class="container">
                        <c:if test="${sessionScope.cart.Size() == null}">
                            <div class="text-center">
                                <img src="resources/img/shopping.png" class="rounded" width="350" height="350">
                                <p class="mb-5">Your shopping cart is empty</p>
                                <div class="red_button deal_ofthe_week_button" style="padding-left: 5px; padding-right: 5px">
                                    <a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">go shopping now !!</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.cart.Size() > 0}">
                            <div class="row w-100">
                                <div class="col-lg-12 col-md-12 col-12">
                                    <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                                    <p class="mb-5 text-center">
                                        <i class="text-info font-weight-bold">${sessionScope.cart.Size()}</i>&nbsp;&nbsp; items in your cart
                                    </p>
                                    <table id="shoppingCart" class="table table-condensed table-responsive">
                                        <tr>
                                            <th style="width:50%">Product</th>
                                            <th style="width:10%">Review</th>
                                        </tr>
                                        <c:forEach items="${sessionScope.cart.getListItem()}" var="i">
                                            <tr>
                                                <td data-th="Product">
                                                    <div class="row">
                                                        <div class="col-md-3 text-left">
                                                            <img src="resources/img/products/${i.item_product.url}" class="img-thumbnail" style="height: 150px; width: 150px">
                                                        </div>
                                                        <div class="col-md-6 text-left mt-sm-2">
                                                            <h4>${i.item_product.productName}</h4>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="" data-th="">
                                                      <a class="btn btn-success btn-green" href="feedbackdetail?productid=${i.item_product.productID}" id="open-review-box">Leave a Review</a>
                                                </td>                                                 
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="row mt-4 d-flex align-items-center">
                               
                                <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                                    <a href="products?page=1&key=&cid=${0}&sid=${0}&sortType=${0}&sortMode=${0}">
                                        <i class="fa fa-arrow-left mr-2"></i>Continue Shopping</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <%@include file="layout/Footer.jsp" %>
        </div>
        <script src="js/cart/jquery-3.3.1.slim.min.js"></script>
        <script src="js/cart/popper.min.js"></script>
        <script src="js/cart/bootstrap.min.js"></script>
        <script type="text/javascript">
            function plus(a) {
                window.location = "DeleteInCart?mode=1&id=" + a;
            }
            function minus(a) {
                window.location = "DeleteInCart?mode=2&id=" + a;
            }
            function del(a) {
                window.location = "DeleteInCart?mode=3&id=" + a;
            }

            (function (e) {
                var t, o = {className: "autosizejs", append: "", callback: !1, resizeDelay: 10}, i = '<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>', n = ["fontFamily", "fontSize", "fontWeight", "fontStyle", "letterSpacing", "textTransform", "wordSpacing", "textIndent"], s = e(i).data("autosize", !0)[0];
                s.style.lineHeight = "99px", "99px" === e(s).css("lineHeight") && n.push("lineHeight"), s.style.lineHeight = "", e.fn.autosize = function (i) {
                    return this.length ? (i = e.extend({}, o, i || {}), s.parentNode !== document.body && e(document.body).append(s), this.each(function () {
                        function o() {
                            var t, o;
                            "getComputedStyle"in window ? (t = window.getComputedStyle(u, null), o = u.getBoundingClientRect().width, e.each(["paddingLeft", "paddingRight", "borderLeftWidth", "borderRightWidth"], function (e, i) {
                                o -= parseInt(t[i], 10)
                            }), s.style.width = o + "px") : s.style.width = Math.max(p.width(), 0) + "px"
                        }
                        function a() {
                            var a = {};
                            if (t = u, s.className = i.className, d = parseInt(p.css("maxHeight"), 10), e.each(n, function (e, t) {
                                a[t] = p.css(t)
                            }), e(s).css(a), o(), window.chrome) {
                                var r = u.style.width;
                                u.style.width = "0px", u.offsetWidth, u.style.width = r
                            }
                        }
                        function r() {
                            var e, n;
                            t !== u ? a() : o(), s.value = u.value + i.append, s.style.overflowY = u.style.overflowY, n = parseInt(u.style.height, 10), s.scrollTop = 0, s.scrollTop = 9e4, e = s.scrollTop, d && e > d ? (u.style.overflowY = "scroll", e = d) : (u.style.overflowY = "hidden", c > e && (e = c)), e += w, n !== e && (u.style.height = e + "px", f && i.callback.call(u, u))
                        }
                        function l() {
                            clearTimeout(h), h = setTimeout(function () {
                                var e = p.width();
                                e !== g && (g = e, r())
                            }, parseInt(i.resizeDelay, 10))
                        }
                        var d, c, h, u = this, p = e(u), w = 0, f = e.isFunction(i.callback), z = {height: u.style.height, overflow: u.style.overflow, overflowY: u.style.overflowY, wordWrap: u.style.wordWrap, resize: u.style.resize}, g = p.width();
                        p.data("autosize") || (p.data("autosize", !0), ("border-box" === p.css("box-sizing") || "border-box" === p.css("-moz-box-sizing") || "border-box" === p.css("-webkit-box-sizing")) && (w = p.outerHeight() - p.height()), c = Math.max(parseInt(p.css("minHeight"), 10) - w || 0, p.height()), p.css({overflow: "hidden", overflowY: "hidden", wordWrap: "break-word", resize: "none" === p.css("resize") || "vertical" === p.css("resize") ? "none" : "horizontal"}), "onpropertychange"in u ? "oninput"in u ? p.on("input.autosize keyup.autosize", r) : p.on("propertychange.autosize", function () {
                            "value" === event.propertyName && r()
                        }) : p.on("input.autosize", r), i.resizeDelay !== !1 && e(window).on("resize.autosize", l), p.on("autosize.resize", r), p.on("autosize.resizeIncludeStyle", function () {
                            t = null, r()
                        }), p.on("autosize.destroy", function () {
                            t = null, clearTimeout(h), e(window).off("resize", l), p.off("autosize").off(".autosize").css(z).removeData("autosize")
                        }), r())
                    })) : this
                }
            })(window.jQuery || window.$);

            var __slice = [].slice;
            (function (e, t) {
                var n;
                n = function () {
                    function t(t, n) {
                        var r, i, s, o = this;
                        this.options = e.extend({}, this.defaults, n);
                        this.$el = t;
                        s = this.defaults;
                        for (r in s) {
                            i = s[r];
                            if (this.$el.data(r) != null) {
                                this.options[r] = this.$el.data(r)
                            }
                        }
                        this.createStars();
                        this.syncRating();
                        this.$el.on("mouseover.starrr", "span", function (e) {
                            return o.syncRating(o.$el.find("span").index(e.currentTarget) + 1)
                        });
                        this.$el.on("mouseout.starrr", function () {
                            return o.syncRating()
                        });
                        this.$el.on("click.starrr", "span", function (e) {
                            return o.setRating(o.$el.find("span").index(e.currentTarget) + 1)
                        });
                        this.$el.on("starrr:change", this.options.change)
                    }
                    t.prototype.defaults = {rating: void 0, numStars: 5, change: function (e, t) {}};
                    t.prototype.createStars = function () {
                        var e, t, n;
                        n = [];
                        for (e = 1, t = this.options.numStars; 1 <= t ? e <= t : e >= t; 1 <= t ? e++ : e--) {
                            n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))
                        }
                        return n
                    };
                    t.prototype.setRating = function (e) {
                        if (this.options.rating === e) {
                            e = void 0
                        }
                        this.options.rating = e;
                        this.syncRating();
                        return this.$el.trigger("starrr:change", e)
                    };
                    t.prototype.syncRating = function (e) {
                        var t, n, r, i;
                        e || (e = this.options.rating);
                        if (e) {
                            for (t = n = 0, i = e - 1; 0 <= i ? n <= i : n >= i; t = 0 <= i ? ++n : --n) {
                                this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")
                            }
                        }
                        if (e && e < 5) {
                            for (t = r = e; e <= 4 ? r <= 4 : r >= 4; t = e <= 4 ? ++r : --r) {
                                this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")
                            }
                        }
                        if (!e) {
                            return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")
                        }
                    };
                    return t
                }();
                return e.fn.extend({starrr: function () {
                        var t, r;
                        r = arguments[0], t = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
                        return this.each(function () {
                            var i;
                            i = e(this).data("star-rating");
                            if (!i) {
                                e(this).data("star-rating", i = new n(e(this), r))
                            }
                            if (typeof r === "string") {
                                return i[r].apply(i, t)
                            }
                        })
                    }})
            })(window.jQuery, window);
            $(function () {
                return $(".starrr").starrr()
            })

            $(function () {

                $('#new-review').autosize({append: "\n"});

                var reviewBox = $('#post-review-box');
                var newReview = $('#new-review');
                var openReviewBtn = $('#open-review-box');
                var closeReviewBtn = $('#close-review-box');
                var ratingsField = $('#ratings-hidden');

                openReviewBtn.click(function (e)
                {
                    reviewBox.slideDown(400, function ()
                    {
                        $('#new-review').trigger('autosize.resize');
                        newReview.focus();
                    });
                    openReviewBtn.fadeOut(100);
                    closeReviewBtn.show();
                });

                closeReviewBtn.click(function (e)
                {
                    e.preventDefault();
                    reviewBox.slideUp(300, function ()
                    {
                        newReview.focus();
                        openReviewBtn.fadeIn(200);
                    });
                    closeReviewBtn.hide();

                });

                $('.starrr').on('starrr:change', function (e, value) {
                    ratingsField.val(value);
                });
            });
        </script>
    </body>
</html>
