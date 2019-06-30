<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>添加用户</title>
    <link rel="stylesheet" href="${zzysta}/css/address.css">
    <link rel="stylesheet" href="${zzysta}/css/select2.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
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
                                <li><a id="admin_user" href="${zzy}/admin/user/list">用户</a></li>
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
            <div class="box-main">
                <div class="form-section">
                    <input class="input-text J_addressInput" type="text" id="new_uname" name="new_uname" placeholder="用户名">
                    <p class="tip-msg tipMsg"></p>
                </div>
                <div class="form-section">
                    <input class="input-text J_addressInput" type="text" id="new_psw" name="new_psw" placeholder="密码">
                    <p class="tip-msg tipMsg"></p>
                </div>
            </div>
            <div class="form-confirm clearfix">
                <div class="btn btn-primary" id="user_save" name="user_save">保存</div>
                <a class="btn btn-gray" id="user_cancel" name="user_cancel" href="javascript:history.back(-1)">取消</a>
            </div>
        </div>
    </div>
    </div>
</div>

<footer>

    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

    <script src="${zzysta}/js/admin.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>

    <script src="${zzysta}/common/layer/layer.js"></script>
    <!-- 分页js -->
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>

</footer>

</body>
</html>
