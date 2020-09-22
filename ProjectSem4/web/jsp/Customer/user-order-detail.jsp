<%-- 
    Document   : user-order-detail
    Created on : Sep 21, 2020, 11:46:20 PM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>
<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.htm"/>
</c:if>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/index.htm">Cá nhân</a></li>
            <li class="active">Đơn hàng</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đơn hàng</h2>
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
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/wishlist.htm" title="Danh sách yêu thích">Danh sách yêu thích</a>
                    </div>
                    <div class="function-item function-active">
                        <a href="${pageContext.request.contextPath}/customer/order.htm" title="Đơn hàng">Đơn hàng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-9" id="order-to-append">
                <div class="step-content">
                    <div class="step-item-content step-content-active" id="first">
                        <div class="step-description">Đơn hàng đã được đặt thành công vào lúc <i class="fa fa-clock-o" style="margin-left: 10px;"></i> <span class="time"><fmt:formatDate value="${order.createdDate}" /></span></div>
                        <div class="order-detail">Chi tiết đơn hàng:</div>

                        <table class="table table-bordered table-hover table-striped table-condensed table-responsive">
                            <thead>
                                <tr>
                                    <th style="width: 30%;">Sản phẩm</th>
                                    <th style="width: 25%;">Hình ảnh</th>
                                    <th style="width: 10%;" class="text-center">Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Giảm giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty detail}">
                                    <c:forEach items="${detail}" var="p">
                                        <tr>
                                            <td style="width: 30%;">
                                                <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.productId.productId}">${p.productId.productName}</a>
                                            </td>
                                            <td style="width: 25%;">
                                                <img src="${p.productId.productFeatureImage}" class="img-responsive" alt="${p.productId.productName}">
                                            </td>
                                            <td style="width: 10%;" class="text-center">${p.orderDetailQuantity}</td>
                                            <td><fmt:formatNumber value="${p.orderDetailPrice}" /></td>
                                            <td>${p.orderDetailSale}%</td>
                                            <td><fmt:formatNumber value="${p.orderDetailPrice * (100 - p.orderDetailSale) / 100}" /></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6" class="text-right">
                                        <div class="shipping-fee"><b>Phí vận chuyển:</b> <fmt:formatNumber value="${order.transportId.transportPrice}" /></div>
                                        <div class="total-amount"><b>Tổng tiền:</b> <fmt:formatNumber value="${order.orderTotalAmount}" /></div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
