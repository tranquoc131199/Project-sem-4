<%-- 
    Document   :new-detail
    Document   :
    Created on : Aug 23, 2020, 12:24:51 PM
    Author     : Acer Nitro 5
--%>

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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/new.htm" class="breadcrumb-link">Tin tức</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chi tiết tin tức</li>
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
                            <a href="${pageContext.request.contextPath}/admin/new.htm" class="btn btn-xs btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
                            <div class="clearfix"><br></div>
                            <h3>${news.newTitle}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="m-b-20">
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${news.newImage}" class="img-fluid" alt="${news.newTitle}" style="max-width: 150px;" />
                                    </div>
                                    <div class="m-b-20">
                                        ${news.newContent}
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="float-xl-right float-none mt-xl-0 mt-4">
                                        <i class="fas fa-user mr-2 text-secondary"></i> ${news.adminId.adminFullName}
                                        <i class="fas fa-clock mr-2 text-secondary"></i> <fmt:formatDate value="${news.createdDate}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="font-20"><b>Danh mục tin tức</b></h3>
                            <c:if test="${not empty catalogs}">
                                <c:forEach items="${catalogs}" var="c">
                                    <div class="m-b-10">
                                        <a href="${pageContext.request.contextPath}/admin/new.htm?catalogId=${c.catalogId}" class="text-secondary">${c.catalogName}</a>
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
