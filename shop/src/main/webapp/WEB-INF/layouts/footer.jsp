<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     底部信息  begin       -->
<div class="site-footer">
    <div class="container-fluid">

        <div class="footer-links clearfix">
            <dl class="col-links col-links-first">
                <dt>配送方式</dt>
                <dd><a rel="nofollow" href="#">上门自提</a></dd>
                <dd><a rel="nofollow" href="#">配送费标准</a></dd>
                <dd><a rel="nofollow" href="#">海外配送</a></dd>
            </dl>
            <dl class="col-links ">
                <dt>支付方式</dt>
                <dd><a rel="nofollow" href="#">货到付款</a></dd>
                <dd><a rel="nofollow" href="#">在线付款</a></dd>
                <dd><a rel="nofollow" href="#">分期付款</a></dd>
            </dl>
            <dl class="col-links ">
                <dt>售后服务</dt>
                <dd><a rel="nofollow" href="#">售后政策</a></dd>
                <dd><a rel="nofollow" href="#">价格保护</a></dd>
                <dd><a rel="nofollow" href="#">退款说明</a></dd>
            </dl>
            <dl class="col-links ">
                <dt>特色服务</dt>
                <dd><a rel="nofollow" href="#">延保服务</a></dd>
                <dd><a rel="nofollow" href="#">DIY装机</a></dd>
                <dd><a rel="nofollow" href="#">商城E卡</a></dd>
            </dl>
            <dl class="col-links ">
                <dt>新手上路</dt>
                <dd><a rel="nofollow" href="#">新手专区</a></dd>
                <dd><a rel="nofollow" href="#">免费开店</a></dd>
                <dd><a rel="nofollow" href="#">消费警示</a></dd>
            </dl>

            <dl class="col-links ">
                <dt>关注我们</dt>
                <dd><a rel="nofollow" href="#">新浪微博</a></dd>
                <dd><a rel="nofollow" href="#">微信公众号</a></dd>
                <dd><a rel="nofollow" href="#">订阅号</a></dd>
            </dl>
            <div class="col-contact">
                <p class="phone"> 网上商城 </p>
                <p> <span class="J_serviceTime-normal" style="">感谢您的信赖</span> <span class="J_serviceTime-holiday" style="display: none;">节假日服务时间 9:00-18:00</span><br>
                </p>
                <a rel="nofollow" class="btn btn-line-primary btn-small" href="#"><span class="glyphicon glyphicon-earphone"></span> 24小时在线客服</a> </div>
            </div>
        </div>
    </div>
<!--     底部信息  end         -->


<div class="site-info">
    <div class="container-fluid">
        <div class="info-text">
            <p class="sites">
                <c:forEach items="${indexBottom}" var="indexBottom"> <a href="${indexBottom.href}" target="${indexBottom.target}">${indexBottom.name}</a><span class="sep">|</span> </c:forEach>
            </p>
            <p align="center">Copyright © 2019 &nbsp;&nbsp; Zhang Zhiyi</p>
        </div>
    </div>
</div>


<!--     返回顶部  begin       -->
<div class="back-to-top">
    <div class="container-fluid">
        <p id="back-to-top"><a href="#top"><span class="glyphicon glyphicon-menu-up" style="font-size:30px;color:#ff6700;"></span>回到顶部</a></p>
    </div>
</div>

</div>
<!--     返回顶部  end         -->

<script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>