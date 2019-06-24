<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<%@ include file="/WEB-INF/layouts/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>网上商城</title>
    <link rel="shortcut icon" href="${zzyimg}/logo2.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${zzyta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/index_main.css" />
    <link rel="stylesheet" href="${zzysta}/css/goods-detail.css" />
    <link rel="stylesheet" href="${zzysta}/css/list.css" />
    <link rel="stylesheet" href="${zzysta}/css/main.css" />
    <link rel="stylesheet" href="${zzysta}/css/base.css" />
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>

</head>
<body>
    <!-- 轮播 -->
    <jsp:include page="common/site_header.jsp" />
    <div class="home-hero-container container-fluid">
        <div class="home-hero">
            <div class="home-hero-slider">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="box">
                            <ul class="ull">
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-1.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-2.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-3.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-4.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-5.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                                <li><a href="${indexCarouselImg.href}"
                                       title="${indexCarouselImg.title}" target="_blank"> <img
                                        src="${zzyimg}/advert/ad-6.png"
                                        alt="${indexCarouselImg.title }"></a>
                                </li>
                            </ul>
                            <ol class="oll">
                            </ol>
                            <span class="left btnL glyphicon glyphicon-menu-right"></span> <span
                                class="right btnL glyphicon glyphicon-menu-left"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home-hero-sub row">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="span4">
                            <ul class="home-channel-list clearfix">
                                <c:forEach items="${indexAdvertLeft}" var="indexAdvertLeft">
                                    <li><a href="${indexAdvertLeft.href }"
                                           target="${indexAdvertLeft.target}"
                                           title="${indexAdvertLeft.name}">${indexAdvertLeft.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="span16" id="J_homePromo" data-stat-title="焦点图下方小图">
                            <ul class="home-promo-list clearfix">
                                <c:forEach items="${indexHotAdvertImgs }"
                                           var="indexHotAdvertImg" varStatus="indexHotAdvertImgStat">
                                    <c:if test="${indexHotAdvertImgStat.first}">
                                        <li class="first"><a class="item"
                                                             href="${indexHotAdvertImg.href }"
                                                             title="${indexHotAdvertImg.title}">
                                            <img
                                                src="${zzyimg}/${indexHotAdvertImg.image}"
                                                alt="${indexHotAdvertImg.title }"></a></li>
                                    </c:if>
                                    <c:if test="${!indexHotAdvertImgStat.first}">
                                        <li><a class="item" href="${indexHotAdvertImg.href }"
                                               title="${indexHotAdvertImg.title}"><img
                                                src="${zzyimg }/${indexHotAdvertImg.image}"
                                                alt="${indexHotAdvertImg.title }"></a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="home-star-goods xm-carousel-container" id="J_starProduct">
            <!-- <h2 class="title">冲破大风雪，我们坐在雪橇上  (๑•̀ㅂ•́)و✧ </h2> -->
        </div>
    </div>
    <!--     轮播end         -->

    <!--     主产品  begin    -->
    <div class="page-main home-main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="container-fluid">
                        <div id="J_topCategory"
                             class="home-recm-box home-brick-box xm-plain-box">
                            <!-- <h2 class="title">快奔驰过田野，我们欢笑又歌唱   φ(゜▽゜*)♪</h2> -->
                        </div>
                        <div id="J_hotCategory"
                             class="home-recm-box home-brick-box xm-plain-box">
                            <!-- <h2 class="title">叮叮当，叮叮当，铃儿响叮当   (」o^∀^)」*゜</h2> -->
                        </div>
                        <div id="J_popularPrudoct"
                             class="home-recm-box home-brick-box home-brick-row-1-box xm-plain-box J_itemBox J_recommendBox is-visible">
                            <!-- <h2 class="title">马儿铃声响叮当，令人精神多欢畅   ヾ(≧▽≦*)o</h2> -->
                        </div>
                        <div id="J_commentPrudoct"
                             class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
                            <!-- <h2 class="title">我们今晚滑雪真快乐，把滑雪歌儿唱  (♥◠‿◠)ﾉ  ʅ(‾◡◝)</h2> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


       <script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
       <script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>

       <script src="${zzysta}/js/base.js"></script>
       <script src="${zzysta}/js/jump.js"></script>
       <script src="${zzysta}/js/zySearch.js"></script>
       <script src="${zzysta}/js/index_main.js"></script>
       <script src="${zzysta}/js/myapp.js"></script>
       <script src="${zzysta}/js/list.js"></script>
       <script src="${zzysta}/js/main.js"></script>


<footer>
    <jsp:include page="/WEB-INF/layouts/footer.jsp"/>
</footer>


</body>
</html>
