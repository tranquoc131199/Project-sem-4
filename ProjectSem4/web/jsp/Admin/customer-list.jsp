<%-- 
    Document   : customer-list
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
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách khách hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <c:if test="${not empty customers}">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/admin/customer/search.htm">
                                    <input class="form-control form-control-lg" type="search" name="customerName" placeholder="Tìm kiếm khách hàng theo tên..." aria-label="Search">
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-lg-8 col-md-8 col-sm-12 col-12">
                        <c:if test="${not empty customers}">
                            <c:forEach items="${customers}" var="c">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="row">
                                                    <div class="col col-md-2 user-avatar float-xl-left pr-4 float-none text-center">
                                                        <a href="${pageContext.request.contextPath}/admin/customer/detail.htm?customerId=${c.customerId}">
                                                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Customers/${c.customerAvatar}" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                                        </a>
                                                        <h2 class="font-24 m-b-10"><a href="${pageContext.request.contextPath}/admin/customer/detail.htm?customerId=${c.customerId}">${c.customerFullName}</a></h2>
                                                        <p>
                                                            <c:if test="${c.customerStatus == 1}">
                                                                <span class='badge badge-success'>Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${c.customerStatus == 0}">
                                                                <span class='badge badge-danger'>Bị khoá</span>
                                                            </c:if>
                                                            <c:if test="${c.customerStatus == 2}">
                                                                <span class='badge badge-warning'>Chưa kích hoạt</span>
                                                            </c:if>
                                                        </p>
                                                    </div>
                                                    <div class="col col-md-10 pl-xl-3">
                                                        <div class="user-avatar-address">
                                                            <p class="mb-2">
                                                                <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">${c.customerAddress}</span>
                                                            </p>
                                                            <p class="mb-2">
                                                                <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <span class="m-l-10">${c.customerGender}</span>
                                                            </p>
                                                            <p class="mb-2">
                                                                <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10"><fmt:formatDate value="${c.customerBirthday}" /></span>
                                                            </p>
                                                            <p class="mb-2">
                                                                <i class="fas fa-envelope mr-2 text-primary"></i>Email: <span class="m-l-10">${c.customerEmail}</span>
                                                            </p>
                                                            <p class="mb-2">
                                                                <i class="fas fa-phone mr-2 text-primary"></i>Điện thoại: <span class="m-l-10">${c.customerPhone}</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty paging}">
                            <div class="card">
                                <div class="card-body">
                                    ${paging}
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:if>
                <c:if test="${empty customers}">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <h2>Chưa có khách hàng nào!</h2>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
