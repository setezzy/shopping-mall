<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>我的订单</title>
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
            <div class="uc-content-box order-view-box">
                <div class="box-hd">
                    <h1 class="title"><span class="text">订单详情</span></h1>
                    <div class="more clearfix">
                        <h2 class="subtitle">订单号：${orderVO.onumber} <span class="tag tag-subsidy"></span> </h2>
                        <div class="actions">
                            <c:if test="${orderVO.ostate eq 1}"> <a id="J_cancelOrder" class="btn btn-small btn-line-gray" title="取消订单" data-order-id="${orderVO.onumber}" href="javascript:;" data-confirm="你真的要取消此订单吗?">取消订单</a></c:if>
                        </div>
                    </div>
                </div>
                <div class="box-bd">
                    <div class="uc-order-item uc-order-item-finish">
                        <div class="order-detail">
                            <div class="order-summary">
                                <div class="order-status">
                                    <c:if test="${orderVO.ostate eq 1}">已提交</c:if>
                                    <c:if test="${orderVO.ostate eq 2 }">待收货</c:if>
                                    <c:if test="${orderVO.ostate eq 3 }">已拒绝</c:if>
                                    <c:if test="${orderVO.ostate eq 4 }">已关闭</c:if>
                                </div>
                                <div class="order-progress">
                                    <ol class="progress-list clearfix">
                                        <c:set var="status" value="false"/>
                                        <c:set var="info"/>
                                        <c:forEach items="${orderVO.orderStates}" var="orderStates">
                                            <c:if test="${orderStates.ostate eq 1}">
                                                <c:set var="status" value="true"/>
                                                <c:set var="info" value="${orderVO.odate}"/>
                                            </c:if>
                                        </c:forEach>
                                        <li class="step step-first ${status == true ? 'step-done':''}">
                                            <div><span class="text">已提交</span></div>
                                            <div class="info">
                                                <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                                            </div>
                                        </li>
                                        <c:set var="status" value="false"/>
                                        <c:set var="info"/>
                                        <c:forEach items="${orderVO.orderStates}" var="orderStates">
                                            <c:if test="${orderStates.ostate eq 2}">
                                                <c:set var="status" value="true"/>
                                                <c:set var="info" value="${orderVO.odate}"/>
                                            </c:if>
                                        </c:forEach>
                                        <li class="step ${status == true ? 'step-done':''}">
                                            <div><span class="text">待收货</span></div>
                                            <div class="info">
                                                <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                                            </div>
                                        </li>
                                        <c:set var="status" value="false"/>
                                        <c:set var="info"/>
                                        <c:forEach items="${orderVO.orderStates}" var="orderStates">
                                            <c:if test="${orderStates.ostate eq 3}">
                                                <c:set var="status" value="true"/>
                                                <c:set var="info" value="${orderVO.odate}"/>
                                            </c:if>
                                        </c:forEach>
                                        <li class="step ${status == true ? 'step-done':''}">
                                            <div><span class="text">已拒绝</span></div>
                                            <div class="info">
                                                <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                                            </div>
                                        </li>
                                        <c:set var="status" value="false"/>
                                        <c:set var="info"/>
                                        <c:forEach items="${orderVO.orderStates}" var="orderStates">
                                            <c:if test="${orderStates.ostate eq 4}">
                                                <c:set var="status" value="true"/>
                                                <c:set var="info" value="${orderVO.odate}"/>
                                            </c:if>
                                        </c:forEach>
                                        <li class="step step-last ${status == true ? 'step-done':''}">
                                            <div><span class="text">已关闭</span></div>
                                            <div class="info">
                                                <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                                            </div>
                                        </li>
                                    </ol>
                                </div>
                            </div>

                            <table class="order-items-table">
                                <tbody>
                                <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                    <tr>
                                        <td class="col col-thumb"><div class="figure figure-thumb"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}" data-stat-id="${orderProduct.pnumber}"> <img src="${zzyimg}/${orderProduct.image}" width="80" height="80" alt="${orderProduct.pname}"> </a> </div></td>
                                        <td class="col col-name"><p class="name"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}" data-stat-id="${orderProduct.pnumber}">${orderProduct.pname}</a> </p></td>
                                        <td class="col col-price"><p class="price">${orderProduct.price}元 × 1</p></td>
                                        <td class="col col-actions"></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="editAddr" class="order-detail-info">
                            <h3>收货信息</h3>
                            <table class="info-table">
                                <tbody>
                                <tr>
                                    <th>姓名：</th>
                                    <td>${orderVO.orderShipment.uname}</td>
                                </tr>
                                <tr>
                                    <th>联系电话：</th>
                                    <td>${orderVO.orderShipment.phone}</td>
                                </tr>
                                <tr>
                                    <th>收货地址：</th>
                                    <td>&nbsp;${orderVO.orderShipment.address}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="order-detail-total">
                            <table class="total-table">
                                <tbody>
                                <tr>
                                    <th class="total">订单金额：</th>
                                    <td class="total"><span class="num">${orderVO.oprice}</span>元</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div>
                            &nbsp; <br>
                            &nbsp; <br>
                            &nbsp; <br>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal-backdrop in" style="display: none; width: 100%; height: 1854px;"></div>

<footer>
    <jsp:include page="/WEB-INF/layouts/footer.jsp" />

    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

    <script src="${zzysta}/common/layer/layer.js"></script>
    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/area.js"></script>
    <script src="${zzysta}/js/location.js"></script>
    <script src="${zzysta}/js/select2.js"></script>
    <script src="${zzysta}/js/select2_locale_zh-CN.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>
    <script src="${zzysta}/js/address.js"></script>
    <script src="${zzysta}/js/order.js"></script>
</footer>

</body>
</html>
