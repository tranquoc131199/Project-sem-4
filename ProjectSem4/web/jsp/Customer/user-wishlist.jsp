<%-- 
    Document   : user-wishlist
    Created on : Aug 17, 2020, 10:38:23 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>
<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.html"/>
</c:if>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/index.htm">Cá nhân</a></li>
            <li class="active">Danh sách yêu thích</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Danh sách yêu thích</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="list-user-function text-center medium-font upper-case">
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/index.htm" title="Thông tin cá nhân">Thông tin cá nhân</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-information.htm" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-password.htm" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-avatar.htm" title="Đổi ảnh đại diện">Đổi ảnh đại diện</a>
                    </div>
                    <div class="function-item function-active">
                        <a href="${pageContext.request.contextPath}/customer/wishlist.htm" title="Danh sách yêu thích">Danh sách yêu thích</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/order.htm" title="Đơn hàng">Đơn hàng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row">
                    <c:if test="${not empty wishlists}">
                        <c:forEach items="${wishlists}" var="p">
                            <div class="col-md-4 col-sm-6 col-xs-6">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/product/detail.htm/poductId=${p.productId.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${p.productId.productFeatureImage}" alt="${p.productId.productName}" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price"><fmt:formatNumber value="${p.productId.productPrice}" /></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name"><a href="${pageContext.request.contextPath}/product/detail.htm/poductId=${p.productId.productId}">${p.productId.productName}</a></h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="${p.productId.productId}"><i class="fa fa-heart active"></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="${p.productId.productId}"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="${p.productId.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true"/>
