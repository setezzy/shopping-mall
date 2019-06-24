<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/header.jsp" />

<!--  导航栏  -->
<div class="breadcrumbs">
    <div class="container-fluid"> <a href="${zzy}/index">首页</a><span class="sep">&gt;</span><span class="title"></span> </div>
</div>

<div class="page-main user-main">
    <div class="container-fluid">
        <div class="row">
            <div class="span4">
                <div class="uc-box uc-sub-box">
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">订单中心</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="${zzy}/uc/order/list">我的订单</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">收货管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="${zzy}/uc/user/address">收货地址</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">账户管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="${zzy}/uc/user/info">修改密码</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="span16">
        <!--<div class="protal-content-update hide">
        <div class="protal-username"> <p>Hi,</p> <span class="name">${user.uname}</span> </div>
    </div>-->
        <div class="uc-box uc-main-box">
            <div class="uc-content-box portal-content-box">
                <div class="box-bd">
                    <div class="portal-main clearfix">
                        <div class="user-card">
                            <h2 class="username">Hi, ${sessionScope.user.uname}</h2>
                            <!--<p class="tip">你好</p>-->
                            <a class="link" href="${zzy}/uc/user/info">修改密码 &gt;</a>
                            <img class="avatar" src="${zzysta}/imgs/avatar.png" width="160" height="160" alt="${sessionScope.user.uname}">
                        </div>
                        <div class="user-actions">
                            <ul class="action-list">
                                <li>账户安全度：<span class="level level-3">较高</span></li>
                                <li>绑定手机号：<span class="tel">${sessionScope.user.phone}</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="portal-sub">
                        <ul class="info-list clearfix">
                            <li>
                                <h3>待支付订单：<span class="num">0</span></h3>
                                <a href="${zzy}/uc/order/list?type=1">查看待支付订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${zzysta}/imgs/portal-1.png" alt=""> </li>
                            <li>
                                <h3>待收货订单：<span class="num">0</span></h3>
                                <a href="${zzy}/uc/order/list?type=2">查看待收货订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${zzysta}/imgs/portal-2.png" alt=""> </li>
                            <li>
                                <h3>已拒绝订单：<span class="num">0</span></h3>
                                <a href="${zzy}/uc/order/list?type=3">查看已拒绝订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${zzysta}/imgs/portal-3.png" alt="">
                            </li>
                            <li>
                                <h3>已关闭订单：<span class="num">0</span></h3>
                                <a href="${zzy}/uc/order/list?type=3">查看已关闭订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${zzysta}/imgs/portal-4.png" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>




<jsp:include page="/WEB-INF/layouts/footer.jsp" />

<script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
<script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

<script src="${zzysta}/js/zySearch.js"></script>
<script src="${zzysta}/js/jump.js"></script>
<script src="${zzysta}/js/base.js"></script>
<script src="${zzysta}/js/main.js"></script>
<script src="${zzysta}/js/list.js"></script>
<script src="${zzysta}/js/myapp.js"></script>

</body>
</html>
