<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- bar -->
<div class="site-topbar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="topbar-nav">
                    <c:forEach items="${indexTop}" var="indexTop"> <a rel="nofollow" href="${indexTop.href}" target="${indexTop.target}">${indexTop.name}</a><span class="sep">|</span> </c:forEach>
                </div>


                <c:if test="${user.state==0}">
                    <div class="topbar-info" > <a rel="nofollow" class="link" href="/shop_war_exploded/login">登录</a></div>
                </c:if>

                <c:if test="${user.state==1}">
                    <div class="topbar-info" id="J_userInfo">
                        <span class="user">
                            <a rel="nofollow" class="user-name" href="" target="_blank">
                              <span class="name">${user.uname}</span>&nbsp;&nbsp;
                              <i class="glyphicon glyphicon-chevron-down"></i>
                            </a>

                         <ul class="user-menu" style="display: none;">
                            <li><a rel="nofollow" href="/shop_war_exploded/uc/user/portal" target="_blank">个人中心</a></li>
                            <li><a rel="nofollow" href="/shop_war_exploded/uc/order/list" target="_blank">我的订单</a></li>
                            <li><a rel="nofollow" href="/shop_war_exploded/logout">退出登录</a></li>
                          </ul>
                    </span><span class="sep">|</span><span class="sep">|</span></div>
                </c:if>


            </div>
        </div>
    </div>
</div>
