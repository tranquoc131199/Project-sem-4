<%-- 
    Document   : product-detail
    Created on : Aug 21, 2020, 12:43:33 AM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h2 class="pageheader-title">Trang quản trị QTB-Store</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/product.htm" class="breadcrumb-link">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chi tiết sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/admin/product.htm" class="btn btn-sm btn-primary"><i class="fas fa-reply"></i> Quay lại</a>
            <div class="clearfix"><br/></div>
            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0  m-b-30">
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${product.productFeatureImage}" class="img-fluid" alt="${product.productName}" />
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
                                <div class="product-details">
                                    <div class="border-bottom pb-3 mb-3">
                                        <h2 class="mb-3">${product.productName}</h2>
                                        <div class="product-rating d-inline-block float-right">
                                            <c:if test="${product.productStarAvg == 5}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg > 4 && product.productStarAvg < 5}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg == 4}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg > 3 && product.productStarAvg < 4}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg == 3}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg > 2 && product.productStarAvg < 3}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg == 2}">
                                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg > 1 && product.productStarAvg < 2}">
                                                <i class='fa fa-star'></i><i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg == 1}">
                                                <i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg > 0 && product.productStarAvg < 1}">
                                                <i class='fa fa-star-half'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                            <c:if test="${product.productStarAvg == 0}">
                                                <i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                            </c:if>
                                        </div>
                                        <c:if test="${product.productSale > 0}">
                                            <h3 class="mb-0 text-primary"><fmt:formatNumber value="${product.productPrice * (100 - product.productSale) / 100}" /> <small style="color: red"><del><b><fmt:formatNumber value="${product.productPrice}" /></b></del></small></h3>
                                        </c:if>
                                        <c:if test="${product.productSale == 0}">
                                            <h3 class="mb-0 text-primary"><fmt:formatNumber value="${product.productPrice}" /></h3>
                                        </c:if>
                                    </div>
                                    <div class="product-colors border-bottom">
                                        <h4><b>Hãng sản xuất</b></h4>
                                        <div>${product.brandId.brandName}</div>
                                    </div>
                                    <div class="product-size border-bottom">
                                        <h4><b>Danh mục</b></h4>
                                        <div>${product.categoryId.categoryName}</div>
                                        <div class="product-qty">
                                            <h4>Mã hiệu:</h4>
                                            <div>${product.productCode}</div>
                                        </div>
                                    </div>
                                    <div class="clearfix"><br/></div>
                                    <div class="product-description">
                                        <h4><b>Số lượng đã bán ra:</b> ${product.productSaleQuantity}</h4> <p></p>
                                        <h4><b>Ngày tạo:</b> <fmt:formatDate value="${product.createdDate}" /></h4> <p></p>
                                        <h4><b>Ngày cập nhật:</b> <fmt:formatDate value="${product.updatedDate}" /></h4> <p></p>
                                    </div>
                                    <div class="product-description">
                                        <a href="${pageContext.request.contextPath}/admin/product/initUpdateProduct.htm?productId=${product.productId}" class="btn btn-primary btn-lg"><i class="fas fa-edit"></i> Sửa sản phẩm</a>
                                        <c:if test="${product.productStatus == 1}">
                                            <a href="${pageContext.request.contextPath}/admin/product/disable.htm?productId=${product.productId}" class="btn btn-secondary btn-lg"><i class="fas fa-lock"></i> Khoá sản phẩm</a>
                                        </c:if>
                                        <c:if test="${product.productStatus == 0}">
                                            <a href="${pageContext.request.contextPath}/admin/product/enable.htm?productId=${product.productId}" class="btn btn-success btn-lg"><i class="fas fa-lock-open"></i> Mở khoá sản phẩm</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
                                <div class="simple-card">
                                    <ul class="nav nav-tabs" id="myTab5" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active border-left-0" id="product-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="product-tab-1" aria-selected="true">Thông số kỹ thuật</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="product-tab-3" data-toggle="tab" href="#tab-2" role="tab" aria-controls="product-tab-2" aria-selected="false">Hình ảnh sản phẩm</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="product-tab-2" data-toggle="tab" href="#tab-3" role="tab" aria-controls="product-tab-3" aria-selected="false">Đánh giá</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="product-tab-4" data-toggle="tab" href="#tab-4" role="tab" aria-controls="product-tab-4" aria-selected="false">Mô tả sản phẩm</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent5">
                                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="product-tab-1">
                                             ${product.specificationValue}
                                        </div>
                                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="product-tab-2">
                                            <form action="${pageContext.request.contextPath}/admin/product/insertProductImage.htm" method="POST" >
                                                <input type="file" name="productImage" />
                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                <button type="submit" class="btn btn-sm btn-primary">Thêm hình ảnh</button>
                                            </form>
                                            <div class="row">
                                                <c:if test="${not empty listImage}">
                                                    <c:forEach items="${listImage}" var="img">
                                                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12 m-b-10 product-img">
                                                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${img.productImage}" alt="${product.productName}" class="img-fluid" style="height: 350px;" />
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="product-tab-3">
                                            <c:if test="${not empty productComments}">
                                                <c:forEach items="${productComments}" var="cmt">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <img class="img-responsive" style="width: 5%" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Customers/${cmt.customerId.customerAvatar}" />
                                                            <a href="${pageContext.request.contextPath}/admin/customer/detail.htm?customerId=${cmt.customerId}">${cmt.customerId.customerFullName}</a>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <span>
                                                                <c:if test="${cmt.productCommentRate == 5}">
                                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                                </c:if>
                                                                <c:if test="${cmt.productCommentRate == 4}">
                                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i>
                                                                </c:if>
                                                                <c:if test="${cmt.productCommentRate == 3}">
                                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                                </c:if>
                                                                <c:if test="${cmt.productCommentRate == 2}">
                                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                                </c:if>
                                                                <c:if test="${cmt.productCommentRate == 1}">
                                                                    <i class='fa fa-star'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i><i class='fa fa-star-o'></i>
                                                                </c:if>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                        <div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="product-tab-4" style="overflow: hidden;">
                                            ${product.productDescription}
                                        </div>
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