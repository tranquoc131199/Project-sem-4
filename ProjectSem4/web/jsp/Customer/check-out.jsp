<%-- 
    Document   : check-out
    Created on : Aug 17, 2020, 10:36:16 PM
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
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li class="active">Thanh toán</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <form id="checkout-form" class="clearfix" method="POST" action="${pageContext.request.contextPath}/order/check-out-next.htm">
                <input name="__RequestVerificationToken" type="hidden" value="Jl5mW4jKDXVoV0_QCdzwASDq0hdoXaALEEy_PGPtm-X8MCa4y6WE0qKwiJZut0Bm6flMIE2yIz7VAh3Lb4VhtfAPFmczikpiv0xRxv1x4vk1" />
                <div class="col-md-6">
                    <div class="billing-details">
                        <c:if test="${empty customer}">
                            <p>Đã có tài khoản ? <a href="${pageContext.request.contextPath}/customer/login.htm">Đăng nhập</a></p>
                            <div class="section-title">
                                <h3 class="title">Chi tiết đặt hàng</h3>
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerFullname" placeholder="Họ và tên">
                            </div>
                            <div class="form-group">
                                <input class="input" type="date" name="customerBirthday">
                            </div>
                            <div class="form-group">
                                <select name="CustomerGender" id="input" class="input" required="required">
                                    <option value="">Giới tính</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="customerEmail" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerPhone" placeholder="Điện thoại">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerAddress" placeholder="Địa chỉ">
                            </div>
                            <div class="form-group">
                                <div class="input-checkbox">
                                    <input type="checkbox" id="register">
                                    <label class="font-weak" for="register">Tạo tài khoản?</label>
                                    <div class="caption">
                                        <input class="input" type="password" name="customerPassword" placeholder="Nhập mật khẩu...">
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${not empty customer}">
                            <div class="section-title">
                                <h3 class="title">Chi tiết đặt hàng</h3>
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerFullname" value="${customer.customerFullName}" placeholder="Họ và tên">
                            </div>
                            <div class="form-group">
                                <input class="input" type="date" name="customerBirthday" value='<fmt:formatDate value="${customer.customerBirthday}" pattern="yyyy-MM-dd" />' >
                            </div>
                            <div class="form-group">
                                <select name="customerGender" id="input" class="input" required="required">
                                    <option value="1" <c:if test="${customer.customerGender == 1}">selected</c:if>>Nam</option>
                                    <option value="0" <c:if test="${customer.customerGender == 0}">selected</c:if>>Nữ</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="customerEmail" value="${customer.customerEmail}" />
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerPhone" value="${customer.customerPhone}" />
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="customerAddress" value="${customer.customerAddress}" />
                            </div>
                            <div class="form-group">
                                <textarea  class="input" rows="4" cols="50" type="text" name="orderNotes" placeholder="Ghi chú bổ sung"></textarea>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="shiping-methods">
                        <div class="section-title">
                            <h4 class="title">Phương thức vận chuyển</h4>
                        </div>
                        <c:if test="${not empty transports}">
                            <c:forEach items="${transports}" var="t">
                                <div class="input-checkbox">
                                    <input class="transport-price" type="radio" name="transportId" id="shipping-${t.transportId}" value="${t.transportId}" <c:if test="${t.transportId == shoppingCart.transport.transportId}">checked</c:if> />
                                    <label for="shipping-${t.transportId}">${t.transportName}</label>
                                    <div class="caption">
                                        <p>${t.transportDescription}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="payments-methods">
                        <div class="section-title">
                            <h4 class="title">Phương thức thanh toán</h4>
                        </div>
                        <c:if test="${not empty paymentMethods}">
                            <c:forEach items="${paymentMethods}" var="p">
                                <div class="input-checkbox">
                                    <input type="radio" name="paymentMethodId" id="payments-${p.paymentMethodId}" value="${p.paymentMethodId}" <c:if test="${p.paymentMethodId == 1}">checked</c:if> />
                                    <label for="payments-${p.paymentMethodId}">${p.paymentMethodName}</label>
                                    <div class="caption">
                                        <p>${p.paymentMethodDescription}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>                     
                    </div>
                    <table class="shopping-cart-table table" id="all-price">
                        <tbody>
                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>Giá của sản phẩm</th>
                                <th class="sub-total"><fmt:formatNumber value="${shoppingCart.totalAmount}" /></th>
                            </tr>
                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>Phí vận chuyển</th>
                                <th class="sub-total" id="transport-pricee"><fmt:formatNumber value="${shoppingCart.transport.transportPrice}" /></th>
                            </tr>
                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>Tổng tiền</th>
                                <th class="total"><fmt:formatNumber value="${shoppingCart.lastAmount}" /></th>
                            </tr>
                            <input type="hidden" name="totalAmount" value="${shoppingCart.totalAmount}" />
                            <input type="hidden" name="transportPrice" value="${shoppingCart.transport.transportPrice}" />
                            <input type="hidden" name="lastAmount" value="${shoppingCart.lastAmount}" />
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"><br></div>
                <div class="col-md-6 col-md-offset-6">
                    <div class="form-inline">
                        <button class="primary-btn" type="submit">Đặt hàng</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $(".transport-price").click(function () {
            var transportId = $(this).val();

            $.ajax({
                url: '/ProjectSem4/order/price.htm',
                data: { transportId: transportId }
            }).done(function (res) {
                if (res === "transport-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Phương thức vận chuyển không khả dụng!'
                    });
                } else {
                    location.reload();
                }                
            });
        });


        $("#same-address").change(function (event) {
            event.preventDefault();
            var customerAddress = $("#CustomerAddress").val();

            if ($(this).is(":checked")) {
                $("#OrderAddress").val(customerAddress);
            } else {
                $("#OrderAddress").val("");
            }
        });
    });
</script>

<jsp:include page="widget/footer.jsp" flush="true"/>

