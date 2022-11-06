<%-- 
    Document   : Notify
    Created on : Nov 6, 2022, 5:37:50 PM
    Author     : Minhm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/css/style.css">
        <link rel="stylesheet" type="text/css" href="styles/css/queries.css">
        <link rel="stylesheet" type="text/css" href="styles/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/css/search.css"/>
        <style type="text/css">
            body{
                background-color: #fcfcfc;
            }

            .row{
                margin:auto;
                padding: 30px;
                width: 80%;
                display: flex;
                flex-flow: column;
                .card{
                    width: 100%;
                    margin-bottom: 5px;
                    display: block;
                    transition: opacity 0.3s;
                }
            }


            .card-body{
                padding: 0.5rem;
                table{
                    width: 100%;
                    tr{
                        display:flex;
                        td{
                            a.btn{
                                font-size: 0.8rem;
                                padding: 3px;
                            }
                        }
                        td:nth-child(2){
                            text-align:right;
                            justify-content: space-around;
                        }
                    }
                }

            }

            .card-title:before{
                display:inline-block;
                font-family: 'Font Awesome\ 5 Free';
                font-weight:900;
                font-size: 1.1rem;
                text-align: center;
                border: 2px solid grey;
                border-radius: 100px;
                width: 30px;
                height: 30px;
                padding-bottom: 3px;
                margin-right: 10px;
            }

            .notification-invitation {
                .card-body {
                    .card-title:before {
                        color: #90CAF9;
                        border-color: #90CAF9;
                        content: "\f007";
                    }
                }
            }

            .notification-warning {
                .card-body {
                    .card-title:before {
                        color: #FFE082;
                        border-color: #FFE082;
                        content: "\f071";
                    }
                }
            }

            .notification-danger {
                .card-body {
                    .card-title:before {
                        color: #FFAB91;
                        border-color: #FFAB91;
                        content: "\f00d";
                    }
                }
            }

            .notification-reminder {
                .card-body {
                    .card-title:before {
                        color: #CE93D8;
                        border-color: #CE93D8;
                        content: "\f017";
                    }
                }
            }

            .card.display-none{
                display: none;
                transition: opacity 2s;
            }


        </style>
    </head>
    <%@include file="layout/Header.jsp" %>
    <div class="container-fluid" style="padding-top: 200px">
<!--        <div class="row notification-container" >
            <h2 class="text-center">My Notifications</h2>
            <p class="dismiss text-right"><a id="dismiss-all" href="#">Dimiss All</a></p>
            <div class="card notification-card notification-invitation">
                <div class="card-body">
                    <table>
                        <tr>
                            <td style="width:70%"><div class="card-title">Jane invited you to join '<b>Familia</b>' group</div></td>
                            <td style="width:30%">
                                <a href="#" class="btn btn-primary">View</a>
                                <a href="#" class="btn btn-danger dismiss-notification">Dismiss</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="card notification-card notification-warning">
                <div class="card-body">
                    <table>
                        <tr>
                            <td style="width:70%"><div class="card-title">Your expenses for '<b>Groceries</b>' has exceeded its budget</div></td>
                            <td style="width:30%">
                                <a href="#" class="btn btn-primary">View</a>
                                <a href="#" class="btn btn-danger dismiss-notification">Dismiss</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="card notification-card notification-danger">
                <div class="card-body">
                    <table>
                        <tr>
                            <td style="width:70%"><div class="card-title">Insufficient budget to create '<b>Clothing</b>' budget category</div></td>
                            <td style="width:30%">
                                <a href="#" class="btn btn-primary">View</a>
                                <a href="#" class="btn btn-danger dismiss-notification">Dismiss</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>-->


            <div class="container-fluid">
                <hr>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header">
                                <span><i class="fa fa-table me-2"></i></span> Notifications
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped data-table" style="width: 100%">
                                        <thead>
                                            <tr>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="o" items="${data}">
                                                <tr >
                                                    <td>
                                                        <div class="card notification-card notification-reminder">
                                                            <div class="card-body">
                                                                <table>
                                                                    <tr>
                                                                        <td style="width:100%"><div class="card-title">${o.getContent()}</div></td>
                                                                        <td style="width:50%">
                                                                            <a href="orderdetails?id=+${o.getOid()}" class="btn btn-primary">ToOrderDetail</a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
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


<!--        </div> -->
    </div>

</html>
