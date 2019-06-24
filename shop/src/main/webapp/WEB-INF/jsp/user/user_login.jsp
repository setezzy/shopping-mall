<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
    <title>欢迎登录网上商城</title>
    <link rel="stylesheet" href="${zzysta}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${zzysta}/css/gloab.css" />
    <link rel="stylesheet" href="${zzysta}/css/index.css" />
    <script> var t1 = new Date().getTime(); baselocation='${zzy}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<div class="login-box">
    <div class="container-nav"> <a class="navbar-brand">欢迎登录网上商城</a>
        <ul class="navbar-nav-right">
            <li class="link-line">|</li>
            <li><a href="${zzy}/login">用户登录</a></li>
            <li class="link-line">|</li>
            <li><a href="${zzy}/admin">后台管理</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="reg-box-pan display-inline">
            <div class="reg-box login" id="verifyCheck" style="margin-top:20px;">
                <div class="part1">
                    <form>
                        <div class="item col-xs-12">
                            <div class="f-fl item-ifo">
                                <input type="text" name="uname" maxlength="20" placeholder="用户名" class="txt03 f-r3 required loginPage" tabindex="1" data-valid="isNonEmpty" data-error="请输入帐号" id="uname" />
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus"><span></span></label>
                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <div class="f-fl item-ifo">
                                <input type="password" name="password" id="password" maxlength="20" placeholder="密码" class="txt03 f-r3 required loginPage" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty" data-error="密码不能为空" data-exponent="${publicKeyMap.exponent}" data-modulus="${publicKeyMap.modulus}"/>
                                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus"></label>
                                <label class="focus valid"></label>
                                <span class="clearfix"></span>
                                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <div class="f-fl item-info">
                                <input type="text" name="vcode" placeholder="验证码" maxlength="4" class="txt03 f-r3 required loginPage" tabindex="4" data-valid="isNonEmpty" data-error="请输入验证码" id="vcode" />
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus"></label>
                                <label class="focus valid"></label>
                                <img style="position:absolute;right:220px;top:10px" src="${zzy}/checkImg" width="110" height="34" id="vcodeImg";>
                            </div>
                        </div>
                    </form>
                    <div class="item col-xs-12 message" style="height:auto">
                        <label class="valid" ></label>
                    </div>
                    <div class="item col-xs-12">
                        <div  class="btn btn-blue f-r3" id="btn_login">立即登录</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer clear">
    <div class="footer_copyright"> © 2019 Zhang Zhiyi </div>
</footer>
<script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
<script src="${zzysta}/common/bootstrap/js/bootstrap.min.js"></script>
<script src="${zzysta}/common/security/security.js"></script>
<script src="${zzysta}/js/base.js"></script>
<script src="${zzysta}/js/validate.js"></script>
</body>
</html>
