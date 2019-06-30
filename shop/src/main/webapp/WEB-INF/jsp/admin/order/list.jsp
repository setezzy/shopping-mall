<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<html>
<head>
    <title>订单管理</title>
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/css/address.css" />
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
                <div class="box-hd">
                <h1 class="title">全部订单</h1>
                    <p></p>
                    <p></p>
                </div>
                <table border="1" bordercolor="#c0c0c0">
                    <tr>
                        <th width="180px">订单编号</th>
                        <th width="100px">用户id</th>
                        <th width="100px">订单状态</th>
                        <th width="100px">订单金额</th>
                        <th width="180px">下单日期</th>
                        <th width="180px">操作</th>
                    </tr>
                    <c:forEach items="${orderVOList}" var="orderVO" >
                        <div>
                        <tr>
                            <td>${orderVO.onumber}</td>
                            <td>${orderVO.uid}</td>
                            <td>
                                <c:if test="${orderVO.ostate == 1}"> 已提交 </c:if>
                                <c:if test="${orderVO.ostate == 2}"> 已发货 </c:if>
                                <c:if test="${orderVO.ostate == 3}"> 已拒绝 </c:if>
                                <c:if test="${orderVO.ostate == 4}"> 已关闭 </c:if>
                            </td>
                            <td>${orderVO.oprice}</td>
                            <td>${orderVO.odate}</td>
                            <td>
                                <c:if test="${orderVO.ostate == 1 }">
                                    <a class="modify J_addressDel"  id="J_orderAdm" href="javascript:void(0);" onclick="order_admit(${orderVO.oid})"> 发货 </a>
                                    &nbsp;
                                    <a class="modify J_addressDel"  id="J_orderRef" href="javascript:void(0);" onclick="order_refuse(${orderVO.oid})"> 拒绝 </a>
                                </c:if>
                                <c:if test="${orderVO.ostate == 2 ||  orderVO.ostate == 3}">无</c:if>
                                <c:if test="${orderVO.ostate == 4}">
                                    <a class="modify J_addressDel"  id="J_orderDel" href="javascript:void(0);" onclick="order_delete(this,${orderVO.oid})"> 删除 </a>
                                </c:if>
                            </td>
                        </tr>
                        </div>
                    </c:forEach>
                </table>

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
