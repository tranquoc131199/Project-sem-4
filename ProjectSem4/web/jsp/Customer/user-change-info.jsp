<%-- 
    Document   : user-change-info
    Created on : Aug 17, 2020, 10:38:01 PM
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
    <div class="function-item function-active">
        <a href="/Customer/ChangeInfomation" title="Đổi thông tin người dùng">Đổi thông tin người dùng</a>
    </div>
    <div class="function-item ">
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
                <form action="/Customer/DoChangeInfomation" method="POST" role="form">
                    <input name="__RequestVerificationToken" type="hidden" value="hhmu65gaH4YuzGUXYK-gYL4rXZNVLqbzg9XqtiMfLKKXx7Xms1uhF7n1unanIULyN2t_PuSZK8Ob3IZW2L2ChP7pyBo2jOFSwk7eiqq_h1c1" />
                    <div class="form-group">
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="CustomerFullname">Họ và tên:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="CustomerFullname" name="CustomerFullname" value="Trần Mạnh Quốc" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="CustomerPhone">Số điện thoại:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="CustomerPhone" name="CustomerPhone" value="123456790" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="CustomerBirthday">Ngày sinh:</label>
                            </div>
                            <div class="form-input">
                                <input type="date" class="input" id="CustomerBirthday" name="CustomerBirthday" value="1999-11-13" />
                            </div>
                        </div>
                        <div class="form-custom-inline ">
                            <div class="form-label text-right">
                                <label for="CustomerAddress">Địa chỉ:</label>
                            </div>
                            <div class="form-input">
                                <input type="text" class="input" id="CustomerAddress" name="CustomerAddress" value="Số 2 Phạm Văn Đồng, Mai Dịch" />
                            </div>
                        </div>
                        <div class="form-custom-inline">
                            <div class="form-label"></div>
                            <div class="form-input">
                                <button type="submit" class="primary-btn">Đổi Thông Tin</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>