<%-- 
    Document   : category-update
    Created on : Aug 21, 2020, 1:46:40 AM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/category.htm" class="breadcrumb-link">Danh mục sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cập nhật danh mục sản phẩm</li>
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
                            <h3 class="card-header"><b>Thông tin danh mục sản phẩm</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/category.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/category/do-update.htm">
                                    <div class="form-group">
                                        <label for="categoryName" class="col-form-label">Tên danh mục sản phẩm</label>
                                        <input name="categoryName" id="categoryName" maxlength="250" type="text" class="form-control" value="${category.categoryName}">
                                        <input name="categoryId" type="hidden" value="${category.categoryId}">
                                    </div>
                                    <div class="form-group">
                                        <label for="parentId" class="col-form-label">Danh mục cha:</label>
                                        <select name="parentId" id="parentId" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="0" <c:if test="${category.parentId == 0}">selected</c:if>>Không có danh mục cha</option>
                                            <c:if test="${not empty categories}">
                                                <c:forEach items="${categories}" var="c">
                                                    <option value="${c.categoryId}" <c:if test="${category.parentId == c.categoryId}">selected</c:if>>${c.categoryName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="categoryPiority" class="col-form-label">Độ ưu tiên:</label>
                                        <input name="categoryPiority" id="categoryPiority" maxlength="250" type="text" class="form-control" value="${category.categoryPiority}">
                                    </div>
                                    <div class="form-group">
                                        <label for="categoryStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="categoryStatus" id="categoryStatus" class="form-control" required="required">
                                            <option value="1" <c:if test="${category.categoryStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${category.categoryStatus == 0}">selected</c:if>>Không kích hoạt</option>
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
<jsp:include page="widget/footer.jsp" flush="true" />   
