<%-- 
    Document   : user-change-password
    Created on : Aug 17, 2020, 10:38:09 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Đổi mật khẩu</li>
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
    <div class="function-item ">
        <a href="/Customer" title="Thông tin cá nhân">Thông tin cá nhân</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/ChangeInfomation" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
    </div>
    <div class="function-item function-active">
        <a href="/Customer/ChangePassword" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/ChangeAvatar" title="Đổi ảnh đại diện">Đổi ảnh đại diện</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/Wishlist" title="Danh sách yêu thích">Danh sách yêu thích</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/OrderList" title="Đơn hàng">Đơn hàng</a>
    </div>
</div>
            </div>
            <div class="col-md-9">
                <form action="/Customer/DoChangePassword" method="POST" role="form">
                    <input name="__RequestVerificationToken" type="hidden" value="C_2FoLw7SlM9lQexzk2fLmI53zAWCMverO4PYMc9oBRsa0gallpQF5UfapcW2qxcx5dB89UKQQlsGZrS9S6fhkT0RjalVDg14Xv0CZys53A1" />
                    <div class="form-group">
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="CustomerOldPassword">Mật khẩu cũ:</label>
                            </div>
                            <div class="form-input">
                                <input type="password" class="input" id="CustomerOldPassword" name="CustomerOldPassword" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="CustomerNewPassword">Mật khẩu mới:</label>
                            </div>
                            <div class="form-input">
                                <input type="password" class="input" id="CustomerNewPassword" name="CustomerNewPassword" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="ReCustomerNewPassword">Nhập lại mật khẩu mới:</label>
                            </div>
                            <div class="form-input">
                                <input type="password" class="input" id="ReCustomerNewPassword" name="ReCustomerNewPassword" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label"></div>
                            <div class="form-input">
                                <button type="submit" class="primary-btn">Đổi mật khẩu</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true"/>