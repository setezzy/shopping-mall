<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>更改用户角色</title>
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
                                <li><a href="${zzy}/admin/order">商城订单</a></li>
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
                <div class="form-section">
                    <tr>
                        <td>用户角色：</td>
                        <td><select id="admin_role" name="admin_role">
                            <option value="">请选择</option>
                                <option value="1">系统管理员</option>
                                <option value="2">销售商</option>
                        </select>
                        </td>
                    </tr>
                </div>

                <div class="form-confirm clearfix">
                    <div class="btn btn-primary" id="user_modify" name="user_modify" user-id="${uid}">保存</div>
                    <a class="btn btn-gray" id="modify_cancel" name="modify_cancel" href="javascript:history.back(-1)">取消</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<footer>
    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

    <script src="${zzysta}/js/admin.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/common/layer/layer.js"></script>
</footer>
</html>
