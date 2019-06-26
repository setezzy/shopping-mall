<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/header.jsp" />
<jsp:include page="/WEB-INF/jsp/common/site_header.jsp" />

<c:if test="${not empty product}">
    <!--  分类导航栏 -->
    <div class="breadcrumbs">
        <div class="container-fluid"><a href='${zzy}/index'>首页</a>
                <%-- <c:forEach items="${parentCategories}" var="parentCategory"><span class="sep">&gt;</span><a href="${zzy}/list?cid=${parentCategory.cid}">${parentCategory.pname}</a></c:forEach> --%>
            <span class="sep">&gt;</span><a href="${zzy}/detail/${product.pnumber}">${product.pname}</a> </div>
    </div>

    <div class="goods-detail">
    <!-- 商品简介begin-->
        <div class="goods-detail-info  clearfix J_goodsDetail">
            <div class="container-fluid">
                <div class="row">

                    <div class="span13  J_mi_goodsPic_block goods-detail-left-info">
                        <div class="goods-pic-box" id="J_mi_goodsPicBox">
                            <div class="goods-big-pic J_bigPicBlock"> <img class="J_goodsBigPic" id="J_BigPic" src="${zzyimg}/${product.image}"></div>
                        </div>
                    </div>

                    <div class="span7 goods-info-rightbox">
                        <dl class="goods-info-box ">
                            <dt class="goods-info-head">
                                <dl id="J_goodsInfoBlock">
                                    <dt id="goodsName" class="goods-name"> ${product.pname} </dt>
                                    <dd>&nbsp;</dd>
                                    <dd>&nbsp;</dd>
                                    <dd class="goods-info-head-price clearfix"> 价格：${product.price} <i>&nbsp;元</i> </dd>
                                    <dd>&nbsp;</dd>
                                    <dd>&nbsp;</dd>
                                    <dd>库存还剩：${product.amount} <i>&nbsp;件</i> </dd>
                                    <dd>&nbsp;</dd>
                                    <dd>&nbsp;</dd>
                                    <dd>&nbsp;</dd>
                                </dl>
                            </dt>
                        </dl>
                        <div class="goods-info-head-cart" id="goodsDetailBtnBox">
                            <div onclick="add_cart(this)" id="goodsDetailAddCartBtn" class="btn btn-primary goods-add-cart-btn" >
                                <i class="glyphicon glyphicon-shopping-cart"></i>加入购物车</div>
                            <div onclick="direct_buy(this)" id="directBuy" class=" btn btn-primary " data-product-number="${product.pnumber}">
                                <i class="glyphicon glyphicon-heart-empty"></i> 直接购买 </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

        <!-- 商品简介end-->

        <div class="full-screen-border"></div>
        <!-- 商品详情导航栏 -->
        <div class="goods-detail-nav" id="goodsDetail">
            <div class="container-fluid">
                <ul class="detail-list J_detailNav J_originNav" >
                    <li class='current detail-nav'> <a href="#goodsDesc" data-index='0' class='J_scrollHref'>详情描述</a> </li>
                </ul>
            </div>
        </div>

        <!-- 商品详情介绍  -->
        <div class="goods-detail-desc J_itemBox" id="goodsDesc" style="display: block;">
            <div class="container">
                <div class="shape-container">
                    <p class="detailBlock"> ${product.description} </p>
                </div>
            </div>
        </div>

        <div id="J_alsoBuyWrap"  style='margin-top:100px;'></div>
        <div id="J_recentGoods"  style='margin-top:100px;padding-bottom:130px;'></div>
    </div>

</c:if>

<c:if test="${empty product}">
    <div class="container-fluid">
        <div class="xm-box ">
            <div class="bd">
                <div class="shop-global-error">
                    <h2>你所查找的商品不存在</h2>
                    <p class="shop-global-error-tips"></p>
                    <p class="shop-global-error-btn"> <a href="${zzy}/index" class="btn btn-primary">去首页</a> <a  onclick="history.go(-1);" class="btn btn-line-gray">返回上一页</a> </p>
                </div>
            </div>
        </div>
    </div>
</c:if>

<footer>
    <jsp:include page="/WEB-INF/layouts/footer.jsp" />

    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/goodsDetail.js"></script>

    <!-- layer js -->
    <script src="${zzysta}/common/layer/layer.js"></script>
    <!-- 分页 js -->
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>
    <script src="${zzysta}/js/list.js"></script>

</footer>

</body>
</html>
