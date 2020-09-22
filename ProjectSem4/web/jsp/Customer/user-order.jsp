<%-- 
    Document   : user-order
    Created on : Aug 17, 2020, 10:38:16 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>
<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.html"/>
</c:if>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/index.html">Cá nhân</a></li>
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
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Mã đơn hàng</th>
                                <th class="text-center">Ngày đặt hàng</th>
                                <th class="text-center">Tổng tiền</th>
                                <th class="text-center">Trạng thái đơn hàng</th>
                                <th class="text-center">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty orders}">
                                <c:forEach items="${orders}" var="o">
                                    <tr>
                                        <td>${o.orderId}</td>
                                        <td><fmt:formatDate value="${o.createdDate}" /></td>
                                        <td><fmt:formatNumber value="${o.orderTotalAmount}" />VNĐ</td>
                                        <td>
                                            <c:if test="${o.orderStatus == 4}">
                                                <span class="label label-warning">Đang chờ xác nhận</span>
                                            </c:if>
                                            <c:if test="${o.orderStatus == 3}">
                                                <span class="label label-primary">Đã xác nhận</span>
                                            </c:if>
                                            <c:if test="${o.orderStatus == 2}">
                                                <span class="label label-info">Đang vận chuyển</span>
                                            </c:if>
                                            <c:if test="${o.orderStatus == 1}">
                                                <span class="label label-success">Thành công</span>
                                            </c:if>
                                            <c:if test="${o.orderStatus == 0}">
                                                <span class="label label-danger">Đã huỷ</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/customer/detail-order.htm?orderId=${o.orderId}" data-id="${o.orderId}" class="btn btn-xs btn-info view-detail"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                            <c:if test="${o.orderStatus == 4 || o.orderStatus == 3}">
                                                <a href="${pageContext.request.contextPath}/customer/cancel-order.htm?orderId=${o.orderId}" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i> Huỷ đơn hàng</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <div id="append-html">

                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="widget/footer.jsp" flush="true"/>
