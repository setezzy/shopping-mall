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
            <div class="uc-content-box">
                <div class="box-hd">
                    <h1 class="title">我的订单</h1>
                    <div class="more clearfix">
                        <ul class="filter-list">
                            <li class="first ${orderVO.ostate eq 0 ? 'active':''}"><a href="${zzy}/uc/order/list?ostate=0" data-type="0">全部有效订单</a></li>
                            <li class="first ${orderVO.ostate eq 1 ? 'active':''}"><a id="J_unpaidTab" href="${zzy}/uc/order/list?ostate=1" data-type="1">已提交</a></li>
                            <li class="first ${orderVO.ostate eq 2 ? 'active':''}"><a id="J_sendTab" href="${zzy}/uc/order/list?ostate=2" data-type="2">待收货</a></li>
                            <li class="first ${orderVO.ostate eq 3 ? 'active':''}"><a href="${zzy}/uc/order/list?ostate=3" data-type="3">已拒绝</a></li>
                            <li class="first ${orderVO.ostate eq 4 ? 'active':''}"><a href="${zzy}/uc/order/list?ostate=4" data-type="4">已关闭</a></li>
                        </ul>
                        <form id="J_orderSearchForm" class="search-form clearfix" action="" method="get">
                            <label for="J_orderSearchKeywords" class="hide">搜索</label>
                            <input class="search-text" type="search" id="J_orderSearchKeywords" name="search" value="${search}" autocomplete="off" placeholder="输入商品名称/商品编号/订单号" />
                            <input type="hidden" name="type" value="4" />
                            <input type="submit" class="search-btn iconfont" value="搜索" />
                        </form>
                    </div>
                </div>
                <div class="box-bd">
                    <div id="J_orderList">
                        <ul class="order-list">
                            <c:forEach items="${orderVOList}" var="orderVO">
                                <c:if test="${orderVO.ostate eq 1}">
                                    <li class="uc-order-item uc-order-item-pay">
                                        <div class="order-detail">
                                            <div class="order-summary">
                                                <div class="order-status">已提交</div>
                                                <p class="order-desc J_deliverDesc"> 等待后台确认 </p>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main"> <p class="caption-info">
                                                        <fmt:formatDate value="${orderVO.odate}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">| </span> 订单号： <a href="${zzy}/uc/order/${orderVO.onumber}">${orderVO.onumber}</a></p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.oprice}</span>元</p>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items"><ul class="goods-list">
                                                        <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                                            <li>
                                                                <div class="figure figure-thumb"> <a href="${zzy}/detail/${orderProduct.pnumber}" target="_blank">
                                                                    <img src="${zzyimg}/${orderProduct.image}" width="60" height="60" alt="${orderProduct.pname}&nbsp;&nbsp;" title="${orderProduct.pname}"> </a> </div>
                                                                <p class="name"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}">
                                                                        ${orderProduct.pname}</a> </p>
                                                                <p class="price">${orderProduct.price}&nbsp;&nbsp;元 × &nbsp;&nbsp; 1 </p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions"><a class="btn btn-small btn-primary" href="${zzy}/buy/confirm/${orderVO.onumber}" target="_blank">立即支付</a> <a class="btn btn-small btn-line-gray" href="${zzy}/uc/order/${orderVO.onumber}">订单详情</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${orderVO.ostate eq 2 }">
                                    <li class="uc-order-item uc-order-item-shipping">
                                        <div class="order-detail">
                                            <div class="order-summary">
                                                <div class="order-status">待发货</div>
                                                <p class="order-desc J_deliverDesc"> 我们将尽快为您发货 </p>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main"> <p class="caption-info">
                                                        <fmt:formatDate value="${orderVO.odate}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">|</span> 订单号： <a href="${zzy}/uc/order/${orderVO.onumber}">${orderVO.onumber}</a></p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.oprice}</span>元</p>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items"><ul class="goods-list">
                                                        <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                                            <li>
                                                                <div class="figure figure-thumb"> <a href="${zzy}/detail/${orderProduct.pnumber}" target="_blank"> <img src="${zzyimg}/${orderProduct.image}" width="60" height="60" alt="${orderProduct.pname}" title="${orderProduct.pname}"> </a> </div>
                                                                <p class="name"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}">${orderProduct.pname}</a> </p>
                                                                <p class="price">${orderProduct.price}元 × 1</p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${zzy}/uc/order/${orderVO.onumber}">订单详情</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${orderVO.ostate eq 3}">
                                    <li class="uc-order-item uc-order-item-finish">
                                        <div class="order-detail">
                                            <div class="order-summary">
                                                <div class="order-status">已拒绝</div>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main"> <p class="caption-info">
                                                        <fmt:formatDate value="${orderVO.odate}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">|</span> 订单号： <a href="${zzy}/uc/order/${orderVO.onumber}">${orderVO.onumber}</a></p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.oprice}</span>元</p>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items"><ul class="goods-list">
                                                        <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                                            <li>
                                                                <div class="figure figure-thumb"> <a href="${zzy}/detail/${orderProduct.pnumber}" target="_blank"> <img src="${zzyimg}/${orderProduct.image}" width="60" height="60" alt="${orderProduct.pname}" title="${orderProduct.pname}"> </a> </div>
                                                                <p class="name"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}">${orderProduct.pname}</a> </p>
                                                                <p class="price">${orderProduct.price}元 × 1</p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${zzy}/uc/order/${orderVO.onumber}">订单详情</a> <a class="btn btn-small btn-line-gray" href="" target="_blank">申请售后</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${orderVO.ostate eq 4 }">
                                    <li class="uc-order-item uc-order-item-finish">
                                        <div class="order-detail">
                                            <div class="order-summary">
                                                <div class="order-status">已关闭</div>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main"> <p class="caption-info">
                                                        <fmt:formatDate value="${orderVO.odate}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">|</span> 订单号： <a href="${zzy}/uc/order/${orderVO.onumber}">${orderVO.onumber}</a></p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.oprice}</span>元</p>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items"><ul class="goods-list">
                                                        <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                                            <li>
                                                                <div class="figure figure-thumb"> <a href="${zzy}/detail/${orderProduct.pnumber}" target="_blank"> <img src="${zzyimg}/${orderProduct.image}" width="60" height="60" alt="${orderProduct.pname}" title="${orderProduct.pname}"> </a> </div>
                                                                <p class="name"> <a target="_blank" href="${zzy}/detail/${orderProduct.pnumber}">${orderProduct.pname}</a> </p>
                                                                <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${zzy}/uc/order/${orderVO.onumber}">订单详情</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="J_orderListPages">
                        <c:if test="${pageInfo.total gt pageInfo.limit and not empty orderVOList}">
                            <div id="pager" data-pager-href="${zzy}/uc/order/list?type=${ostate}&search=${search}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.current}" data-pager-total="${pageInfo.total}"></div>
                        </c:if>
                    </div>
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
    <script src="${zzysta}/js/area.js"></script>

    <script src="${zzysta}/js/order.js"></script>
    <script src="${zzysta}/common/layer/layer.js"></script>
    <!-- 分页js -->
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>
    <script type="text/javascript">
        var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
        var nowpage = $('#pager').attr('data-pager-nowpage'); // 当前页数
        var href = $('#pager').attr('data-pager-href'); // 链接地址
        $(document).ready(function() {
            $("#pager").pager({
                pagenumber : nowpage,
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
