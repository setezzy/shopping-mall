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

                <div class="topbar-cart" id="J_miniCartTrigger"> <a class="cart-mini" id="J_miniCartBtn" href="${zzy}/cart/list"><i class="glyphicon glyphicon-shopping-cart"></i>购物车<span class="cart-mini-num J_cartNum">（${fn:length(sessionScope.cart.shoppingCartVOs)}）</span></a>
                    <div class="cart-menu" id="J_miniCartMenu" style="display: none;">
                        <div class="loading">
                            <div class="loader"></div>
                        </div>
                    </div>
                </div>



                <c:if test="${user.state==1}">
                    <div class="topbar-info" id="J_userInfo"><span class="user"><a rel="nofollow" class="user-name" href="" target="_blank"><span class="name">${user.uname}</span>&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a>
                         <ul class="user-menu" style="display: none;">
                            <li><a rel="nofollow" href="${zzy}/uc/user/portal" target="_blank">个人中心</a></li>
                            <li><a rel="nofollow" href="${zzy}/uc/order/list" target="_blank">我的订单</a></li>
                            <li><a rel="nofollow" href="${zzy}/logout">退出登录</a></li>
                          </ul>
                    </span><span class="sep">|</span><span class="sep">|</span></div>
                </c:if>

               <c:if test="${user.state==0}">
                    <div class="topbar-info" > <a rel="nofollow" class="link" href="${zzy}/login">登录</a></div>
                </c:if>

            </div>
        </div>
    </div>
</div>
