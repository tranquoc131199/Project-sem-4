<%-- 
    Document   : user-change-info
    Created on : Aug 17, 2020, 10:38:01 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>
<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.html"/>
</c:if>
<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/index.htm">Cá nhân</a></li>
            <li class="active">Đổi thông tin người dùng</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đổi thông tin người dùng</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="list-user-function text-center medium-font upper-case">
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/index.htm" title="Thông tin cá nhân">Thông tin cá nhân</a>
                    </div>
                    <div class="function-item function-active">
                        <a href="${pageContext.request.contextPath}/customer/change-information.htm" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-password.htm" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
                    </div>
                    <div class="function-item">
                        <a href="${pageContext.request.contextPath}/customer/change-avatar.htm" title="Đổi ảnh đại diện">Đổi ảnh đại diện</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/wishlist.htm" title="Danh sách yêu thích">Danh sách yêu thích</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/order.htm" title="Đơn hàng">Đơn hàng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <form action="${pageContext.request.contextPath}/customer/do-change-information.htm" method="POST" role="form">
                    <div class="form-group">
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="customerFullname">Họ và tên:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="customerFullname" name="customerFullName" value="${customer.customerFullName}" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="customerPhone">Số điện thoại:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="customerPhone" name="customerPhone" value="${customer.customerPhone}" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="customerBirthday">Ngày sinh:</label>
                            </div>
                            <div class="form-input">
                                <input type="date" class="input" id="customerBirthday" name="customerBirthday" value="<fmt:formatDate value="${customer.customerBirthday}" pattern="yyyy-MM-dd" />" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="customerAddress">Địa chỉ:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="customerAddress" name="customerAddress" value="${customer.customerAddress}" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label"></div>
                            <div class="form-input">
                                <button type="submit" class="primary-btn">Đổi thông tin</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>