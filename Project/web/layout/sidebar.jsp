<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav id="sidebar">
    <div id="dismiss">
        <i class="fa fa-arrow-left mr-2"></i>
    </div>
    <div class="sidebar-header">
        <h3>LeventShop</h3>
    </div>
    <ul class="list-unstyled components">
        <li>
            <a href="home">Home &nbsp;<i class="fa fa-home"></i></a>
        </li>
        <li>
            <a href="mktdashboard">Dashboard &nbsp;<i class="fa fa-dashboard"></i></a>
        </li>
        <li>
            <a href="ManageOrder">Manage Order &nbsp;<i class="fa fa-cart-plus"></i></i></a>
        </li>
        <li>
            <a href="ManageProduct">Manage Product &nbsp;<i class="fa fa-product-hunt"></i></a>
        </li>
        <li>
            <a href="ManageBlog">Manage Blog &nbsp;<i class="fa fa-newspaper-o"></i></a>
        </li>
        <li>
            <a href="#">Manage Feedback &nbsp;<i class="fa fa-reply-all"></i></a>
        </li>
    </ul>
    <ul class="list-unstyled CTAs">
        <li><a href="logout" class="download">Log out</a></li>
    </ul>
</nav>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                <i class="glyphicon glyphicon-align-left"></i>
                <span>Show control panel</span>
            </button>
        </div>
        <span>&nbsp;Hello, ${account.fullname}</span>
    </div>
</nav>