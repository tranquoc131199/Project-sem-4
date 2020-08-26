<%-- 
    Document   : categories-list
    Created on : Aug 21, 2020, 1:45:51 AM
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
                        <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh mục sản phẩm</li>
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
                                <a href="${pageContext.request.contextPath}/admin/category/initInsertCategory.htm" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Thêm mới danh mục sản phẩm</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên danh mục</th>
                                                <th>Độ ưu tiên</th>
                                                <th>Danh mục cha</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty allCategory}">
                                                <c:forEach items="${allCategory}" var="allCate"> 
                                                    <tr>
                                                        <td>${allCate.categoryName}</td>
                                                        <td>${allCate.categoryPiority}</td>
                                                        <td>${allCate.parentName}</td>
                                                        <td>
                                                            <c:if test="${allCate.categoryStatus == 1}">
                                                                <span class="badge badge-success">Kích hoạt</span>
                                                            </c:if>
                                                            <c:if test="${allCate.categoryStatus == 0}">
                                                                <span class="badge badge-danger">Không kích hoạt</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${allCate.categoryStatus == 1}">
                                                                <a href="${pageContext.request.contextPath}/admin/category/disable.html?categoryId=${c.categoryId}" class="btn btn-sm btn-secondary"><i class="fas fa-lock"></i> Huỷ kích hoạt</a>
                                                            </c:if>
                                                            <c:if test="${allCate.categoryStatus == 0}">
                                                                <a href="${pageContext.request.contextPath}/admin/category/enable.html?categoryId=${c.categoryId}" class="btn btn-sm btn-success"><i class="fas fa-lock-open"></i> Kích hoạt</a>
                                                            </c:if>
                                                        </td>
                                                    </tr>  
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <nav aria-label='Page navigation example'>
                                        <ul class='pagination'>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;&laquo;</a></li>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;</a></li>
                                            <li class='active page-item'><span class='page-link'>1</span></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=2'>2</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=3'>3</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=2'>&raquo;</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=3'>&raquo;&raquo;</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true" />