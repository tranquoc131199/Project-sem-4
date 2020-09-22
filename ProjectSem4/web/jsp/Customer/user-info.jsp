<%-- 
    Document   : user.info
    Created on : Aug 17, 2020, 10:38:31 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>
<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.html"/>
</c:if>
<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li class="active">Trang cá nhân người dùng</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Trang cá nhân người dùng</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="list-user-function text-center medium-font upper-case">
                    <div class="function-item function-active">
                        <a href="${pageContext.request.contextPath}/customer/index.htm" title="Thông tin cá nhân">Thông tin cá nhân</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-information.htm" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-password.htm" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
                    </div>
                    <div class="function-item ">
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
                <table class="personal-information">
                    <tr>
                        <th>Ảnh đại diện:</th>
                        <td>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Customers/${customer.customerAvatar}" style="max-width: 200px;" alt="Ảnh đại diện cá nhân" />
                        </td>
                    </tr>
                    <tr>
                        <th>Họ tên:</th>
                        <td>${customer.customerFullName}</td>
                    </tr>
                    <tr>
                        <th>Ngày sinh:</th>
                        <td><fmt:formatDate value="${customer.customerBirthday}" /></td>
                    </tr>
                    <tr>
                        <th>Giới tính:</th>
                        <td>
                            <c:if test="${customer.customerGender == 1}">Nam</c:if>
                            <c:if test="${customer.customerGender == 0}">Nữ</c:if>
                            <c:if test="${customer.customerGender != 1 && customer.customerGender != 0}">Chưa xác định</c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Điện thoại:</th>
                            <td>${customer.customerPhone}</td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>${customer.customerEmail}</td>
                    </tr>
                    <tr>
                        <th>Địa chỉ:</th>
                        <td>${customer.customerAddress}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
