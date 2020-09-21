<%-- 
    Document   : order-detail
    Created on : Sep 21, 2020, 12:29:25 AM
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
                        <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/order.htm" class="breadcrumb-link">Đơn hàng</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chi tiết đơn hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/admin/order/index.htm" class="btn btn-sm btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
            <div class="clearfix"><br/></div>
            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
                        <div class="section-block">
                            <h3 class="section-title"><b>Chi tiết đơn hàng</b></h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <c:if test="${order.orderStatus == 4}">
                                        <a href="${pageContext.request.contextPath}/admin/order/accept.htm?orderId=${order.orderId}" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Nhận đơn hàng</a>
                                        <a href="${pageContext.request.contextPath}/admin/order/denied.htm?orderId=${order.orderId}" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Không nhận đơn hàng</a>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 3}">
                                        <a href="${pageContext.request.contextPath}/admin/order/transport.htm?orderId=${order.orderId}" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Xác nhận đang vận chuyển</a>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 2}">
                                        <a href="${pageContext.request.contextPath}/admin/order/success.htm?orderId=${order.orderId}" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Xác nhận giao hàng thành công</a>
                                    </c:if>
                                </div>
                                <div class="col-md-6">
                                    <c:if test="${order.orderStatus == 4}">
                                        <span class='badge badge-warning'>Đang chờ</span>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 3}">
                                        <span class='badge badge-primary'>Đã xác nhận</span>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 2}">
                                        <span class='badge badge-info'>Đang vận chuyển</span>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 1}">
                                        <span class='badge badge-success'>Thành công</span>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 0}">
                                        <span class='badge badge-danger'>Đã huỷ</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="tab-vertical">
                            <ul class="nav nav-tabs" id="myTab3" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="customer-info-tab" data-toggle="tab" href="#customer-info" role="tab" aria-controls="customer-info" aria-selected="true">Thông tin người đặt hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="order-info-tab" data-toggle="tab" href="#order-info" role="tab" aria-controls="order-info" aria-selected="false">Thông tin đơn hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="notes-tab" data-toggle="tab" href="#notes" role="tab" aria-controls="notes" aria-selected="false">Ghi chú bổ sung</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent3">
                                <div class="tab-pane fade show active" id="customer-info" role="tabpanel" aria-labelledby="customer-info-tab">
                                    <p class="lead">Thông tin người đặt hàng</p>
                                    <table>
                                        <tr>
                                            <th class="text-right">Họ và tên:</th>
                                            <td>${order.customerId.customerFullName}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Ngày sinh:</th>
                                            <td>${order.customerId.customerBirthday}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Email:</th>
                                            <td>${order.customerId.customerEmail}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Điện thoại:</th>
                                            <td><a href="tel:${order.customerId.customerPhone}">${order.customerId.customerPhone}</a></td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Địa chỉ:</th>
                                            <td>${order.customerId.customerAddress}</td>
                                        </tr>
                                        <tr>
                                            <th class="text-right">Địa chỉ nhận hàng:</th>
                                            <td>${order.orderAddress}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="order-info" role="tabpanel" aria-labelledby="order-info-tab">
                                    <h3>Thông tin đơn hàng</h3>
                                    <div class="table-responsive">
                                        <table class="table table-hover table-condensed table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Số lượng</th>
                                                    <th>Đơn giá</th>
                                                    <th>Giảm giá</th>
                                                    <th>Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listOrderDetails}" var="od">
                                                    <tr>
                                                        <td>${od.productId.productName}</td>
                                                        <td>
                                                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${od.productId.productFeatureImage}" style="max-width: 128px;" class="img-fluid" alt="${od.productId.productName}" />
                                                        </td>
                                                        <td>${od.orderDetailQuantity}</td>
                                                        <td><fmt:formatNumber value="${od.orderDetailPrice}" /></td>
                                                        <td>${od.orderDetailSale}</td>
                                                        <td><fmt:formatNumber value="${od.orderDetailQuantity * (100 - od.orderDetailSale) / 100 * od.orderDetailPrice}" /></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="7">
                                                        <br />
                                                        <b>Phí vận chuyển:</b> <span><fmt:formatNumber value="${order.transportId.transportPrice}" /></span>
                                                        <br />
                                                        <b>Tổng tiền:</b> <span><fmt:formatNumber value="${order.orderTotalAmount}" /></span>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="notes" role="tabpanel" aria-labelledby="notes-tab">
                                    <h3>Ghi chú bổ sung</h3>
                                    <p>
                                        ${order.orderNote}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>

