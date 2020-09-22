<%-- 
    Document   : user-change-avatar
    Created on : Aug 17, 2020, 10:37:52 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<c:if test="${empty customerLogin}">
    <jsp:forward page="${pageContext.request.contextPath}/customer/login.htm"/>
</c:if>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/index.htm">Cá nhân</a></li>
            <li class="active">Đổi ảnh đại diện người dùng</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đổi ảnh đại diện người dùng</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="list-user-function text-center medium-font upper-case">
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/index.htm" title="Thông tin cá nhân">Thông tin cá nhân</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-information.htm" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
                    </div>
                    <div class="function-item ">
                        <a href="${pageContext.request.contextPath}/customer/change-password.htm" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
                    </div>
                    <div class="function-item function-active">
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
                <form action="${pageContext.request.contextPath}/customer/do-change-avatar.htm" method="POST" role="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="customerAvatar">Chọn ảnh đại diện mới:</label>
                            </div>
                            <div class="form-input">
                                <input type="file" id="customerAvatar" name="customerAvatar" />
                                <img src="" id="previewAvatar" style="width: 200px;" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label"></div>
                            <div class="form-input">
                                <button type="submit" class="primary-btn">Đổi ảnh đại diện</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
