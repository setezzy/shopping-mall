<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css">
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/address.css">
    <link rel="stylesheet" href="${zzysta}/css/select2.css" />
    <link rel="stylesheet" href="${zzysta}/css/goods-detail.css">
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
                                <li><a href="javascript:void(0);" id="admin_user" onclick="check_admin()">用户</a></li>
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
            <div class="category">
                <div class="container-fluid">
                    <div class="filter-box">
                        <div class="filter-list-wrap">
                            <dl class="filter-list clearfix">
                                <dt>分类：</dt>
                                <dd class="${category.cid eq 1 ? 'active':''}"><a href="${zzy}/admin/product?cid=1">全部分类</a></dd>
                                <c:forEach items="${childCategories}" var="childCategory">
                                    <dd class="${childCategory.cid eq category.cid ? 'active':''}"><a href="${zzy}/admin/product?cid=${childCategory.cid}">${childCategory.cname }</a></dd>
                                </c:forEach>
                            </dl>
                            <a class="more J_filterToggle" onclick="showMornCategory(this);" >更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
                    </div>
                </div>
            </div>
            <div class="box-bd">
                <div class="user-address-list J_addressList clearfix">
                    <div class="address-item address-item-new" id="J_newProduct"> <i class="iconfont"><i class="glyphicon glyphicon-plus"></i></i> 添加新商品 </div>
                    <!--展示所有商品-->
                    <c:forEach items="${products}" var="product">
                        <div class="address-item J_addressItem" id="productInfo" product-id="${product.pid}" product-name="${product.pname}" product-price="${product.price}" product-desc="${product.description}" product-amount="${product.amount}" product-cate="${category.cid}">
                            <dl>
                                <dt> <em class="uname">${product.pname}</em> &nbsp;&nbsp;&nbsp;&nbsp; 编号: ${product.pnumber}</dt>
                                <dd class="utel">价格: ${product.price} &nbsp;&nbsp; 库存: ${product.amount}</dd>
                                <dd class="uaddress"><br />
                                        ${product.description}
                                </dd>
                            </dl>
                            <div class="actions"> <div class="modify J_addressModify" id="J_productModify" data-id="${product.pid}">修改</div> <div class="modify J_addressDel"  id="J_addressDel" onclick="product_delete(this,${product.pid})" data-id="${product.pid}">删除</div> </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="xm-pagenavi">
                    <c:if test="${pageInfo.total gt pageInfo.limit and not empty products}">
                        <div id="pager" data-pager-href="${zzy}/admin/product?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
                    </c:if>
                </div>
                <!--点击弹出新增收货地址界面-->
                <div class="address-edit-box" id="J_edit">
                    <div class="box-main">
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" id="pname" name="pname" placeholder="商品名称">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <input class="input-text J_addressInput" type="text" id="price" name="price" placeholder="价格">
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <textarea class="input-text J_addressInput" type="text" id="description" name="description" placeholder="详细描述"></textarea>
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <textarea class="input-text J_addressInput" type="text" id="amount" name="amount" placeholder="数量"></textarea>
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <p> 默认分类: ${category.cname} </p>
                            <p class="tip-msg tipMsg"></p>
                        </div>
                        <div class="form-section">
                            <tr>
                                <td>子分类</td>
                                <td><select id="child_category" name="child_category">
                                    <option value="">请选择</option>
                                    <c:forEach items="${childCategories}" var="childCategory">
                                        <option value="${childCategory.cid}">${childCategory.cname}</option>
                                    </c:forEach>
                                </select>
                                </td>
                            </tr>
                        </div>
                    </div>
                    <div class="form-confirm clearfix">
                        <input class="input-text J_addressInput" type="hidden" id="pid" name="pid">
                        <div class="btn btn-primary" id="Pro_save" >保存</div>
                        <div class="btn btn-gray" id="J_cancel">取消</div>
                    </div>
                </div>

                <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"> </div>
            </div>
        </div>
    </div>
</div>
</div>

<footer>
    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>

    <script src="${zzysta}/common/layer/layer.js"></script>
    <script src="${zzysta}/common/pager/jquery.pager.js"></script>
    <script src="${zzysta}/js/area.js"></script>
    <script src="${zzysta}/js/location.js"></script>
    <script src="${zzysta}/js/select2.js"></script>
    <script src="${zzysta}/js/select2_locale_zh-CN.js"></script>
    <script src="${zzysta}/js/admin.js"></script>

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
