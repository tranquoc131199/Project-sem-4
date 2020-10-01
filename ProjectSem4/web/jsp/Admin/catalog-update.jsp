<%-- 
    Document   :catalog-update
    Document   :
    Created on : Aug 23, 2020, 12:24:51 PM
    Author     : Acer Nitro 5
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/catalog.htm" class="breadcrumb-link">Danh mục tin tức</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cập nhật danh mục tin tức</li>
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
                            <h3 class="card-header"><b>Cập nhật danh mục tin tức</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/catalog.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/catalog/updateCatalog.htm">
                                    <div class="form-group">
                                        <label for="catalogName" class="col-form-label">Tên danh mục tin:</label>
                                        <input id="catalogName" name="catalogName" maxlength="250" type="text" class="form-control" value="${catalog.catalogName}" />
                                        <input id="catalogId" name="catalogId" type="hidden" maxlength="250" type="text" class="form-control" value="${catalog.catalogId}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="catalogPiority" class="col-form-label">Độ ưu tiên:</label>
                                        <input id="catalogPiority" name="catalogPiority" disabled="true" maxlength="250" type="text" value="${catalog.catalogPiority}" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="parentId" class="col-form-label">Danh mục cha:</label>
                                        <select name="parentId" id="parentId" class="form-control">
                                            <option value="0">Không có</option>
                                            <c:if test="${not empty catalogs}">
                                                <c:forEach items="${catalogs}" var="c">
                                                    <option value="${c.catalogId}" <c:if test="${catalog.parentId == c.catalogId}">selected</c:if>>${c.catalogName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="catalogStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="catalogStatus" id="catalogStatus" class="form-control" required="required">
                                            <option value="1" <c:if test="${catalog.catalogStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${catalog.catalogStatus == 0}">selected</c:if>>Không kích hoạt</option>
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
