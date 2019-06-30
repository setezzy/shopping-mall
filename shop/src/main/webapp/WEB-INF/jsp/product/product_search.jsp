<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>搜索结果</title>
    <title>商品列表</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/goods-detail.css">
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/header.jsp" />
<jsp:include page="/WEB-INF/jsp/common/site_header.jsp" />

<c:if test="${not empty products}">
    <!--     分类导航栏 begin       -->
    <div class="breadcrumbs">
        <div class="container-fluid"><a href='${zzy}/index'>首页</a> <span class="sep">&gt;</span><a href="${zzy}/search?search=${search}" title="${search}">全部结果</a>
            <c:if test="${not empty search}"><span class="sep">&gt;</span><a>${search}</a></c:if>
        </div>
    </div>
    <!--     分类导航栏 end       -->

    <!--     产品分类目录begin       -->
    <div class="category">
        <div class="container-fluid">
            <div class="filter-box">
                <div class="filter-list-wrap">
                    <dl class="filter-list clearfix">
                        <dt>分类：</dt>
                        <dd class="${category.cid eq 1 ? 'active':''}"><a href="${zzy}/list?cid=1">全部</a></dd>
                        <c:forEach items="${childCategories}" var="lowerCategoriy">
                            <dd class="${childCategory.cid eq category.cid ? 'active':''}"><a href="${zzy}/list?cid=${childCategory.cid}">${childCategory.cname }</a></dd>
                        </c:forEach>
                    </dl>
                    <a class="more J_filterToggle" href="javascript:void(0);" onclick="showMornCategory(this);" >更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
            </div>
        </div>
    </div>
    <!--     产品分类目录end       -->

    <!--     产品分类内容begin       -->
    <div class="content">
        <div class="container-fluid">
            <div class="goods-list-box">
                <div class="goods-list clearfix">
                    <c:forEach items="${products}" var="product">
                        <div class="goods-item">
                            <div class="figure figure-img"><a title="${product.description}" href="${zzy}/detail/${product.pnumber}"><img src="${zzyimg}/${product.image}" title="${product.description}" width="200" height="200" alt="${product.pname}" /></a></div>
                            <p class="desc"></p>
                            <h2 class="title"><a title="${product.pname}" href="${zzy}/detail/${product.pnumber}">${product.pname}</a></h2>
                            <p class="price">${product.price}元</p>
                            <div class="notice"></div>
                        </div>
                    </c:forEach>
                </div>
                <div class="xm-pagenavi">
                    <c:if test="${pageInfo.total gt pageInfo.limit}">
                        <div id="pager" data-pager-href="${zzy}/search?search=${search}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
                    </c:if>
                </div>
            </div>
        </div>

    </div>

</c:if>
<c:if test="${empty products}">
    <div class="container-fluid">
        <div class="xm-box ">
            <div class="bd">
                <div class="shop-global-error">
                    <h2 class="title">抱歉，没有搜索到与 “<span class="keyword">${search}</span>” 相关的商品</h2>
                    <p class="shop-global-error-tips"></p>
                    <p class="shop-global-error-btn"> <a href="${zzy}/index" class="btn btn-primary">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-dake">返回上一页</a> </p>
                </div>
            </div>
        </div>
    </div>
</c:if>

</body>
</html>
