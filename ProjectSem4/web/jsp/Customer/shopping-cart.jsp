<%-- 
    Document   : shopping-cart
    Created on : Aug 17, 2020, 10:37:43 PM
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
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Thanh toán</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <c:if test="${not empty carts}">
                    <div class="order-summary clearfix">
                        <div class="section-title">
                            <h3 class="title">Giỏ hàng</h3>
                        </div>
                        <table class="shopping-cart-table table">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th style="width: 45%;">Thông tin</th>
                                    <th class="text-center">Số lượng</th>
                                    <th class="text-center">Đơn giá</th>
                                    <th class="text-center">Giảm giá</th>
                                    <th class="text-center">Thành tiền</th>
                                    <th class="text-right"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="c">
                                    <tr>
                                        <td class="thumb">
                                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${c.product.productFeatureImage}" alt="${c.product.productName}" />
                                        </td>
                                        <td class="details">
                                            <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${c.product.productId}">${c.product.productName}</a>
                                        </td>
                                        <td class="qty text-center">
                                            <input class="input" id="product-in-cart${c.product.productId}" type="number" value="${c.productQuantity}" min="1" />
                                        </td>
                                        <td class="price text-right">
                                            <strong><fmt:formatNumber value="${c.product.productPrice}" /></strong>
                                            <br>
                                        </td>
                                        <td class="price text-right">
                                            <strong><fmt:formatNumber value="${c.product.productPrice * c.product.productSale / 100 * c.productQuantity}" /></strong>
                                            <br>
                                        </td>
                                        <td class="total text-right">
                                            <strong class="primary-color"><fmt:formatNumber value="${c.product.productPrice * (100 - c.product.productSale) / 100 * c.productQuantity}" /></strong>
                                        </td>
                                        <td class="text-right">
                                            <button class="main-btn icon-btn update-one-cart" data-id="${c.product.productId}"><i class="fa fa-refresh"></i></button>
                                            <button class="main-btn icon-btn remove-one-cart" data-id="${c.product.productId}"><i class="fa fa-close"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th class="empty" colspan="3"></th>
                                    <th>Tổng tiền</th>
                                    <th colspan="2" class="total">
                                        <fmt:formatNumber value="${shoppingCart.totalAmount}" />
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="pull-right">
                            <a class="primary-btn remove-cart" href="">Xoá giỏ hàng</a>
                            <a class="primary-btn" href="${pageContext.request.contextPath}/order/checkout.htm">Thanh toán</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty carts}">
                    <div class="jumbotron">
                        <div class="container">
                            <h4>Chưa có sản phẩm nào!</h4>
                            <p>
                                <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/product/index.htm">Tiếp tục mua sắm</a>
                            </p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>