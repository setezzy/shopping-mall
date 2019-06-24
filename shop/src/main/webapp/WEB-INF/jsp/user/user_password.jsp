<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="${zzysta}/css/address.css">
    <link rel="stylesheet" href="${zzysta}/css/select2.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
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
        <div class="uc-box uc-main-box">
            <div class="uc-content-box">
                <div class="box-hd">
                    <h1 class="title">个人密码</h1>
                </div>

                    <div class="box-main">
                        <div class="form-section">
                            <p>Hi, &nbsp; ${sessionScope.user.uname}</p>
                        </div>
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" id="password" name="password" placeholder="原密码">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" id="password_new" name="password_new" placeholder="新密码">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                    </div>
                    <div class="form-confirm clearfix">
                        <div class="btn btn-primary" id="P_save" name="P_save">保存</div>
                        <div class="btn btn-gray" id="P_cancel" name="P_cancel">取消</div>
                    </div>

            </div>
            <div class="uc-content-box">
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
            </div>
        </div>
    </div>

</div>


<footer>

    <jsp:include page="/WEB-INF/layouts/footer.jsp" />

    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>

    <script src="${zzysta}/common/layer/layer.js"></script>
    <!-- 分页js -->
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>
    <!-- 地址选择 -->
    <script src="${zzysta}/js/area.js"></script>
    <script src="${zzysta}/js/location.js"></script>
    <script src="${zzysta}/js/select2.js"></script>
    <script src="${zzysta}/js/select2_locale_zh-CN.js"></script>
    <script src="${zzysta}/js/address.js"></script>
</footer>

</body>
</html>
