<%-- 
    Document   : customer-detail
    Created on : 
    Author     : Thang Pham
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/customer.htm" class="breadcrumb-link">Khách hàng</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thông tin khách hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="user-avatar text-center d-block">
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Customers/${customer.customerAvatar}" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                            </div>
                            <div class="text-center">
                                <h2 class="font-24 mb-0">${customer.customerFullName}</h2>
                                <p>
                                    <c:if test="${customer.customerStatus == 1}">
                                        <span class='badge badge-success'>Kích hoạt</span>
                                    </c:if>
                                    <c:if test="${customer.customerStatus == 0}">
                                        <span class='badge badge-danger'>Bị khoá</span>
                                    </c:if>
                                    <c:if test="${customer.customerStatus == 2}">
                                        <span class='badge badge-warning'>Chưa kích hoạt</span>
                                    </c:if>
                                </p>
                            </div>
                            <div class="clearfix"><br /></div>
                            <div class="text-center">
                                <c:if test="${customer.customerStatus == 1}">
                                    <a href="${pageContext.request.contextPath}/admin/customer/disable.htm?customerId=${customer.customerId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Khoá tài khoản</a>
                                </c:if>
                                <c:if test="${customer.customerStatus == 0}">
                                    <a href="${pageContext.request.contextPath}/admin/customer/enable.htm?customerId=${customer.customerId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Mở khoá tài khoản</a>
                                </c:if>
                            </div>
                        </div>
                        <div class="card-body border-top">
                            <h3 class="font-16">Thông tin liên lạc</h3>
                            <div class="">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2"><i class="fas fa-fw fa-user mr-2"></i>Giới tính: <c:if test="${customer.customerGender == 1}">Nam</c:if><c:if test="${customer.customerGender == 0}">Nữ</c:if></li>
                                    <li class="mb-2"><i class="fas fa-fw fa-calendar-alt mr-2"></i>Ngày sinh: ${customer.customerBirthday}</li>
                                    <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>Email: <a href="malto:${customer.customerEmail}">${customer.customerEmail}</a></li>
                                    <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>Điện thoại: <a href="tel:${customer.customerPhone}">${customer.customerPhone}</a></li>
                                    <li class="mb-2"><i class="fas fa-fw fa-building mr-2"></i>Địa chỉ: ${customer.customerAddress}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                    <div class="influence-profile-content pills-regular">
                        <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="pills-product-rate-tab" data-toggle="pill" href="#pills-product-rate" role="tab" aria-controls="pills-product-rate" aria-selected="true">Đánh giá sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-order-list-tab" data-toggle="pill" href="#pills-order-list" role="tab" aria-controls="pills-order-list" aria-selected="false">Các đơn hàng đã mua</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-product-rate" role="tabpanel" aria-labelledby="pills-product-rate-tab">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th><b>Sản phẩm</b></th>
                                                            <th><b>Bình luận</b></th>
                                                            <th><b>Đánh giá</b></th>
                                                            <th><b>Thời gian</b></th>
                                                            <th><b>Hành động</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${not empty productComments}">
                                                            <c:forEach items="${productComments}" var="cmt">
                                                                <tr>
                                                                    <td>${cmt.productId.productName}</td>
                                                                    <td title="${cmt.productCommentContent}">${cmt.productCommentContent}</td>
                                                                    <td>
                                                                        <c:if test="${cmt.productCommentRate == 5}">
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                        </c:if>
                                                                        <c:if test="${cmt.productCommentRate == 4}">
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                        </c:if>
                                                                        <c:if test="${cmt.productCommentRate == 3}">
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                        </c:if>
                                                                        <c:if test="${cmt.productCommentRate == 2}">
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                        </c:if>
                                                                        <c:if test="${cmt.productCommentRate == 1}">
                                                                            <i class="fa fa-fw fa-star"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                            <i class="fa fa-fw fa-star-o"></i>
                                                                        </c:if>
                                                                    </td>
                                                                    <td><fmt:formatDate value="${cmt.productCommentTime}" /></td>
                                                                    <td>
                                                                        <c:if test="${cmt.productCommentStatus == 1}">
                                                                            <a href="${pageContext.request.contextPath}/admin/customer/disable-product-comment.htm?productCommentId=${cmt.productCommentId}&customerId=${customer.customerId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Khoá</a>
                                                                        </c:if>
                                                                        <c:if test="${cmt.productCommentStatus == 0}">
                                                                            <a href="${pageContext.request.contextPath}/admin/customer/enable-product-comment.htm?productCommentId=${cmt.productCommentId}&customerId=${customer.customerId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Mở khoá</a>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border-top card-footer p-0">
                                        <div class="campaign-metrics d-xl-inline-block">
                                            <h4 class="mb-0 "><c:if test="${not empty productCommentSize}">${productCommentSize}</c:if></h4>
                                            <p>Sản phẩm đã bình luận</p>
                                        </div>
                                        <div class="campaign-metrics d-xl-inline-block">
                                            <h4 class="mb-0"><c:if test="${not empty productCommentSize}">${productCommentSize}</c:if></h4>
                                            <p>Sản phẩm đã đánh giá</p>
                                        </div>
                                        <div class="campaign-metrics d-xl-inline-block">
                                            <h4 class="mb-0 "><c:if test="${not empty wishlistSize}">${wishlistSize}</c:if></h4>
                                            <p>Sản phẩm đã yêu thích</p>
                                        </div>
                                        <div class="campaign-metrics d-xl-inline-block">
                                            <h4 class="mb-0 "><c:if test="${not empty boughtProducts}">${boughtProducts}</c:if></h4>
                                                <p>Sản phẩm đã mua</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pills-order-list" role="tabpanel" aria-labelledby="pills-order-list-tab">
                                    <div class="card">
                                        <div class="campaign-table table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr class="border-0">
                                                        <th class="border-0">Mã đơn hàng</th>
                                                        <th class="border-0">Ngày đặt</th>
                                                        <th class="border-0">Tổng tiền</th>
                                                        <th class="border-0">Địa chỉ nhận hàng</th>
                                                        <th class="border-0">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty orders}">
                                                        <c:forEach items="${orders}" var="o">
                                                            <tr>
                                                                <td>${o.oderCode}</td>
                                                                <td><fmt:formatDate value="${o.createdDate}" /></td>
                                                                <td><fmt:formatNumber value="${o.orderTotalAmount}" /> VNĐ</td>
                                                                <td>${o.orderAddress}</td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/admin/order/detail.html?orderId=${o.orderId}" title="" class="btn btn-sm btn-info">Chi tiết</a>
                                                                    <c:if test="${o.orderStatus == 4}">
                                                                        <a href="${pageContext.request.contextPath}/admin/order/denied.html?orderId=${o.orderId}" title="" class="btn btn-sm btn-secondary">Huỷ đơn</a>
                                                                        <a href="${pageContext.request.contextPath}/admin/order/accept.html?orderId=${o.orderId}" title="" class="btn btn-sm btn-primary">Nhận đơn</a>
                                                                    </c:if>
                                                                    <c:if test="${o.orderStatus == 3}">
                                                                        <a href="${pageContext.request.contextPath}/admin/order/transport.html?orderId=${o.orderId}" title="" class="btn btn-sm btn-warning">Vận chuyển đơn</a>
                                                                    </c:if>
                                                                    <c:if test="${o.orderStatus == 2}">
                                                                        <a href="${pageContext.request.contextPath}/admin/order/success.html?orderId=${o.orderId}" title="" class="btn btn-sm btn-success">Thành công</a>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
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
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        Copyright © 2018 QTCStore. All rights reserved customize by <a href="https://facebook.com/quancoina/" target="_blank">Thang Pham</a>.
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="text-md-right footer-links d-none d-sm-block">
                            <a href="javascript: void(0);">About</a>
                            <a href="javascript: void(0);">Support</a>
                            <a href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </section>

<jsp:include page="widget/footer.jsp" flush="true"/>
