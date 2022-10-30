<%-- 
    Document   : Footer
    Created on : Oct 2, 2022, 3:05:16 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- FOOTER --%>
<div class="newsletter">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
                    <h4>Newsletter</h4>
                    <p>Subscribe to our newsletter and get 20% off your first purchase</p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
                    <input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
                    <button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="bg3 p-t-75" style="background-color: #23242a;">
    <div class="container p-4">
        <div class="row">
            <div class="col-sm-6 col-lg-3 p-b-50">
                <h5 class="text-uppercase mb-4" style="color: #FFFFFF">
                    <i class="fa fa-shopping-bag"></i>&nbsp;&nbsp;About shop
                </h5>
                <ul class="fa-ul" style="margin-left: 1.80em;">
                    <li class="mb-3">
                        <a href="introduction" style="color: #FFFFFF">
                            <span>About US</span>
                        </a>
                    </li>
                    <li class="mb-3">
                        <a href="certificateSecu" style="color: #FFFFFF">
                            <span>Privacy Policy</span>
                        </a>
                    </li>
                    <li class="mb-3">
                        <a href="helpcenter" style="color: #FFFFFF">
                            <span>Support Center</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-6 col-lg-3 p-b-50">
                <h5 class="text-uppercase mb-4" style="color: #FFFFFF">
                    <i class="fa fa-map-o"></i>&nbsp;&nbsp;&nbsp;ADDRESS
                </h5>
                <ul class="fa-ul" style="margin-left: 1.80em;">
                    <li class="mb-3" style="color: #FFFFFF">
                        <span class="fa-li"><i class="fa fa-home"></i></span><span class="ms-2">Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</span>
                    </li>
                    <li class="mb-3" style="color: #FFFFFF">
                        <span class="fa-li"><i class="fa fa-envelope"></i></span><span class="ms-2">LeventsShope@gmail.com</span>
                    </li>
                    <li class="mb-3" style="color: #FFFFFF">
                        <span class="fa-li"><i class="fa fa-phone"></i></span><span class="ms-2">+84 123456789</span>
                    </li>
                </ul>
            </div>
            <div class="col-sm-6 col-lg-3 p-b-50">
                <ul class="fa-ul" style="margin-right: 1.80em;">
                    <h5 class="text-uppercase mb-4" style="color: #FFFFFF">&nbsp;&nbsp;FOLLOW US</h5>
                    <li class="mb-3" style="color: #FFFFFF">
                        &nbsp;<span class="fa-li"><i class="fa fa-facebook-f"></i></span><span class="ms-2">Facebook</span>
                    </li>
                    <li class="mb-3" style="color: #FFFFFF">
                        &nbsp;<span class="fa-li"><i class="fa fa-instagram"></i></span><span class="ms-2">Instagram</span>
                    </li>
                    <li class="mb-3" style="color: #FFFFFF">
                        &nbsp;<span class="fa-li"><i class="fa fa-google"></i></span><span class="ms-2">Google</span>
                    </li>
                </ul>
            </div>
            <div class="col-sm-6 col-lg-3 p-b-50"> 
                <h4 class="text-uppercase mb-4" style="color: #FFFFFF">
                    <i class="fa fa-clock-o" style="color: #FFFFFF"></i>&nbsp;Opening hours
                </h4>
                <table class="table text-white">
                    <tbody class="font-weight-normal">
                        <tr>
                            <td>Mon - Thurs:</td>
                            <td>8AM - 9PM</td>
                        </tr>
                        <tr>
                            <td>Fri - Sat:</td>
                            <td>8AM - 10PM</td>
                        </tr>
                        <tr>
                            <td>Sunday:</td>
                            <td>9AM - 10PM</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); color: #FFFFFF">
        © 2021 Copyright:
        <a class="text-white" href="#">SWP391 - GRP4</a>
    </div>
</footer>
<%-- FOOTER --%>
