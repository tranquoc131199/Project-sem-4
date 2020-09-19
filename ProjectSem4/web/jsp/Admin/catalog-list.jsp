<%-- 
    Document   : catalog-list
    Created on : Jun 6, 2019, 5:12:37 PM
    Author     : QuanKoiNA
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
                        <h2 class="pageheader-title">Trang quản trị QTCB-tore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh mục tin tức</li>
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
                                <a href="${pageContext.request.contextPath}/admin/new.htm" class="btn btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
                                <a href="${pageContext.request.contextPath}/admin/catalog/insert.htm" class="btn btn-success"><i class="fas fa-plus"></i> Thêm mới danh mục tin</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên danh mục tin</th>
                                                <th>Danh mục cha</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty catalogs}">
                                                <c:forEach items="${catalogs}" var="c">
                                                    <tr>
                                                        <td>${c.catalogName}</td>
                                                        <td>
                                                            <span>${c.parentName}</span>
                                                        </td>
                                                        <td>
                                                            <c:if test="${c.catalogStatus == 1}">
                                                                <span class="badge badge-success">Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${c.catalogStatus == 0}">
                                                                <span class="badge badge-danger">Không kích hoạt</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/new.htm?catalogId=${c.catalogId}" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem tin thuộc danh mục</a>
                                                            <a href="${pageContext.request.contextPath}/admin/catalog/update.htm?catalogId=${c.catalogId}" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                            <c:if test="${c.catalogStatus == 1}">
                                                                <a href="${pageContext.request.contextPath}/admin/catalog/disable.htm?catalogId=${c.catalogId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Huỷ kích hoạt</a>
                                                            </c:if>
                                                            <c:if test="${c.catalogStatus == 0}">
                                                                <a href="${pageContext.request.contextPath}/admin/catalog/enable.htm?catalogId=${c.catalogId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Kích hoạt</a>
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
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
