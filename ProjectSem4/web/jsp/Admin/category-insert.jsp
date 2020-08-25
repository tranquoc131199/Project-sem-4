<%-- 
    Document   : category-insert
    Created on : Aug 21, 2020, 1:46:16 AM
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendCategory" class="breadcrumb-link">Danh mục sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới danh mục sản phẩm</li>
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
                                <form method="POST" action="/Admin/BackendCategory/CreateCategory">
                                    <input name="__RequestVerificationToken" type="hidden" value="I_Sor-_TpwASnztZh8o4bS7S_Q-0hPg8r_SZ6jcvgXjchCDttBgj4Oh0qm-BnQgg3vm8zo0OXv54NSavkdj94RWFYTtpD8aMVJfzuuAI4Qw1" />
                                    <div class="form-group">
                                        <label for="CategoryName" class="col-form-label">Tên danh mục sản phẩm</label>
                                        <input id="CategoryName" name="CategoryName" maxlength="250" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="ParentId" class="col-form-label">Danh mục cha:</label>
                                        <select name="ParentId" id="ParentId" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="0">Không có danh mục cha</option>
                                            <c:if test="${not empty categories}">
                                                <c:forEach items="${categories}" var="c">
                                                    <option value="${c.categoryId}">${c.categoryName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="categoryPiority" class="col-form-label">Độ ưu tiên:</label>
                                        <input name="categoryPiority" readonly="" value="${maxPiority}" id="categoryPiority" type="number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="CategoryStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="CategoryStatus" id="CategoryStatus" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Kích hoạt</option>
                                            <option value="0">Không kích hoạt</option>
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