<%-- 
    Document   : payment-update
    Created on : Jun 6, 2019, 5:26:12 PM
    Author     : QuanKoiNA
--%>

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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/payment.htm" class="breadcrumb-link">Phương thức thanh toán</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa phương thức thanh toán</li>
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
                            <h3 class="card-header"><b>Thông tin phương thức thanh toán</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/payment.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/payment/do-update.htm">
                                    <div class="form-group">
                                        <label for="paymentMethodName" class="col-form-label">Tên phương thức thanh toán:</label>
                                        <input name="paymentMethodName" id="paymentMethodName" maxlength="250" type="text" class="form-control" value="${payment.paymentMethodName}">
                                        <input name="paymentMethodId" type="hidden" value="${payment.paymentMethodId}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="paymentMethodDescription" class="col-form-label">Mô tả:</label>
                                        <input name="paymentMethodDescription" id="paymentMethodDescription" type="text" class="form-control" value="${payment.paymentMethodDescription}">
                                    </div>
                                    <div class="form-group">
                                        <label for="paymentMethodStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="paymentMethodStatus" id="paymentMethodStatus" class="form-control">
                                            <option value="1" <c:if test="${payment.paymentMethodStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${payment.paymentMethodStatus == 0}">selected</c:if>>Không kích hoạt</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-check"></i> Xác nhận</button>
                                        <button type="reset" class="btn btn-sm btn-danger"><i class="fas fa-retweet"></i> Làm lại</button>
                                    </div>
                                </form>
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
                    Copyright © 2018 QTCStore. All rights reserved customize by <a href="https://facebook.com/quancoina/" target="_blank">ThangPD</a>.
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
