<%-- 
    Document   :new-update
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
                        <h2 class="pageheader-title">Trang quản trị QTBStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/new.htm" class="breadcrumb-link">Tin tức</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa tin tức</li>
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
                            <h3 class="card-header"><b>Chỉnh sửa tin tức</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/new.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/new/update.htm" role="form" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="catalogId" class="col-form-label">Chuyên mục tin:</label>
                                        <select name="catalogId" id="catalogId" class="form-control" required="required">
                                            <c:if test="${not empty catalogs}">
                                                <c:forEach items="${catalogs}" var="c">
                                                    <option value="${c.catalogId}" <c:if test="${news.catalogId.catalogId == c.catalogId}">selected</c:if>>${c.catalogName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="newTitle" class="col-form-label">Tiêu đề:</label>
                                        <input id="newTitle" name="newTitle" type="text" maxlength="250" class="form-control" value="${news.newTitle}" />
                                        <input type="hidden" name="newId" value="${news.newId}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="newImage" class="col-form-label">Hình ảnh:</label>
                                        <br />
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${news.newImage}" alt="${n.newTitle}" class="img-fluid" style="max-width: 150px;" />
                                        <input type="file" class="form-control" maxlength="250" name="newImage" id="newImage" value="${news.newImage}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="newDescription" class="col-form-label">Mô tả ngắn:</label>
                                        <input id="newDescription" name="newDescription" maxlength="250" type="text" class="form-control" value="${news.newDescription}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="newContent" class="col-form-label">Nội dung bài viết:</label>
                                        <textarea name="newContent" id="newContent" class="form-control" rows="4" required="required">${news.newContent}</textarea>
                                        <script>CKEDITOR.replace('newContent');</script>
                                    </div>
                                    <div class="form-group">
                                        <label for="newStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="newStatus" id="newStatus" class="form-control" required="required">
                                            <option value="1" <c:if test="${news.newStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${news.newStatus == 0}">selected</c:if>>Không kích hoạt</option>
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
    </section>

<jsp:include page="widget/footer.jsp" flush="true"/>
