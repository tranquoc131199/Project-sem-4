<%-- 
    Document   :new-list
    Created on : Aug 23, 2020, 12:24:51 PM
    Author     : Acer Nitro 5
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
                                    <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
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
                            <h3 class="card-header"><b>Danh sách tin tức</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/new/initInsert.htm" class="btn btn-sm btn-success"><i class="fas fa-plus"></i> Thêm mới tin</a>
                                <a href="${pageContext.request.contextPath}/admin/catalog.htm" class="btn btn-sm btn-primary"><i class="fas fa-clipboard-list"></i> Danh mục tin</a>
                                <a href="${pageContext.request.contextPath}/admin/catalog/insert.htm" class="btn btn-sm btn-secondary"><i class="fas fa-plus-circle"></i> Thêm mới danh mục</a>
                                <div class="clearfix"><br></div>
                                <select id="choose-catalog" class="form-control" style="width: 30%;">
                                    <option value="0" <c:if test="${empty catalogId}">selected</c:if>>Tất cả tin tức</option>
                                    <c:if test="${not empty catalogs}">
                                        <c:forEach items="${catalogs}" var="c">
                                            <option value="${c.catalogId}" <c:if test="${catalogId == c.catalogId}">selected</c:if>>${c.catalogName}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tiêu đề</th>
                                                <th>Hình ảnh</th>
                                                <th>Mô tả ngắn</th>
                                                <th>Ngày đăng</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty news}">
                                                <c:forEach items="${news}" var="n">
                                                    <tr>
                                                        <td>${n.newTitle}</td>
                                                        <td>
                                                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${n.newImage}" alt="${n.newTitle}" class="img-fluid" style="max-width: 150px;" />
                                                        </td>
                                                        <td>${n.newDescription}</td>
                                                        <td><fmt:formatDate value="${n.createdDate}" /></td>
                                                        <td>
                                                            <c:if test="${n.newStatus == 1}">
                                                                <span class="badge badge-success">Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${n.newStatus == 0}">
                                                                <span class="badge badge-danger">Không kích hoạt</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/new/detail.htm?newId=${n.newId}" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                            <a href="${pageContext.request.contextPath}/admin/new/initUpdate.htm?newId=${n.newId}" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                            <c:if test="${n.newStatus == 1}">
                                                                <a href="${pageContext.request.contextPath}/admin/new/disable.htm?newId=${n.newId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Huỷ kích hoạt</a>
                                                            </c:if>
                                                            <c:if test="${n.newStatus == 0}">
                                                                <a href="${pageContext.request.contextPath}/admin/new/enable.htm?newId=${n.newId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Kích hoạt</a>
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

<script>
    $(document).ready(function () {
        $("#choose-catalog").change(function (event) {
            event.preventDefault();

            var catalogId = $("#choose-catalog").val();

            if (catalogId == 0) {
                window.location.href = "${pageContext.request.contextPath}/admin/new.htm";
            } else {
                window.location.href = "${pageContext.request.contextPath}/admin/new.htm?catalogId=" + catalogId;
            }
        });
    });
</script>

<jsp:include page="widget/footer.jsp" flush="true"/>
