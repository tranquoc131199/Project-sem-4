<%-- 
    Document   : navbar
    Created on : Aug 19, 2020, 11:51:53 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="navigation">
    <div class="container">
        <div id="responsive-nav">
            <div class="category-nav show-on-click">
                <span class="category-header">Danh mục <i class="fa fa-list"></i></span>
                <ul class="category-list">
                    <c:if test="${not empty navbarHtm}">
                        ${navbarHtm}
                    </c:if>
                </ul>
            </div>

            <div class="menu-nav">
                <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                <ul class="menu-list">
                    <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
                    <li class="dropdown mega-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Tin tức <i class="fa fa-caret-down"></i></a>
                        <div class="custom-menu">
                            <div class="row">
                                <c:if test="${not empty newHtml}">
                                    ${newHtml}
                                </c:if>
                            </div>
                            <div class="row hidden-sm hidden-xs">
                                <div class="col-md-12">
                                    <hr>
                                    <a class="banner banner-1" href="#">
                                        <img src="ProjectSem4/jsp/Admin/assets/img/banner05.jpg" alt="">
                                        <div class="banner-caption text-center">
                                            <h2 class="white-color">SẢN PHẨM MỚI</h2>
                                            <h3 class="white-color font-weak">GIÁ HẤP DẪN</h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="about-us.jsp">Giới thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/feedback.htm">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
