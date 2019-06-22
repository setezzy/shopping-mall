<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String projectPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String staticPath = projectPath + "/static";
    String imagePath = projectPath + "/uploads";
%>
<%--项目路径 --%>
<c:set var="basePath" value="<%=projectPath%>"></c:set>
<c:set var="zzy" value="${pageContext.request.contextPath}"/>
<%--静态资源路径 --%>
<c:set var="zzysta" value="${pageContext.request.contextPath}/static"/>
<%--页面显示图片的前缀路径--%>
<c:set var="zzyimg" value="${pageContext.request.contextPath}/uploads"/>



