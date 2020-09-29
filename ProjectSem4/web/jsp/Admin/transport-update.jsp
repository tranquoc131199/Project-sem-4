<%-- 
    Document   : transport-update
    Created on : Jun 6, 2019, 5:24:42 PM
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/transport.htm" class="breadcrumb-link">Phương thức vận chuyển</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cập nhật phương thức vận chuyển</li>
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
                            <h3 class="card-header"><b>Cập nhật phương thức vận chuyển</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/transport.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/transport/do-update.htm">
                                    <div class="form-group">
                                        <label for="transportName" class="col-form-label">Tên phương thức vận chuyển:</label>
                                        <input id="transportName" maxlength="250" name="transportName" type="text" class="form-control" value="${transport.transportName}" />
                                        <input name="transportId" type="hidden" value="${transport.transportId}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="transportDescription" class="col-form-label">Mô tả:</label>
                                        <input id="transportDescription" name="transportDescription" type="text" class="form-control" value="${transport.transportDescription}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="transportPrice" class="col-form-label">Mức giá:</label>
                                        <input id="transportPrice" name="transportPrice" type="number" min="10000" step="1000" class="form-control" value="${transport.transportPrice}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="transportStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="transportStatus" id="transportStatus" class="form-control" required="required">
                                            <option value="1" <c:if test="${transport.transportStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${transport.transportStatus == 0}">selected</c:if>>Không kích hoạt</option>
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
                    Copyright © 2018 QTCStore. All rights reserved customize by <a href="https://facebook.com/quancoina/" target="_blank">QuanKoiNA</a>.
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
