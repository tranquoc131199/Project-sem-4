<%-- 
    Document   : user.info
    Created on : Aug 17, 2020, 10:38:31 PM
    Author     : Acer Nitro 5
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
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
        <a href="/Customer" title="Thông tin cá nhân">Thông tin cá nhân</a>
    </div>
    <div class="function-item ">
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
                <table class="personal-information">
                    <tr>
                        <th>Ảnh đại diện:</th>
                        <td>
                                <img src="Areas/Admin/Upload/Customers/1adminavatar23295223122018.jpeg" style="max-width: 200px;" alt="Ảnh đại diện cá nhân" />
                        </td>
                    </tr>
                    <tr>
                        <th>Họ tên:</th>
                        <td>Trần Mạnh Quốc</td>
                    </tr>
                    <tr>
                        <th>Ngày sinh:</th>
                        <td>13/11/1999</td>
                    </tr>
                    <tr>
                        <th>Giới tính:</th>
                        <td>Nam</td>
                    </tr>
                    <tr>
                        <th>Điện thoại:</th>
                        <td>1234567890</td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>tranquoc@gmail.com</td>
                    </tr>
                    <tr>
                        <th>Địa chỉ:</th>
                        <td>Số 2 Phạm Văn Đồng, Mai Dịch</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
