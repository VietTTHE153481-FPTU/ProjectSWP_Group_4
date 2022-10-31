<%-- 
    Document   : chatchituwu
    Created on : Oct 31, 2022, 8:19:50 AM
    Author     : Minhm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <style>
            body{
                margin-top:20px;
            }

            .chat-online {
                color: #34ce57
            }

            .chat-offline {
                color: #e4606d
            }

            .chat-messages {
                display: flex;
                flex-direction: column;
                max-height: 800px;
                overflow-y: scroll
            }

            .chat-message-left,
            .chat-message-right {
                display: flex;
                flex-shrink: 0
            }

            .chat-message-left {
                margin-right: auto
            }

            .chat-message-right {
                flex-direction: row-reverse;
                margin-left: auto
            }
            .py-3 {
                padding-top: 1rem!important;
                padding-bottom: 1rem!important;
            }
            .px-4 {
                padding-right: 1.5rem!important;
                padding-left: 1.5rem!important;
            }
            .flex-grow-0 {
                flex-grow: 0!important;
            }
            .border-top {
                border-top: 1px solid #dee2e6!important;
            }
        </style>
    </head>
    <%@include file  = "layout/Header.jsp"%>




    <div class="container border-0" style="padding-top: 1000px">

        <h1 class="h3 mb-3">Messages</h1>
        
        <div class="card">
            <div class="row g-0">
                <div class="col-12 col-lg-5 col-xl-3 border-right">

                    <div class="px-4 d-none d-md-block">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <input type="text" class="form-control my-3" placeholder="Search...">
                            </div>
                        </div>
                    </div>


                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src="resources/img/user_no-frame.png" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Vanessa Tucker

                                </div>
                            </div>
                        </a>


                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="William Harris" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    William Harris

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Sharon Lessman

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Christina Mason" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Christina Mason

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Fiona Green" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Fiona Green

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Doris Wilder" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Doris Wilder

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Haley Kennedy" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Haley Kennedy

                                </div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Jennifer Chang" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    Jennifer Chang

                                </div>
                            </div>
                        </a>

                        <hr class="d-block d-lg-none mt-1 mb-0">
                        </div>
                        <div class="col-12 col-lg-7 col-xl-9">
                            <div class="py-2 px-4 border-bottom d-none d-lg-block" style="background-color: #717fe0">
                                <div class="d-flex align-items-center py-1">
                                    <div class="position-relative">
                                        <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <strong>Sharon Lessman</strong>

                                    </div>

                                </div>
                            </div>

                            <div class="position-relative">
                                <div class="chat-messages p-4">

                                    <div class="chat-message-right pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:33 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Lorem ipsum dolor sit amet, vis erat denique in, dicunt prodesset te vix.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:34 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Sit meis deleniti eu, pri vidit meliore docendi ut, an eum erat animal commodo.
                                        </div>
                                    </div>

                                    <div class="chat-message-right mb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:35 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Cum ea graeci tractatos.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:36 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Sed pulvinar, massa vitae interdum pulvinar, risus lectus porttitor magna, vitae commodo lectus mauris et velit.
                                            Proin ultricies placerat imperdiet. Morbi varius quam ac venenatis tempus.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:37 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Cras pulvinar, sapien id vehicula aliquet, diam velit elementum orci.
                                        </div>
                                    </div>

                                    <div class="chat-message-right mb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:38 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Lorem ipsum dolor sit amet, vis erat denique in, dicunt prodesset te vix.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:39 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Sit meis deleniti eu, pri vidit meliore docendi ut, an eum erat animal commodo.
                                        </div>
                                    </div>

                                    <div class="chat-message-right mb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:40 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Cum ea graeci tractatos.
                                        </div>
                                    </div>

                                    <div class="chat-message-right mb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:41 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Morbi finibus, lorem id placerat ullamcorper, nunc enim ultrices massa, id dignissim metus urna eget purus.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:42 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Sed pulvinar, massa vitae interdum pulvinar, risus lectus porttitor magna, vitae commodo lectus mauris et velit.
                                            Proin ultricies placerat imperdiet. Morbi varius quam ac venenatis tempus.
                                        </div>
                                    </div>

                                    <div class="chat-message-right mb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:43 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">You</div>
                                            Lorem ipsum dolor sit amet, vis erat denique in, dicunt prodesset te vix.
                                        </div>
                                    </div>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2">2:44 am</div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1">Sharon Lessman</div>
                                            Sit meis deleniti eu, pri vidit meliore docendi ut, an eum erat animal commodo.
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="flex-grow-0 py-3 px-4 border-top">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Type your message">
                                    <button class="btn btn-primary">Send</button>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.2.1.min.js"></script> 
        <script type="text/javascript">
            //          function load(){
            //              window.location="chatchituwu.jsp";
            //          }
            //    setInterval(load, 10000);
        </script> 
</html>

