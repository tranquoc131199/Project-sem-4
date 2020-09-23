<%-- 
    Document   : customer-feedback
    Created on : 
    Author     : Thang Pham
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách phản hồi</li>
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
                                <a href="${pageContext.request.contextPath}/admin/feedback/catalog.htm" class="btn btn-success"><i class="fas fa-server"></i> Danh mục phản hồi</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên</th>
                                                <th>Điện thoại</th>
                                                <th>Email</th>
                                                <th>Địa chỉ</th>
                                                <th>Thời gian</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty feedbacks}">
                                                <c:forEach items="${feedbacks}" var="fb">
                                                    <tr>
                                                        <td>${fb.feedbackFullname}</td>
                                                        <td><a href="tel:${fb.feedbackPhone}">${fb.feedbackPhone}</a></td>
                                                        <td>${fb.feedbackEmail}</td>
                                                        <td>${fb.feedbackAddress}</td>
                                                        <td><i class="fas fa-clock mr-2 text-primary"></i> <fmt:formatDate value="${fb.feedbacksTime}" /></td>
                                                        <td>
                                                            <c:if test="${fb.feedbackStatus == 1}">
                                                                <span class="badge badge-warning">Chưa đọc</span>
                                                            </c:if>
                                                            <c:if test="${fb.feedbackStatus == 0}">
                                                                <span class="badge badge-success">Đã đọc</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/feedback/detail.htm?feedbackId=${fb.feedbackId}" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem</a>
                                                            <a href="${pageContext.request.contextPath}/admin/feedback/delete.htm?feedbackId=${fb.feedbackId}" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                        <c:if test="${not empty pagingHtml}">
                                            <tfoot>
                                                <tr>
                                                    <td colspan="7">
                                                        ${pagingHtml}
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </c:if>
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
                    Copyright © 2018 ThangPD. All rights reserved customize by <a href="https://facebook.com/quancoina/" target="_blank">Thang Pham</a>.
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
