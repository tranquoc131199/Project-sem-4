<%-- 
    Document   : feedback-catalog
    Created on : 
    Author     : Thang Pham
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/feedback.htm" class="breadcrumb-link">Phản hồi</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh mục phản hồi</li>
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
                            <h3 class="card-header"><b>Danh mục phản hồi</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/feedback.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên danh mục phản hồi</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty feedbackCatalogs}">
                                                <c:forEach items="${feedbackCatalogs}" var="fbc">
                                                    <tr>
                                                        <td>${fbc.feedbackCatalogName}</td>
                                                        <td>
                                                            <c:if test="${fbc.feedbackCatalogStatus == 1}">
                                                                <span class="badge badge-success">Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${fbc.feedbackCatalogStatus == 0}">
                                                                <span class="badge badge-danger">Không kích hoạt</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${fbc.feedbackCatalogStatus == 1}">
                                                                <a href="${pageContext.request.contextPath}/admin/feedback/disable-catalog.htm?feedbackCatalogId=${fbc.feedbackCatalogId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Bỏ kích hoạt</a>
                                                            </c:if>
                                                            <c:if test="${fbc.feedbackCatalogStatus == 0}">
                                                                <a href="${pageContext.request.contextPath}/admin/feedback/enable-catalog.htm?feedbackCatalogId=${fbc.feedbackCatalogId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Kích hoạt</a>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="clearfix"><hr></div>
                                <h3><b>Thêm mới danh mục phản hồi</b></h3>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/feedback/insert-catalog.htm">
                                    <div class="form-group">
                                        <label for="feedbackCatalogName" class="col-form-label">Tên danh mục phản hồi:</label>
                                        <input id="feedbackCatalogName" name="feedbackCatalogName" maxlength="250" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="feedbackCatalogStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="feedbackCatalogStatus" id="feedbackCatalogStatus" class="form-control" required="required">
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

<jsp:include page="widget/footer.jsp" flush="true"/>
