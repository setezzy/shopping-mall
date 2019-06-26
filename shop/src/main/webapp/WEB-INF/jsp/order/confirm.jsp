<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>订单确认</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/address.css">
    <link rel="stylesheet" href="${zzysta}/css/select2.css" />
    <link rel="stylesheet" href="${zzysta}/css/checkout.css">
    <link rel="stylesheet" href="${zzysta}/css/order-confirm.css">
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/header.jsp" />
<jsp:include page="/WEB-INF/jsp/common/site_header.jsp" />

<div class="page-main page-mini-main">
    <div class="container-fluid confirm-box">
        <form target="_blank" action="#" id="J_payForm" method="post">
            <div class="section section-order">
                <div class="order-info clearfix">
                    <div class="fl">
                        <h2 class="title">订单提交成功!</h2>
                        <p class="order-time" id="J_deliverDesc">我们将尽快为您发货</p>
                        <p class="post-info" id="J_postInfo"> 收货信息：${orderShipment.uname} ${orderShipment.phone}&nbsp;&nbsp;
                            &nbsp;&nbsp;${orderShipment.address} </p>
                    </div>
                    <div class="fr">
                        <p class="total"> 应付总额：<span class="money"><em>${order.oprice }</em>元</span> </p>
                        <a class="show-detail" id="J_showDetail">订单详情&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
                </div>
                <i class="iconfont icon-right">&#x221a;</i>
                <div class="order-detail">
                    <ul>
                        <li class="clearfix">
                            <div class="label">订单号：</div>
                            <div class="content"> <span class="order-num"> ${order.onumber } </span> </div>
                        </li>
                        <li class="clearfix">
                            <div class="label">收货信息：</div>
                            <div class="content"> ${orderShipment.uname} ${orderShipment.phone}&nbsp;&nbsp;
                                &nbsp;&nbsp;${orderShipment.address} </div>
                        </li>
                        <li class="clearfix">
                            <div class="label">商品名称：</div>
                            <div class="content">
                                <c:forEach items="${orderProducts}" var="orderProduct"> ${orderProduct.pname} <br>
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </form>
    </div>
</div>

<footer>
    <jsp:include page="/WEB-INF/layouts/footer.jsp" />

    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="${zzysta}/js/order.js"></script>
    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>
    <script src="${zzysta}/common/layer/layer.js"></script>

</footer>

</body>
</html>
