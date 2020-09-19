<%-- 
    Document   : product-detail
    Created on : Aug 17, 2020, 10:37:20 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/product/index.htm?categoryId=${product.product.categoryId.categoryId}">${product.product.categoryId.categoryName}</a>
            </li>
            <li class="active">${product.product.productName}</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="product product-details clearfix">
                <div class="col-md-6">
                    <div id="product-main-view" >
                        <c:if test="${not empty productImages}">
                            <c:forEach items="${productImages}" var="img">
                                <div class="product-view">
                                    <img  src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${img.productImage}" class="img-responsive" alt="Hình ảnh sản phẩm" />
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="product-view">
                        <c:if test="${not empty productImages}">
                            <c:forEach items="${productImages}" var="img">
                                <div class="product-view">
                                    <img  src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${img.productImage}" class="img-responsive" alt="Hình ảnh sản phẩm" />
                                </div>
                            </c:forEach>
                        </c:if>                      
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-body">
                        <div class="product-label">
                            <span class='text-center'>Mới</span>
                        </div>
                        <h2 class="product-name">${product.product.productName}</h2>
                        <h3 class="product-price"><fmt:formatNumber value="${product.product.productPrice}" /></h3>
                        <div>
                            <div class="product-rating" id="rating-html">
                                ${product.productStarString}
                            </div>
                            <a><span>${countComments}</span> Đánh giá</a>
                        </div>
                        <p><strong>Bảo hành:</strong> ${product.product.productWarranty} tháng</p>
                        <p><strong>Trạng thái:</strong> ${product.getProductStatusString()}</p>
                        <p><strong>Hãng:</strong> ${product.product.brandId.brandName}</p>
                        <p><strong>Danh mục:</strong> ${product.product.categoryId.categoryName}</p>
                        <div class="product-options">
                            <ul class="size-option">
                                <li><span class="text-uppercase"><b>Mã sản phẩm:</b></span></li>
                                <li>${product.product.productCode}</li>
                            </ul>
                        </div>

                        <div class="product-btns">
                            <div class="qty-input">
                                <span class="text-uppercase"><b>Số lượng: </b></span>
                                <input class="input" type="number" id="productQuantity" value="1" min="1" />
                            </div>
                            <button class="primary-btn add-to-cart-from-detail" data-id="${product.product.productId}"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            <div class="pull-right">
                                <a href="#" title="Thêm vào danh sách yêu thích" class="main-btn icon-btn"><i class="fa fa-heart <c:if test="${product.isWishlist}">active</c:if>"></i></a>
                                    <a href="#" title="So sánh" class="main-btn icon-btn"><i class="fa fa-exchange"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="product-tab">
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Mô tả sản phẩm</a></li>
                                <li><a data-toggle="tab" href="#tab2">Thông số kỹ thuật</a></li>
                                <li><a data-toggle="tab" href="#tab3">Đánh giá <span>(${countComments})</span></a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane fade in active" style="overflow: hidden;">
                                ${product.product.productDescription}
                            </div>
                            <div id="tab2" class="tab-pane fade in" style="overflow: hidden;">
                                <p>
                                <p><strong>${product.product.specificationName}</strong></p>

                                <p>${product.product.specificationValue}</p>

                                </p>
                            </div>
                            <div id="tab3" class="tab-pane fade in">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="product-reviews" id="product-comment-append">
                                            <c:if test="${not empty productComments}">
                                                <c:forEach items="${productComments}" var="cmt">
                                                    <div class="single-review">
                                                        <div class="review-heading dp-flex-align">
                                                            <div>
                                                                <img class="img-responsive" style="height: 50px;" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Customers/${cmt.customerId.customerAvatar}" />
                                                            </div>
                                                            <div><a><i class="fa fa-user-o"></i> ${cmt.customerId.customerFullName}</a></div>
                                                            <div><a><i class="fa fa-clock-o"></i> <fmt:formatDate value="${cmt.productCommentTime}" /></a></div>
                                                            <div class="review-rating">
                                                                ${cmt.rateString}
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>${cmt.productCommentContent}</p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h4 class="text-uppercase">Để lại đánh giá của bạn</h4>
                                        <form class="review-form" action="${pageContext.request.contextPath}/product/CommentProduct.htm" method="post">
                                            <input name="__RequestVerificationToken" type="hidden" value="k1ZFqQvu_-DaJ6QHPThpXk61--lRqIO6tgULg9DXiT4-6dYxHWly74fSHVqGDOhyaKi13nYNZxcsXK6Lb45j3eeVLe2pFBlp502q1gC6v141" />
                                            <div class="form-group">
                                                <textarea class="input" name="productCommentContent" placeholder="Nhập đánh giá của bạn..."></textarea>
                                                <input type="hidden" name="productId" value="${product.product.productId}" />
                                            </div>
                                            <div class="form-group">
                                                <div class="input-rating">
                                                    <strong class="text-uppercase">Đánh giá: </strong>
                                                    <div class="stars">
                                                        <input type="radio" id="star5" name="productCommentRate" value="5" checked="" /><label for="star5"></label>
                                                        <input type="radio" id="star4" name="productCommentRate" value="4" /><label for="star4"></label>
                                                        <input type="radio" id="star3" name="productCommentRate" value="3" /><label for="star3"></label>
                                                        <input type="radio" id="star2" name="productCommentRate" value="2" /><label for="star2"></label>
                                                        <input type="radio" id="star1" name="productCommentRate" value="1" /><label for="star1"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="primary-btn">Đánh giá</button>
                                        </form>
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

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Sản phẩm liên quan</h2>
                </div>
            </div>
            <c:if test="${not empty relateProducts}">
                <c:forEach items="${relateProducts}" var="p">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <c:if test="${p.isNewProduct}">
                                        <span class='text-center'>Mới</span>
                                    </c:if>
                                </div>
                                <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${p.product.productFeatureImage}" alt="${p.product.productName}" />
                            </div>
                            <div class="product-body">
                                <h3 class="product-price"><fmt:formatNumber value="${p.product.productPrice}" /></h3>
                                <div class="product-rating">
                                    ${p.productStarString}
                                </div>
                                <h2 class="product-name"><a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}">${p.product.productName}</a></h2>
                                <div class="product-btns">
                                    <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-heart <c:if test="${p.isWishlist}">active</c:if>"></i></a>
                                    <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-exchange"></i></a>
                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="${p.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>