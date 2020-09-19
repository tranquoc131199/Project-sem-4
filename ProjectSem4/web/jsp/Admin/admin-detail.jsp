<%-- 
    Document   : admin-detail
    Created on : Jun 6, 2019, 5:08:26 PM
    Author     : Thang Pham
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>
<h1>abc</h1>
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.html" class="breadcrumb-link">Quản trị viên</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thông tin quản trị viên</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/admin/index.html" class="btn btn-sm btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
            <br/>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="user-avatar text-center d-block">
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Admins/${admin.adminAvatar}" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                            </div>
                            <div class="text-center">
                                <h2 class="font-24 mb-0">${admin.adminFullName}</h2>
                                <p>
                                    <c:if test="${admin.adminStatus == 1}">
                                        <span class='badge badge-danger'>Quản trị viên</span>
                                    </c:if>
                                    <c:if test="${admin.adminStatus == 2}">
                                        <span class='badge badge-secondary'>Quản lý cấp cao</span>
                                    </c:if>
                                    <c:if test="${admin.adminStatus == 3}">
                                        <span class='badge badge-success'>Quản lý</span>
                                    </c:if>
                                    <c:if test="${admin.adminStatus == 4}">
                                        <span class='badge badge-primary'>Người kiểm duyệt</span>
                                    </c:if>
                                    <c:if test="${admin.adminStatus == 5}">
                                        <span class='badge badge-info'>Nhân viên</span>
                                    </c:if>
                                    <c:if test="${admin.adminStatus == 0}">
                                        <span class='badge badge-dark'>Đang khoá</span>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <div class="card-body border-top">
                            <h3 class="font-16">Thông tin liên lạc</h3>
                            <div class="">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i><a href="malto:${admin.adminEmail}">${admin.adminEmail}</a></li>
                                    <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i><a href="tel:${admin.adminPhone}">${admin.adminPhone}</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                    <div class="influence-profile-content pills-regular">
                        <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="pills-information-tab" data-toggle="pill" href="#pills-information" role="tab" aria-controls="pills-information" aria-selected="true">Thông tin cá nhân</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-information" role="tabpanel" aria-labelledby="pills-information-tab">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="section-block">
                                            <h2 class="section-title">Thông tin cá nhân</h2>
                                        </div>
                                    </div>
                                    <table>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-user mr-2 text-secondary"></i>Giới tính:</th>
                                            <td>
                                                <c:if test="${admin.adminGender == 1}">Nam</c:if><c:if test="${admin.adminGender == 0}">Nữ</c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="padding-right: 20px;"><i class="fas fa-calendar-alt mr-2 text-secondary"></i>Ngày sinh:</th>
                                                    <td><fmt:formatDate value="${admin.adminBirthday}" /></td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-envelope mr-2 text-secondary"></i>Email:</th>
                                            <td><a href="mailto:${admin.adminEmail}">${admin.adminEmail}</a></td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-phone mr-2 text-secondary"></i>Điện thoại:</th>
                                            <td><a href="tel:${admin.adminPhone}">${admin.adminPhone}</a></td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-address-card mr-2 text-secondary"></i>Quê quán:</th>
                                            <td>${admin.adminHomeLand}</td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-map-signs mr-2 text-secondary"></i>Địa chỉ:</th>
                                            <td>${admin.adminAddress}</td>
                                        </tr>
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
                    Copyright © 2018 QTCStore. All rights reserved customize by <a href="https://facebook.com/phamducthang452/" target="_blank">ThangPD</a>.
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
