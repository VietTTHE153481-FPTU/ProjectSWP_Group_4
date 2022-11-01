<%-- 
    Document   : chat
    Created on : Oct 31, 2022, 2:51:29 PM
    Author     : Minhm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <div class="container border-0" style="padding-top: 159px" >
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
                    <c:forEach items="${requestScope.chatnavi}" var="navi">
                        <a href="ChatServlet?gid=${navi.getGroup_ID()}" class="list-group-item list-group-item-action border-0">
                            <div class="d-flex align-items-start">
                                <img src="resources/img/user_no-frame.png" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
                                <div class="flex-grow-1 ml-3">
                                    <c:choose>
                                        <c:when test="${navi.getName()==null}">
                                            Inbox to ${navi.getToUser()}
                                        </c:when>
                                        <c:otherwise>${navi.getName()}</c:otherwise>    
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                    <div class="flex-grow-0 py-3 px-4">
                        <div class="input-group">
                            <button class="btn btn-primary ">New Groupchat</button>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-7 col-xl-9">
                    <c:if test="${requestScope.chatbox!=null}">
                        <div class="py-2 px-4 border-bottom d-none d-lg-block" style="background-color: #717fe0">
                            <div class="d-flex align-items-center py-1">
                                <div class="position-relative">
                                    <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                </div>
                                <div class="flex-grow-1 pl-3">
                                    <strong>
                                        ${sessionScope.talkingwithname}
                                    </strong>

                                </div>

                            </div>
                        </div>

                        <div class="position-relative">
                            <div class="chat-messages p-4">

                                <c:forEach items="${requestScope.chatbox.getMessagesInGroup()}" var="box">
                                    <c:choose>
                                        <c:when test="${sessionScope.account.getUserID()==box.getBy_user()}">

                                            <div class="chat-message-right pb-4">
                                                <div>
                                                    <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="" width="40" height="40">
                                                    <div class="text-muted small text-nowrap mt-2">${box.getDate()}</div>
                                                </div>
                                                <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                                    <div class="font-weight-bold mb-1">You</div>
                                                    ${box.getMessage()}
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="chat-message-left pb-4">
                                                <div>
                                                    <img src=resources/img/user_no-frame.png class="rounded-circle mr-1" alt="" width="40" height="40">
                                                    <div class="text-muted small text-nowrap mt-2">${box.getDate()}</div>
                                                </div>
                                                <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                                    <div class="font-weight-bold mb-1">${box.getUsername()}</div>
                                                    ${box.getMessage()}
                                                </div>
                                            </div>
                                        </c:otherwise>

                                    </c:choose>
                                </c:forEach>





                            </div>
                        </div>
                        <div class="flex-grow-0 py-3 px-4 border-top">
                            <form action="ChatServlet" method="post">
                                <div class="input-group">
                                    <input id="stop" type="text" class="form-control" name="text" placeholder="Type your message">
                                    <input type="text" name="room" hidden value="${requestScope.chatbox.getGroup_ID()}" >
                                    <button id="start" class="btn btn-primary">Send</button>
                                </div>

                            </form>
                        </div>
                    </c:if>


                </div>

            </div>
        </div>
    </div>
    <script src="js/jquery-3.2.1.min.js"></script> 
    <script type="text/javascript">

        var timer = null,
                interval = 3000,
                value = 0;

        $(function () {
            if (timer !== null)
                return;
            timer = setInterval(function () {
                window.location = "ChatServlet?uid=" +${sessionScope.talkingwithid};
            }, interval);
        });
        $("#start").click(function () {
            if (timer !== null)
                return;
            timer = setInterval(function () {
                value = value + 1;
                $("#input").val(value);
            }, interval);
        });
        $("#stop").click(function () {
            clearInterval(timer);
            timer = null
        });
    </script>
    <html>
