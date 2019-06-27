<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="site-topbar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="topbar-info" id="J_userInfo">
                    <span class="user">
                        <a rel="nofollow" class="user-name" href="" target="_blank">
                            <span class="name">${admin.uname}</span>
                            <i class="glyphicon glyphicon-chevron-down"></i>
                        </a>
                    <ul class="user-menu" style="display: none;">
                        <li><a rel="nofollow" href="/shop_war_exploded/admin/info">修改密码</a></li>
                        <li><a rel="nofollow" href="/shop_war_exploded/admin/logout">退出登录</a></li>
                    </ul>
                    </span>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
