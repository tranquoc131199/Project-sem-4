<%-- 
    Document   : feedback-detail
    Created on : 
    Author     : Thang Pham
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/feedback.htm" class="breadcrumb-link">Phản hồi</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Phản hồi</li>
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
                            <a href="${pageContext.request.contextPath}/admin/feedback.htm" class="btn btn-xs btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <table>
                                        <tbody>
                                            <tr class="m-b-10">
                                                <td><i class="fas fa-server mr-2 text-primary"></i></td>
                                                <td><b><u>Danh mục phản hồi:</u></b></td>
                                                <td>${feedback.feedbackCatalogId.feedbackCatalogName}</td>
                                            </tr>
                                            <tr class="m-b-10">
                                                <td><i class="fas fa-user mr-2 text-primary"></i></td>
                                                <td><b><u>Tên người gửi:</u></b></td>
                                                <td>${feedback.feedbackFullname}</td>
                                            </tr>
                                            <tr class="m-b-10">
                                                <td><i class="fas fa-phone mr-2 text-primary"></i></td>
                                                <td><b><u>Số điện thoại người gửi:</u></b></td>
                                                <td>${feedback.feedbackPhone}</td>
                                            </tr>
                                            <tr class="m-b-10">
                                                <td><i class="fas fa-envelope mr-2 text-primary"></i></td>
                                                <td><b><u>Email người gửi:</u></b></td>
                                                <td>${feedback.feedbackEmail}a</td>
                                            </tr>
                                            <tr class="m-b-10">
                                                <td><i class="fas fa-map-signs mr-2 text-primary"></i></td>
                                                <td><b><u>Địa chỉ người gửi:</u></b></td>
                                                <td>${feedback.feedbackAddress}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"><hr></div>
                                    <div class="m-b-20">
                                        <p><b><u>Nội dung phản hồi:</u></b></p>
                                        ${feedback.feedbackContent}
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="float-xl-right float-none mt-xl-0 mt-4">
                                        <i class="fas fa-clock mr-2 text-primary"></i> <fmt:formatDate value="${feedback.feedbacksTime}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="font-20"><b>Danh mục phản hồi</b></h3>
                            <c:if test="${not empty feedbackCatalogs}">
                                <c:forEach items="${feedbackCatalogs}" var="fbc">
                                    <div class="m-b-10">
                                        <a href="${pageContext.request.contextPath}/admin/feedback.htm?feedbackCatalogId=${fbc.feedbackCatalogId}" class="text-secondary">${fbc.feedbackCatalogName}</a>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
