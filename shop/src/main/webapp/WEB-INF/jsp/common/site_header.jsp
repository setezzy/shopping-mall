<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<link rel="stylesheet" href="${zzysta}/css/base.css" />

<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="${zzy}/index" title="网上商城"><img src="${zzysta}/imgs/logo2.png"></a> </div>
    <div class="header-search"> <span class="zySearch" id="zySearch"></span> </div>
  </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li id="J_navCategory" class="nav-category"> <a class="link-category" href="${zzy}/list?cid=1"><span class="text">全部商品分类</span></a>
          <!--     轮播top菜单导航begin       -->
          <div class="site-category">
            <ul class="site-category-list clearfix">
              <c:forEach items="${categories}" var="category">
                <li class="category-item"> <a class="title" href="${zzy}/list?cid=${category.cid}">${category.cname}<i class="glyphicon glyphicon-chevron-right"></i></a>
                  <c:choose>
                    <c:when test="${fn:length(category.products)<=6}">
                      <div class="children clearfix children-col-1">
                        <ul class="children-list clearfix">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(category.products)<=12}">
                      <div class="children clearfix children-col-2">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(category.products)<=18}">
                      <div class="children clearfix children-col-3">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.name}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${category.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="children clearfix children-col-4">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${category.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-4">
                          <c:forEach items="${category.products}" var="product" begin="17" end="23">
                            <li> <a class="link" title="${product.pname}" href="${zzy}/detail/${product.pnumber}"><img class="thumb" src="${zzyimg}/${product.image}" width="40" height="40" alt="${product.pname}"><span class="text">${product.pname}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </li>
              </c:forEach>
            </ul>
          </div>
          <!--     轮播top菜单导航end       --> 
        </li>
        <c:forEach items="${indexClassify}" var="indexClassify">
          <li class="nav-item"> <a class="link" href="${indexClassify.href}" target="${indexClassify.target}"><span class="text">${indexClassify.name}</span><span class="arrow"></span></a> </li>
        </c:forEach>
      </ul>
    </div>
</div>

<script src="${zzysta}/common/jquery/jquery-3.2.0.min.js"></script>
<script src="${zzysta}/js/zySearch.js"></script>