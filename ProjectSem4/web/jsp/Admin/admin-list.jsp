<%-- 
    Document   : admin-list
    Created on : 
    Author     : Thang Pham
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>

<section class="dashboard-wrapper">
    <div class="influence-finder">
        <div class="container-fluid dashboard-content">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTBStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách quản trị viên</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <a href="${pageContext.request.contextPath}/admin/admin-insert.htm" class="btn btn-secondary"><i class="fas fa-plus"></i> Thêm mới quản trị viên</a>
                            <div class="clearfix"><br></div>
                            <form method="POST" action="${pageContext.request.contextPath}/admin/admin-search.htm">
                                <input class="form-control form-control-lg" name="adminEmail" type="search" placeholder="Tìm kiếm quản trị viên theo email..." aria-label="Search">
                                <button class="btn btn-primary search-btn" type="submit">Tìm</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-8 col-md-8 col-sm-12 col-12">
                    <c:if test="${not empty admins}">
                        <c:forEach items="${admins}" var="a">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="row">
                                                <div class="col-md-2 user-avatar float-xl-left pr-4 float-none">
                                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Admins/${a.adminAvatar}" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                                    
                                                    <div class="m-b-0">
                                                        <div class="user-avatar-name d-inline-block">
                                                            <h2 class="font-24 m-b-10">${a.adminFullName}</h2>
                                                        </div>
                                                        <br/>
                                                        <c:if test="${a.adminStatus == 1}">
                                                            <span class='badge badge-danger'>Quản trị viên</span>
                                                        </c:if>
                                                        <c:if test="${a.adminStatus == 2}">
                                                            <span class='badge badge-secondary'>Quản lý cấp cao</span>
                                                        </c:if>
                                                        <c:if test="${a.adminStatus == 3}">
                                                            <span class='badge badge-success'>Quản lý</span>
                                                        </c:if>
                                                        <c:if test="${a.adminStatus == 4}">
                                                            <span class='badge badge-primary'>Người kiểm duyệt</span>
                                                        </c:if>
                                                        <c:if test="${a.adminStatus == 5}">
                                                            <span class='badge badge-info'>Nhân viên</span>
                                                        </c:if>
                                                        <c:if test="${a.adminStatus == 0}">
                                                            <span class='badge badge-dark'>Đang khoá</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="col-md-10 pl-xl-3">
                                                    <div class="user-avatar-address">
                                                        <p class="mb-2">
                                                            <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">${a.adminAddress}</span>
                                                        </p>
                                                        <p class="mb-2">
                                                            <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <c:if test="${a.adminGender == 1}"><span class="m-l-10">Nam</span></c:if><c:if test="${a.adminGender == 0}"><span class="m-l-10">Nữ</span></c:if>
                                                        </p>
                                                        <p class="mb-2">
                                                            <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10"><fmt:formatDate value="${a.adminBirthday}" /></span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="float-xl-right float-none mt-xl-0 mt-4">
                                                <a href="${pageContext.request.contextPath}/admin/admin-info.htm?adminId=${a.adminId}" class="btn btn-secondary">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
