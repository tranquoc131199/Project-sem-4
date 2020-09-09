<%-- 
    Document   : product-insert
    Created on : Aug 21, 2020, 12:43:24 AM
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
                        <h2 class="pageheader-title">Trang quản trị QTB-Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/product.htm" class="breadcrumb-link">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <form role="form" method="POST" action="${pageContext.request.contextPath}/admin/product/insertProduct.htm" class="wd-100">                       
                        <div class="form-group">
                            <label for="productName" class="col-form-label">Tên sản phẩm:</label>
                            <input id="productName" maxlength="250" name="productName" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="productCode" class="col-form-label">Mã hiệu sản phẩm:</label>
                            <input id="productCode" maxlength="20" name="productCode" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="productPrice" class="col-form-label">Giá:</label>
                            <input id="productPrice" name="productPrice" type="number" min="1000" value="1000" step="1000" class="form-control">
                        </div>                     
                        <div class="form-group">
                            <label for="productSale" class="col-form-label">Mức giảm giá:</label>
                            <input id="productSale" name="productSale" type="number" class="form-control" min="0" value="0">
                        </div>
                        <div class="form-group">
                            <label for="productWarranty" class="col-form-label">Bảo hành:</label>
                            <input id="productWarranty" name="productWarranty" type="number" min="0" step="3" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="categoryId" class="col-form-label">Danh mục:</label>
                            <select name="categoryId" id="categoryId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <c:if test="${not empty listCategory}">
                                    <c:forEach items="${listCategory}" var="listCate">
                                        <option value="${listCate.categoryId}">${listCate.categoryName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="brandId" class="col-form-label">Hãng sản xuất:</label>
                            <select name="brandId" id="brandId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <c:if test="${not empty listBrand}">
                                    <c:forEach items="${listBrand}" var="b">
                                        <option value="${b.brandId}">${b.brandName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="productFeatureImage" class="col-form-label">Ảnh đại diện của sản phẩm:</label>
                            <input type="file" name="productFeatureImage" id="productFeatureImage" class="form-control" maxlength="250" />
                        </div>
                        <div class="form-group">
                            <label for="productDescription" class="col-form-label">Mô tả sản phẩm:</label>
                            <textarea name="productDescription" id="productDescription" class="form-control" rows="3"></textarea>
                            <script>CKEDITOR.replace('productDescription');</script>
                        </div>
                        <div class="form-group">
                            <label for="specificationName" class="col-form-label">Tên thông số kĩ thuật:</label>
                            <textarea name="specificationName" id="specificationName" class="form-control" rows="3"></textarea>

                        </div>
                        <div class="form-group">
                            <label for="specificationValue" class="col-form-label">Thông số kỹ thuật của sản phẩm:</label>
                            <textarea name="specificationValue" id="specificationValue" class="form-control" rows="3"></textarea>
                            <script>CKEDITOR.replace('specificationValue');</script>
                            
                        </div>                     

                        <div class="form-group">
                            <label for="productStatus" class="col-form-label">Trạng thái:</label>
                            <select name="productStatus" id="productStatus" class="form-control" required>
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
</section>

<jsp:include page="widget/footer.jsp" flush="true" />