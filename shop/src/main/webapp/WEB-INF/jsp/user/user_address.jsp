<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>我的收货地址</title>
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
                <h1 class="title">收货地址</h1>
                <div class="more clearfix hide">
                    <ul class="filter-list J_addrType">
                        <li class="first active"><a href="">普通收货地址</a></li>
                    </ul>
                </div>
            </div>
            <div class="box-bd">
                <div class="user-address-list J_addressList clearfix">
                    <div class="address-item address-item-new" id="J_newAddress"> <i class="iconfont"><i class="glyphicon glyphicon-plus"></i></i> 添加新地址 </div>
                    <!--展示user所有收货地址-->
                    <c:forEach items="${addresses}" var="address">
                        <div class="address-item J_addressItem" data-address_id="${address.addrid}" data-consignee="${address.uname}" data-tel="${address.phone}" data-address="${address.address}" >
                            <dl>
                                <dt> <em class="uname">${address.uname}</em> </dt>
                                <dd class="utel">${address.phone}</dd>
                                <dd class="uaddress"><br />
                                        ${address.address} </dd>
                            </dl>
                            <div class="actions"> <div class="modify J_addressModify" id="J_addressModify" data-id="${address.addrid}">修改</div> <div class="modify J_addressDel"  id="J_addressDel" onclick="address_delete(this,${address.addrid})" data-id="${address.addrid}">删除</div> </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="xm-pagenavi">
                    <c:if test="${pageInfo.total gt pageInfo.limit and not empty addresses}">
                        <div id="pager" data-pager-href="${zzy}/uc/user/address?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
                    </c:if>
                </div>
                <!--点击弹出新增收货地址界面-->
                <div class="address-edit-box" id="J_edit">
                    <div class="box-main">
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" id="uname" name="uname" placeholder="收货人姓名">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" maxlength="11" id="phone" name="phone" placeholder="手机号">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <textarea class="input-text J_addressInput" type="text" id="address" name="address" placeholder="详细地址"></textarea>
                            <p class="tip-msg tipMsg"></p>
                        </div>
                    </div>
                    <div class="form-confirm clearfix">
                        <input class="input-text J_addressInput" type="hidden" id="addrid" name="addrid">
                        <div class="btn btn-primary" id="J_save" >保存</div>
                        <div class="btn btn-gray" id="J_cancel">取消</div>
                    </div>
                </div>
                <!--新增收货地址界面end-->
                <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"> </div>
            </div>
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
    <script type="text/javascript">
        var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
        var current = $('#pager').attr('data-pager-current'); // 当前页数
        var href = $('#pager').attr('data-pager-href'); // 链接地址
        $(document).ready(function() {
            $("#pager").pager({
                pagenumber : current,
                pagecount : pagecount,
                buttonClickCallback : PageClick
            });
        });
        PageClick = function(number) {
            $("#pager").pager({
                pagenumber : number,
                pagecount : pagecount,
                buttonClickCallback : PageClick
            });
            window.location.href = href + number;
        }
    </script>
    </footer>
</body>
</html>
