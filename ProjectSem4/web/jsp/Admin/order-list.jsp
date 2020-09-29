<%-- 
    Document   : order-list
    Created on : Sep 21, 2020, 12:29:05 AM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>

<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTBStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách đơn hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header"><b>Danh sách</b></h3>
                            <div class="card-body">
                                <div class="clearfix"><br></div>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="order-code" value="<c:if test="${not empty orderId}">${orderId}</c:if>" />
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-primary" id="search-order">Tìm kiếm</button>
                                        </div>
                                    </div>
                                    <div class="clearfix"><br></div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered first">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Người đặt</th>
                                                    <th>Email</th>
                                                    <th>Điện thoại</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Kiểu thanh toán</th>
                                                    <th>Kiểu giao hàng</th>
                                                    <th>Trạng thái</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${not empty orders}">
                                                <c:forEach items="${orders}" var="o">
                                                    <tr>
                                                        <td>${o.orderId}</td>
                                                        <td>${o.createdDate}</td>
                                                        <td>${o.customerId.customerFullName}</td>
                                                        <td>${o.customerId.customerEmail}</td>
                                                        <td>${o.customerId.customerPhone}</td>
                                                        <td><fmt:formatNumber value="${o.orderTotalAmount}"/> VNĐ</td>
                                                        <td>${o.paymentMethodId.paymentMethodName}</td>
                                                        <td>${o.transportId.transportName}</td>
                                                        <td>
                                                            <c:if test="${o.orderStatus == 4}">
                                                                <span class='badge badge-warning'>Đang chờ</span>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 3}">
                                                                <span class='badge badge-primary'>Đã xác nhận</span>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 2}">
                                                                <span class='badge badge-info'>Đang vận chuyển</span>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 1}">
                                                                <span class='badge badge-success'>Thành công</span>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 0}">
                                                                <span class='badge badge-danger'>Đã huỷ</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/order/detail.htm?orderId=${o.orderId}" class="btn btn-info btn-sm"><i class="fas fa-eye"></i> Chi tiết</a>
                                                            <c:if test="${o.orderStatus == 4}">
                                                                <a href="${pageContext.request.contextPath}/admin/order/accept.htm?orderId=${o.orderId}" class="btn btn-success btn-sm"><i class="fas fa-handshake"></i> Nhận đơn hàng</a>
                                                                <a href="${pageContext.request.contextPath}/admin/order/denied.htm?orderId=${o.orderId}" class="btn btn-success btn-sm"><i class="fas fa-trash"></i> Không nhận đơn hàng</a>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 3}">
                                                                <a href="${pageContext.request.contextPath}/admin/order/transport.htm?orderId=${o.orderId}" class="btn btn-success btn-sm"><i class="fas fa-truck"></i> Xác nhận đang vận chuyển</a>
                                                            </c:if>
                                                            <c:if test="${o.orderStatus == 2}">
                                                                <a href="${pageContext.request.contextPath}/admin/order/success.htm?orderId=${o.orderId}" class="btn btn-success btn-sm"><i class="fas fa-box-open"></i> Xác nhận giao hàng thành công</a>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <c:if test="${not empty pagingHtml}">
                                                ${pagingHtml}
                                            </c:if>
                                        </div>
                                        <c:if test="${empty orders}">
                                            <tr>
                                                <td colspan="10">Chưa có đơn hàng nào</td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function () {
        $("#search-order").click(function (e) {
            e.preventDefault();
            window.location.href = "${pageContext.request.contextPath}/admin/order/detail.htm?orderId=" + $("#order-code").val();
        });

        $("#order-code").keypress(function (e) {
            var key = e.which;

            if (key == 13) {
                window.location.href = "${pageContext.request.contextPath}/admin/order/detail.htm?orderId=" + $("#order-code").val();
            }
        });
    });
</script>                                       
<jsp:include page="widget/footer.jsp" flush="true"/>
