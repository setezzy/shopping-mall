<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css"
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
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
                <div class="box-hd">
                    <h1 class="title">所有用户</h1>
                    <div class="more clearfix">
                        <ul class="filter-list">
                            <li ><a href="${zzy}/admin/user/list?rid=0" data-type="0">普通用户</a></li>
                            <li ><a id="J_unpaidTab" href="${zzy}/admin/user/list?rid=1" data-type="1">管理员</a></li>
                            <li ><a id="J_sendTab" href="${zzy}/admin/user/list?rid=2" data-type="2">销售商</a></li>
                            <li ><a id="new_user" href="${zzy}/admin/user/insert" data-type="2">添加新用户</a></li>
                        </ul>
                    </div>
                </div>
                <div class="box-bd">
                    <div id="J_orderList">
                        <ul class="order-list">
                              <c:forEach items="${userVOList}" var="userVO">
                                  <c:if test="${rid eq 0}">
                                  <li class="uc-order-item uc-order-item-pay">
                                      <div class="order-detail">
                                          <table class="order-detail-table">
                                              <thead>
                                              <tr>
                                                  <th class="col-main">
                                                      <p class="caption-info">
                                                      用户id: &nbsp;${userVO.uid}
                                                      <span class="sep">| </span> 用户名: &nbsp;${userVO.uname}
                                                      <span class="sep">| </span> 手机号: &nbsp;${userVO.phone}
                                                      </p>
                                                  </th>
                                              </tr>
                                              </thead>
                                          </table>
                                          <div class="actions"> <a href="javascript:void(0);" class="modify J_addressDel"  id="J_userDel" onclick="user_delete(this,${userVO.uid})" data-id="${userVO.uid}">删除</a> </div>
                                      </div>
                                  </li>
                                  </c:if>
                                  <c:if test="${rid eq 1 || rid eq 2}">
                                      <li class="uc-order-item uc-order-item-pay">
                                          <div class="order-detail">
                                              <table class="order-detail-table">
                                                  <thead>
                                                  <tr>
                                                      <th class="col-main">
                                                          <p class="caption-info">
                                                              用户id: &nbsp;${userVO.uid}
                                                              <span class="sep">| </span> 用户名: &nbsp;${userVO.uname}
                                                              <span class="sep">| </span> 手机号: &nbsp;${userVO.phone}
                                                          </p>
                                                      </th>
                                                  </tr>
                                                  </thead>
                                              </table>
                                              <div class="actions" id="J_userModify" data-id="${userVO.uid}"> <a href="${zzy}/admin/user/modify?uid=${userVO.uid}" class="modify J_addressDel" role-id="${rid}" data-id="${userVO.uid}">修改</a> </div>
                                          </div>
                                      </li>
                                  </c:if>
                              </c:forEach>
                        </ul>
                    </div>
                    <div id="J_orderListPages">
                        <c:if test="${pageInfo.total gt pageInfo.limit and not empty userVOList}">
                            <div id="pager" data-pager-href="${zzy}/admin/user/list?type=${rid}&search=${search}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.current}" data-pager-total="${pageInfo.total}"></div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<footer>
    <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
    <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>


    <script src="${zzysta}/js/admin.js"></script>
    <script src="${zzysta}/js/zySearch.js"></script>
    <script src="${zzysta}/js/jump.js"></script>
    <script src="${zzysta}/js/base.js"></script>
    <script src="${zzysta}/js/main.js"></script>
    <script src="${zzysta}/js/list.js"></script>
    <script src="${zzysta}/js/myapp.js"></script>
    <script src="${zzysta}/js/area.js"></script>

    <script src="${zzysta}/common/layer/layer.js"></script>
    <script src="${zzysta}/js/location.js"></script>
    <script src="${zzysta}/js/select2.js"></script>
    <script src="${zzysta}/js/select2_locale_zh-CN.js"></script>

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
