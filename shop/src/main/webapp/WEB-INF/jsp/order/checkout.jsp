<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>提交订单</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/address.css">
    <link rel="stylesheet" href="${zzysta}/css/select2.css" />
    <link rel="stylesheet" href="${zzysta}/css/checkout.css">
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/header.jsp" />
<jsp:include page="/WEB-INF/jsp/common/site_header.jsp" />

<div class="page-main">
    <div class="container-fluid">
        <div class="checkout-box">
            <div class="section section-address">
                <div class="section-header clearfix">
                    <h3 class="title">收货地址</h3>
                </div>
                <div class="section-body clearfix" id="J_addressList">
                    <c:forEach items="${addresses}" var="address">
                        <div class="address-item J_addressItem" data-address_id="${address.addrid}" data-consignee="${address.uname}" data-tel="${address.phone}" data-address="${address.address}" >
                            <dl>
                                <dt> <em class="uname">${address.uname}</em> </dt>
                                <dd class="utel"> ${address.phone} </dd>
                                <dd class="uaddress"> <br>
                                        ${address.address}  </dd>
                            </dl>
                            <div class="actions"> <a class="modify J_addressModify" id="J_addressModify">修改</a> </div>
                        </div>
                    </c:forEach>
                    <div class="address-item address-item-new" id="J_newAddress"> <i class="iconfont"><i class="glyphicon glyphicon-plus"></i></i> 添加新地址 </div>
                </div>
                <!--点击弹出新增/收货地址界面start-->
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
            <div class="section section-options section-payment clearfix">
                <div class="section-header">
                    <h3 class="title">支付方式</h3>
                </div>
                <div class="section-body clearfix">
                    <ul class="J_optionList options ">
                        <li data-type="pay" class="J_option selected" data-value="1"> 暂未开通该功能~~敬请期待 </li>
                    </ul>
                </div>
            </div>

            <div class="section section-goods">
                <div class="section-header clearfix">
                    <h3 class="title">商品</h3>
                </div>
                <div class="section-body">
                    <ul class="goods-list" id="J_goodsList">
                        <div class="col col-img"> <img src="${zzyimg}/${product.image}" alt="${product.pname}" width="30" height="30"> </div>
                        <div class="col col-name"> ${product.pname} </div>
                        <div class="col col-price"> ${product.price}元 </div>
                    </ul>
                </div>
            </div>

            <div class="section section-count clearfix">
                <div class="money-box" id="J_moneyBox">
                    <ul>
                        <li class="clearfix">
                            <label>商品件数：</label>
                            <span class="val"> 1 件</span> </li>
                        <li class="clearfix">
                            <label>金额合计：</label>
                            <span class="val">${product.price}元</span> </li>
                    </ul>
                </div>
            </div>
            <div class="section-bar clearfix">
                <div class="fl"> </div>
                <div class="fr"> <a class="btn btn-primary" id="J_checkoutToPay">结算</a> </div>
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
    <!-- 地址选择 -->
    <script src="${zzysta}/js/area.js"></script>
    <script src="${zzysta}/js/location.js"></script>
    <script src="${zzysta}/js/select2.js"></script>
    <script src="${zzysta}/js/select2_locale_zh-CN.js"></script>
    <script src="${zzysta}/js/address.js"></script>
    <script src="${zzysta}/js/checkout.js"></script>
</footer>

</body>
</html>
