<%-- 
    Document   : index
    Created on : Aug 20, 2020, 11:25:09 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTB Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Bảng điều khiển</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <a href="${pageContext.request.contextPath}/admin/product.htm">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-muted"><b>SẢN PHẨM</b></h5>
                                    <div class="metric-value d-inline-block">
                                        <h1 class="mb-1"><c:if test="${not empty countProduct}">${countProduct}</c:if></h1>
                                    </div>
                                    <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                        <span>Sản phẩm</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <a href="${pageContext.request.contextPath}/admin/order.htm">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-muted"><b>ĐƠN HÀNG</b></h5>
                                    <div class="metric-value d-inline-block">
                                        <h1 class="mb-1"><c:if test="${not empty countOrder}">${countOrder}</c:if></h1>
                                    </div>
                                    <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                        <span>Đơn hàng</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <a href="${pageContext.request.contextPath}/admin/feedback.htm">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-muted"><b>PHẢN HỒI</b></h5>
                                    <div class="metric-value d-inline-block">
                                        <h1 class="mb-1"><c:if test="${not empty countFeedback}">${countFeedback}</c:if></h1>
                                    </div>
                                    <div class="metric-label d-inline-block float-right text-primary font-weight-bold">
                                        <span>Phản hồi</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <a href="${pageContext.request.contextPath}/admin/revenue.htm">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-muted"><b>DOANH THU TUẦN QUA</b></h5>
                                    <div class="metric-value d-inline-block">
                                        <h1 class="mb-1"><c:if test="${not empty sumRevenue}"><fmt:formatNumber value="${sumRevenue}" /></c:if></h1>
                                    </div>
                                    <div class="metric-label d-inline-block float-right text-secondary font-weight-bold">
                                        <span>VNĐ</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header"><b>ĐƠN HÀNG GẦN ĐÂY</b></h5>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">Mã đơn hàng</th>
                                                <th class="border-0">Người đặt hàng</th>
                                                <th class="border-0">Tổng tiền</th>
                                                <th class="border-0">Email</th>
                                                <th class="border-0">Điện thoại</th>
                                                <th class="border-0">Địa chỉ</th>
                                                <th class="border-0">Thời gian đặt hàng</th>
                                                <th class="border-0">Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty newestOrder}">
                                            <c:forEach items="${newestOrder}" var="o">
                                                <tr>
                                                    <td>${o.orderId}</td>
                                                    <td>${o.customerId.customerFullName}</td>
                                                    <td><fmt:formatNumber value="${o.orderTotalAmount}" /></td>
                                                <td>${o.customerId.customerEmail}</td>
                                                <td>${o.customerId.customerPhone}</td>
                                                <td>${o.customerId.customerAddress}</td>
                                                <td>${o.createdDate}</td>
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
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header"><b>SẢN PHẨM BÁN CHẠY</b></h5>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table no-wrap p-table">
                                        <thead class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">Tên sản phẩm</th>
                                                <th class="border-0">Lượt mua</th>
                                                <th class="border-0">Giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty bestSaleProduct}">
                                            <c:forEach items="${bestSaleProduct}" var="p">
                                                <tr>
                                                    <td><a href="${pageContext.request.contextPath}/admin/product/detail.htm?productId=${p.productId}">${p.productName}</a></td>
                                                    <td>${p.productSaleQuantity}</td>
                                                    <td><fmt:formatNumber value="${p.productPrice}" /></td>
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
</section>

<jsp:include page="widget/footer.jsp" flush="true" />