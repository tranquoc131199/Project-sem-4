<%-- 
    Document   : banner-insert
    Created on : Jun 6, 2019, 5:14:21 PM
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.html" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/banner.html" class="breadcrumb-link">Banner</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới banner</li>
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
                            <h3 class="card-header"><b>Thêm mới banner</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/banner.html" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/banner/do-insert.htm" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="bannerDescription" class="col-form-label">Mô tả banner:</label>
                                        <input id="bannerDescription" maxlength="250" name="bannerDescription" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="bannerPiority" class="col-form-label">Độ ưu tiên:</label>
                                        <input id="bannerPiority" name="bannerPiority" type="number" value="${maxPiority}" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="bannerImage" class="col-form-label">Hình ảnh:</label>
                                        <div class="input-group mb-3">
                                            <input type="file" class="form-control" maxlength="250" name="bannerImage" id="bannerImage" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bannerStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="bannerStatus" id="bannerStatus" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Kích hoạt</option>
                                            <option value="0">Không kích hoạt</option>
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
                                    
<script type="text/javascript">
    $(document).ready(function() {
        var newIdValue = 0;
        var promotionIdValue = 0;

        $("#newId").change(function(event) {
            event.preventDefault();

            newIdValue = $("#newId").val();

            if (newIdValue != 0) {
                $("#promotionId").val("");
                $("#promotionId").prop('disabled', true);
            } else {
                $("#promotionId").prop('disabled', false);
            }
        });

        $("#promotionId").change(function(event) {
            event.preventDefault();

            promotionIdValue = $("#promotionId").val();

            if (promotionIdValue != 0) {
                $("#newId").val("");
                $("#newId").prop('disabled', true);
            } else {
                $("#newId").prop('disabled', false);
            }
        });
    });
</script>

<jsp:include page="widget/footer.jsp" flush="true"/>
