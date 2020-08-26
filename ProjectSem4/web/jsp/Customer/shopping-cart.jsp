<%-- 
    Document   : shopping-cart
    Created on : Aug 17, 2020, 10:37:43 PM
    Author     : Acer Nitro 5
--%>

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
                <div class="order-summary clearfix">
                    <div class="section-title">
                        <h3 class="title">Giỏ hàng</h3>
                    </div>
                    <table class="shopping-cart-table table">
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Thông tin</th>
                                <th class="text-center">Đơn giá</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Thành tiền</th>
                                <th class="text-right"></th>
                            </tr>
                        </thead>
                        <tbody>
                                    <tr>
                                        <td class="thumb">
                                            <img src="Areas/Admin/Uploads/images/ProductImages/Asus/Laptop/GX531GW-ES006T/GX531GW-ES006T01.jpg" alt="Laptop ASUS ROG Zephyrus S GX531GW-ES006T" />
                                        </td>
                                        <td class="details">
                                            <a href="/Product/Detail?ProductId=46">Laptop ASUS ROG Zephyrus S GX531GW-ES006T</a>
                                        </td>
                                        <td class="price text-center">
                                            <strong>61,990,000</strong>
                                            <br>
                                        </td>
                                        <td class="qty text-center">
                                            <input class="input product-in-cart" type="number" value="1" min="1" data-id="46" />
                                        </td>
                                        <td class="total text-center">
                                            <strong class="primary-color">61,990,000</strong>
                                        </td>
                                        <td class="text-right">
                                            <button class="main-btn icon-btn remove-one-cart" data-id="46"><i class="fa fa-close"></i></button>
                                        </td>
                                    </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>Tổng</th>
                                <th colspan="2" class="sub-total">61,990,000</th>
                            </tr>
                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>Tổng tiền</th>
                                <th colspan="2" class="total">
                                    61,990,000
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                        <div class="pull-right">
                            <a class="primary-btn remove-cart" href="">Xoá giỏ hàng</a>
                            <a class="primary-btn" href="/Order/CheckOut">Thanh toán</a>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>