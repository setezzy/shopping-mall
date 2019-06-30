<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>

<jsp:include page="/WEB-INF/layouts/admin_header.jsp" />

<div class="page-main user-main">
    <div class="container-fluid">
        <div class="row">
            <div class="span4">
                <div class="uc-box uc-sub-box">
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">用户管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="javascript:void(0);" id="admin_user" onclick="check_admin()">用户</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">商品管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="${zzy}/admin/product">商城商品</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">订单管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="${zzy}/admin/orders">商城订单</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="span16">
        <div class="uc-box uc-main-box">
            <div class="uc-content-box">
                    <div class="portal-main clearfix">
                        <div class="user-card">
                            <h2 class="username">Hi, ${sessionScope.admin.uname}</h2>
                            <p></p>
                            <p></p>
                            <h2 class="username">欢迎来到网上商城后台管理系统</h2>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>


<footer>
<script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
<script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

<script src="${zzysta}/js/zySearch.js"></script>
<script src="${zzysta}/js/jump.js"></script>
<script src="${zzysta}/js/base.js"></script>
<script src="${zzysta}/js/main.js"></script>
<script src="${zzysta}/js/list.js"></script>
<script src="${zzysta}/js/myapp.js"></script>

<script src="${zzysta}/js/admin.js"></script>
<script src="${zzysta}/common/layer/layer.js"></script>
</footer>
</body>
</html>
