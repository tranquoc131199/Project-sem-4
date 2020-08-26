<%-- 
    Document   : user-order
    Created on : Aug 17, 2020, 10:38:16 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>


    <script>
        swal(
            'Thành công!',
            'Đặt hàng thành công! Vui lòng kiểm tra trong email của bạn và trong mục đơn hàng của trang cá nhân!',
            'success'
        )
    </script>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Đơn hàng</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đơn hàng</h2>
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
    <div class="function-item ">
        <a href="/Customer/ChangeAvatar" title="Đổi ảnh đại diện">Đổi ảnh đại diện</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/Wishlist" title="Danh sách yêu thích">Danh sách yêu thích</a>
    </div>
    <div class="function-item function-active">
        <a href="/Customer/OrderList" title="Đơn hàng">Đơn hàng</a>
    </div>
</div>
            </div>
            <div class="col-md-9" id="order-to-append">
                <div class="table-responsive">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th class="text-center">Mã đơn hàng</th>
                                    <th class="text-center">Ngày đặt hàng</th>
                                    <th class="text-center">Tổng tiền</th>
                                    <th class="text-center">Trạng thái đơn hàng</th>
                                    <th class="text-center">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                        <td>QTCSTORE221716052019</td>
                                        <td>5/16/2019 10:17:28 PM</td>
                                        <td>16,340,000VNĐ</td>
                                        <td>
                                                <span class="label label-warning">Đang chờ xác nhận</span>
                                        </td>
                                        <td>
                                            <a href="" data-id="1" class="btn btn-xs btn-info view-detail"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                                <a href="/Customer/CancelOrder?OrderId=1" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i> Huỷ đơn hàng</a>
                                        </td>
                                    </tr>
                            </tbody>
                        </table>
                </div>
                <div id="append-html">

                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function () {
        $(".view-detail").click(function (event) {
            event.preventDefault();
            var orderId = $(this).data("id");

            $.ajax({
                url: '/Customer/OrderDetail/',
                data: { OrderId: orderId },
            }).done(function (res) {
                $("#append-html").html(res);
            });
        });
    });
</script>


<jsp:include page="widget/footer.jsp" flush="true"/>
