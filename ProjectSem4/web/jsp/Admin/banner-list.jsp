<%-- 
    Document   : banner-list
    Created on : 
    Author     : Thang Pham
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
                        <h2 class="pageheader-title">Trang quản trị QTBStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Banner</li>
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
                                <a href="${pageContext.request.contextPath}/admin/banner/insert.htm" class="btn btn-success"><i class="fas fa-plus"></i> Thêm mới banner</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Hình ảnh</th>
                                                <th>Mô tả</th>
                                                <th>Độ ưu tiên</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty banners}">
                                                <c:forEach items="${banners}" var="b">
                                                    <tr>
                                                        <td>
                                                            <img class="img-fluid" style="max-height: 150px;" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/${b.bannerImage}" alt="${b.bannerDescription}" />
                                                        </td>
                                                        <td>${b.bannerDescription}</td>
                                                        <td>${b.bannerPiority}</td>
                                                        <td>
                                                            <c:if test="${b.bannerStatus == 1}">
                                                                <span class="badge badge-success">Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${b.bannerStatus == 0}">
                                                                <span class="badge badge-danger">Không kích hoạt</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/banner/update.htm?bannerId=${b.bannerId}" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                            <c:if test="${b.bannerStatus == 1}">
                                                                <a href="${pageContext.request.contextPath}/admin/banner/disable.htm?bannerId=${b.bannerId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Huỷ kích hoạt</a>
                                                            </c:if>
                                                            <c:if test="${b.bannerStatus == 0}">
                                                                <a href="${pageContext.request.contextPath}/admin/banner/enable.htm?bannerId=${b.bannerId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Kích hoạt</a>
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
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    Copyright © 2018 ThangPD. All rights reserved customize by <a href="https://facebook.com/quancoina/" target="_blank">ThangPD</a>.
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
