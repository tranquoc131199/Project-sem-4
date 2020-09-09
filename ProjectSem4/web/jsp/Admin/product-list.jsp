<%-- 
    Document   : product-list
    Created on : Aug 21, 2020, 12:17:23 AM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTB-Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget" id="append-products">
                <div class="row">
                    <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                        <a href="${pageContext.request.contextPath}/admin/product/initInsertProduct.htm" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Thêm mới sản phẩm</a>
                        <div class="clearfix"><br></div>
                        <div class="row">
                            <c:if test="${not empty allProduct}">
                                <c:forEach items="${allProduct}" var="allPro">
                                    <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="product-thumbnail">
                                            <div class="product-img-head">
                                                <div class="product-img">
                                                    <a href="${pageContext.request.contextPath}/admin/product/detail.html?productId=${allPro.productId}">
                                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${allPro.productFeatureImage}" alt="" class="img-fluid">
                                                    </a>
                                                </div>
                                                <div class="ribbons"></div>
                                                <div class="ribbons-text">
                                                     ${allPro.productSale}%
                                                </div>
                                                <div class="product-price"><fmt:formatNumber value="${allPro.productPrice}" /> VNĐ</div>
                                            </div>
                                            <div class="product-content">
                                                <div class="product-content-head">
                                                    <h3 class="product-title">
                                                        <a href="${pageContext.request.contextPath}/admin/product/detail.html?productId=${allPro.productId}" title="${allPro.productName}">
                                                            ${allPro.productName}</a>
                                                    </h3>
                                                    <div class="product-rating d-inline-block">
                                                        <c:if test="${allPro.productStarAvg == 5}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg > 4 && p.productStarAvg < 5}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg == 4}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg > 3 && p.productStarAvg < 4}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg == 3}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg > 2 && p.productStarAvg < 3}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg == 2}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg > 1 && p.productStarAvg < 2}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg == 1}">
                                                            <i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg > 0 && p.productStarAvg < 1}">
                                                            <i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                        <c:if test="${allPro.productStarAvg == 0}">
                                                            <i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="product-btn">
                                                    <a href="${pageContext.request.contextPath}/admin/product/detailProduct.htm?productId=${allPro.productId}" class="btn btn-primary">Xem chi tiết</a>
                                                    <a href="${pageContext.request.contextPath}/admin/product/initUpdateProduct.htm?productId=${allPro.productId}" class="btn btn-outline-light">Sửa sản phẩm</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <nav aria-label='Page navigation example'>
                                    <ul class='pagination'>
                                        <li class='disabled page-item'><a class='page-link'>&laquo;&laquo;</a></li>
                                        <li class='disabled page-item'><a class='page-link'>&laquo;</a></li>
                                        <li class='active page-item'><span class='page-link'>1</span></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=2&brandId=0&categoryId=0&keyword='>2</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=3&brandId=0&categoryId=0&keyword='>3</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=4&brandId=0&categoryId=0&keyword='>4</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=5&brandId=0&categoryId=0&keyword='>5</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=2&brandId=0&categoryId=0&keyword='>&raquo;</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=5&brandId=0&categoryId=0&keyword='>&raquo;&raquo;</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                        <div class="product-sidebar">
                            <div class="product-sidebar-widget">
                                <h4 class="mb-0">Bộ lọc</h4>
                            </div>
                            <div class="product-sidebar-widget">
                                <h4 class="product-sidebar-widget-title">Danh mục</h4>
                                <c:if test="${not empty category}">
                                    <c:forEach items="${category}" var="c">
                                        <a href="${pageContext.request.contextPath}/admin/product.htm?brandId=${brandId}&categoryId=${c.categoryId}">
                                            <div class="custom-control span-around <c:if test="${c.categoryId == categoryId}">active</c:if>">
                                                <span>${c.categoryName}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="product-sidebar-widget">
                                <h4 class="product-sidebar-widget-title">Hãng</h4>
                                <c:if test="${not empty brand}">
                                    <c:forEach items="${brand}" var="b">
                                        <a href="${pageContext.request.contextPath}/admin/product.html?brandId=${b.brandId}&categoryId=${categoryId}">
                                            <div class="custom-control span-around <c:if test="${brandId == b.brandId}">active</c:if>">
                                                <span>${b.brandName}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <div class="product-sidebar-widget">
                                <a href="/Admin/BackendProduct/ResetFilter" class="btn btn-outline-light" id="reset-filter">Tạo lại bộ lọc</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true" />
