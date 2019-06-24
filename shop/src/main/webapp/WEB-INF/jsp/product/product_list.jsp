<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${ctxsta}/css/goods-detail.css">
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/common/site_header.jsp" />

<c:if test="${not empty category}">
    <!--     分类导航栏 begin       -->
    <div class="breadcrumbs">
    <div class="container-fluid"><a href='${zzy}/index'>首页</a>
    <c:forEach items="${parentCategories}" var="parentCategory"><span class="sep">&gt;</span><a href="${zzy}/list?cid=${parentCategory.cid}">${parentCategory.cname}</a></c:forEach>
    </div>
    </div>

<!--     产品分类目录begin       -->
<div class="category">
    <div class="container-fluid">
        <div class="filter-box">
            <div class="filter-list-wrap">
                <dl class="filter-list clearfix">
                    <dt>分类：</dt>
                    <dd class="${category.cid eq 1 ? 'active':''}"><a href="${zzy}/list?cid=1">全部</a></dd>
                    <c:forEach items="${childCategories}" var="childCategory">
                        <dd class="${childCategory.cid eq category.cid ? 'active':''}"><a href="${zzy}/list?cid=${childCategory.cid}">${childCategory.cname }</a></dd>
                    </c:forEach>
                </dl>
                <a class="more J_filterToggle" onclick="showMornCategory(this);" >更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
        </div>
    </div>
</div>


<div class="goods-list-box">
    <div class="goods-list clearfix">
        <c:forEach items="${products}" var="product">
            <div class="goods-item">
                <div class="figure figure-img"><a title="${product.description}" href="${zzy}/detail/${product.pnumber}"><img src="${zzyimg}/${product.image}" title="${product.description}" width="200" height="200" alt="${product.pname}" /></a></div>
                <p class="desc"></p>
                <h2 class="title"><a title="${product.pname}" href="${zzy}/detail/${product.pnumber}">${product.pname}</a></h2>
                <p class="price">${product.price}元</p>
                <div class="actions clearfix">  <a class="btn-buy J_buyGoods" data-gid="${product.pnumber}" href="${zzy}/detail/${product.pnumber}"><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
                <div class="flags">
                </div>
                <div class="notice"></div>
            </div>
        </c:forEach>
    </div>
    <div class="xm-pagenavi">
        <c:if test="${pageInfo.total gt pageInfo.limit and not empty products}">
            <div id="pager" data-pager-href="${zzy}/list?cid=${category.cid}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
        </c:if>
    </div>
</div>

</c:if>



<c:if test="${empty category}">
    <div class="container-fluid">
        <div class="xm-box ">
            <div class="bd">
                <div class="shop-global-error">
                    <h2>你所查找的分类不存在</h2>
                    <p class="shop-global-error-tips"></p>
                    <p class="shop-global-error-btn"> <a href="${zzy}/index" class="btn btn-primary">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-line-gray">返回上一页</a> </p>
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

    <!-- layer js -->
    <script src="${zzysta}/common/layer/layer.js"></script>
    <!-- 分页 js -->
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>
    <script src="${zzysta}/js/list.js"></script>
</footer>

</body>
</html>
