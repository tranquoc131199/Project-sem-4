<%-- 
    Document   : user-change-avatar
    Created on : Aug 17, 2020, 10:37:52 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Đổi ảnh đại diện</li>
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
    <div class="function-item ">
        <a href="/Customer/ChangePassword" title="Đổi mật khẩu người dùng">Đổi mật khẩu</a>
    </div>
    <div class="function-item function-active">
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
                <form action="/Customer/DoChangeAvatar" method="POST" role="form" enctype="multipart/form-data">
                    <input name="__RequestVerificationToken" type="hidden" value="oZfwrVgroX30ZpN37vf-7rdCJx0eGG9e09Qj120Dm5_HMI539nc-ysDmPye2g0imBICX21bo6y1LDFUMtcNG2wl-O9Ou0ZJNQgGClSLyrKU1" />
                    <div class="form-group">
                        <div class="form-custom-inline">
                            <div class="form-label text-right">
                                <label for="CustomerAvatar">Chọn ảnh đại diện mới:</label>
                            </div>
                            <div class="form-input">
                                <input type="file" id="CustomerAvatar" name="CustomerAvatar" />
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
