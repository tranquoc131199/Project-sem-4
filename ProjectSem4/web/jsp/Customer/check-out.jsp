<%-- 
    Document   : check-out
    Created on : Aug 17, 2020, 10:36:16 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>

<section id="navigation">
    <div class="container">
        <div id="responsive-nav">
            <div class="category-nav show-on-click">
                <span class="category-header">Danh mục <i class="fa fa-list"></i></span>
                <ul class="category-list">
                    <li><a href='/Product/?brandId=&categoryId=1&view=&sort=&pageSize=&keyword='>Laptop & phụ kiện</a></li><li><a href='/Product/?brandId=&categoryId=2&view=&sort=&pageSize=&keyword='>Máy đồng bộ</a></li><li><a href='/Product/?brandId=&categoryId=3&view=&sort=&pageSize=&keyword='>Máy chơi game</a></li><li class='dropdown side-dropdown'><a class='dropdown-toggle' data-toggle='dropdown' aria-expanded='true'>Linh kiện máy tính<i class='fa fa-angle-right'></i></a><div class='custom-menu'><div class='row'><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=8&view=&sort=&pageSize=&keyword='>CPU</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=9&view=&sort=&pageSize=&keyword='>Mainboard</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=10&view=&sort=&pageSize=&keyword='>RAM - Bộ nhớ trong</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=11&view=&sort=&pageSize=&keyword='>Ổ cứng HDD</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=12&view=&sort=&pageSize=&keyword='>Ổ cứng SSD</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=13&view=&sort=&pageSize=&keyword='>VGA - Card màn hình</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=14&view=&sort=&pageSize=&keyword='>Monitor - Màn hình</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=15&view=&sort=&pageSize=&keyword='>Case - vỏ máy tính</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=16&view=&sort=&pageSize=&keyword='>PSU - Nguồn</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=17&view=&sort=&pageSize=&keyword='>Sound Card</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=18&view=&sort=&pageSize=&keyword='>ODD - Ổ đĩa quang</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div></div></div></li><li><a href='/Product/?brandId=&categoryId=5&view=&sort=&pageSize=&keyword='>Máy chủ & Máy trạm</a></li><li class='dropdown side-dropdown'><a class='dropdown-toggle' data-toggle='dropdown' aria-expanded='true'>Gaming Gear & Console<i class='fa fa-angle-right'></i></a><div class='custom-menu'><div class='row'><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=19&view=&sort=&pageSize=&keyword='>Bàn phím chơi game</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=20&view=&sort=&pageSize=&keyword='>Chuột chơi game</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=21&view=&sort=&pageSize=&keyword='>Ghế chơi game</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=22&view=&sort=&pageSize=&keyword='>Bàn gaming</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=23&view=&sort=&pageSize=&keyword='>Tai nghe chơi game</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=24&view=&sort=&pageSize=&keyword='>Tay cầm game</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=25&view=&sort=&pageSize=&keyword='>Bàn di chuột</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=26&view=&sort=&pageSize=&keyword='>Máy chơi game console</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=27&view=&sort=&pageSize=&keyword='>Kính thực tế ảo</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=28&view=&sort=&pageSize=&keyword='>Game bản quyền</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/Product/?brandId=&categoryId=29&view=&sort=&pageSize=&keyword='>Loa</a></h3></li></ul><hr><hr class='hidden-md hidden-lg'></div></div></div></li><li><a href='/Product/?brandId=&categoryId=7&view=&sort=&pageSize=&keyword='>Giải pháp tản nhiệt</a></li>
                </ul>
            </div>

            <div class="menu-nav">
                <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                <ul class="menu-list">
                    <li><a href="/">Trang chủ</a></li>
                    <li class="dropdown mega-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Tin tức <i class="fa fa-caret-down"></i></a>
                        <div class="custom-menu">
                            <div class="row">
                                <div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/New/?CatalogId=1'>Tin doanh nghiệp</a></h3></li><li><a href='/New/?CatalogId=4'>Báo cáo doanh thu</a></li><li><a href='/New/?CatalogId=5'>Tuyển dụng</a></li><li><a href='/New/?CatalogId=12'>Thông tin cửa hàng</a></li></ul><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/New/?CatalogId=2'>Tin công nghệ</a></h3></li><li><a href='/New/?CatalogId=6'>Hướng dẫn</a></li><li><a href='/New/?CatalogId=7'>Giải đáp</a></li><li><a href='/New/?CatalogId=8'>Tin tức từ các hãng</a></li></ul><hr class='hidden-md hidden-lg'></div><div class='col-md-4'><ul class='list-links'><li><h3 class='list-links-title'><a href='/New/?CatalogId=3'>Tin khuyến mãi</a></h3></li><li><a href='/New/?CatalogId=9'>Khuyến mãi tháng</a></li><li><a href='/New/?CatalogId=10'>Khuyến mãi đợt</a></li><li><a href='/New/?CatalogId=11'>Các chương trình khuyến mãi</a></li></ul><hr class='hidden-md hidden-lg'></div>
                            </div>
                            <div class="row hidden-sm hidden-xs">
                                <div class="col-md-12">
                                    <hr>
                                    <a class="banner banner-1" href="#">
                                        <img src="/Content/img/banner05.jpg" alt="">
                                        <div class="banner-caption text-center">
                                            <h2 class="white-color">SẢN PHẨM MỚI</h2>
                                            <h3 class="white-color font-weak">GIÁ HẤP DẪN</h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="/Home/About">Giới thiệu</a></li>
                    <li><a href="/Home/Feedback">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

    




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
            <form id="checkout-form" class="clearfix" method="post" action="/Order/PreCheckOut">
                <input name="__RequestVerificationToken" type="hidden" value="Jl5mW4jKDXVoV0_QCdzwASDq0hdoXaALEEy_PGPtm-X8MCa4y6WE0qKwiJZut0Bm6flMIE2yIz7VAh3Lb4VhtfAPFmczikpiv0xRxv1x4vk1" />
                <div class="col-md-6">
                    <div class="billing-details">
                            <p>Đã có tài khoản ? <a href="/Customer/Login">Đăng nhập</a></p>
                            <div class="section-title">
                                <h3 class="title">Chi tiết đặt hàng</h3>
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="CustomerFullname" placeholder="Họ và tên">
                            </div>
                            <div class="form-group">
                                <input class="input" type="date" name="CustomerBirthday">
                            </div>
                            <div class="form-group">
                                <select name="CustomerGender" id="input" class="input" required="required">
                                    <option value="">Giới tính</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="CustomerEmail" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="CustomerPhone" placeholder="Điện thoại">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="CustomerAddress" placeholder="Địa chỉ">
                            </div>
                            <div class="form-group">
                                <div class="input-checkbox">
                                    <input type="checkbox" id="register">
                                    <label class="font-weak" for="register">Tạo tài khoản?</label>
                                    <div class="caption">
                                        <input class="input" type="password" name="CustomerPassword" placeholder="Nhập mật khẩu...">
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="shiping-methods">
                        <div class="section-title">
                            <h4 class="title">Phương thức vận chuyển</h4>
                        </div>
                                <div class="input-checkbox">
                                    <input class="transport-price" type="radio" name="TransportId" id="shipping-1" value="1" checked>
                                    <label for="shipping-1">Vận chuyển nội bộ -  50,000</label>
                                    <div class="caption">
                                        <p>
                                            Cửa h&#224;ng sẽ chủ động vận chuyển đơn h&#224;ng đến cho kh&#225;ch h&#224;ng
                                        </p>
                                    </div>
                                </div>
                                <div class="input-checkbox">
                                    <input class="transport-price" type="radio" name="TransportId" id="shipping-2" value="2" >
                                    <label for="shipping-2">Vận chuyển COD -  100,000</label>
                                    <div class="caption">
                                        <p>
                                            Cửa h&#224;ng sẽ sử dụng dịch vụ vận chuyển của b&#234;n thứ 3 để chuyển h&#224;ng đến địa điểm nhận h&#224;ng của qu&#253; kh&#225;ch
                                        </p>
                                    </div>
                                </div>
                    </div>

                    <div class="payments-methods">
                        <div class="section-title">
                            <h4 class="title">Phương thức thanh toán</h4>
                        </div>
                                <div class="input-checkbox">
                                    <input type="radio" name="PaymentMethodId" id="payments-1" value="1" checked>
                                    <label for="payments-1">Thanh to&#225;n trực tuyến</label>
                                    <div class="caption">
                                        <p>
                                            Thanh to&#225;n online th&#244;ng qua hệ thống thanh to&#225;n điện tử của QTC-Store
                                        </p>
                                    </div>
                                </div>
                                <div class="input-checkbox">
                                    <input type="radio" name="PaymentMethodId" id="payments-2" value="2" >
                                    <label for="payments-2">Thanh to&#225;n tại cửa h&#224;ng</label>
                                    <div class="caption">
                                        <p>
                                            Kh&#225;ch h&#224;ng thanh to&#225;n trực tiếp tại cửa h&#224;ng
                                        </p>
                                    </div>
                                </div>
                                <div class="input-checkbox">
                                    <input type="radio" name="PaymentMethodId" id="payments-3" value="3" >
                                    <label for="payments-3">Thanh to&#225;n tại nh&#224; (COD)</label>
                                    <div class="caption">
                                        <p>
                                            Kh&#225;ch h&#224;ng đặt h&#224;ng online, sau đ&#243; cửa h&#224;ng sẽ vận chuyển đơn h&#224;ng v&#224; thanh to&#225;n tại nh&#224; của qu&#253; kh&#225;ch
                                        </p>
                                    </div>
                                </div>
                    </div>
                    <table class="shopping-cart-table table" id="all-price">
                        


<tbody>
    <tr>
        <th class="empty" colspan="3"></th>
        <th>Giá của sản phẩm</th>
        <th class="sub-total">61,990,000</th>
    </tr>
    <tr>
        <th class="empty" colspan="3"></th>
        <th>Phí vận chuyển</th>
        <th class="sub-total" id="transport-pricee">50,000</th>
    </tr>
    <tr>
        <th class="empty" colspan="3"></th>
        <th>Mức giảm giá</th>
        <th class="sub-total" id="voucher-sale">0 (00)</th>
    </tr>
    <tr>
        <th class="empty" colspan="3"></th>
        <th>Tổng tiền</th>
        <th class="total">
            62,040,000
        </th>
    </tr>
    <input type="hidden" name="TransportPrice" value="50000" />
    <input type="hidden" name="TotalAmount" value="61990000" />
    <input type="hidden" name="TotalPrice" value="62040000" />
</tbody>
                    </table>
                </div>
                <div class="clearfix"><br></div>
                <div class="col-md-6 col-md-offset-6">
                    <div class="form-inline">
                            <div class="form-group">
                                <input type="text" class="form-control" name="VoucherCode" id="voucher-code" placeholder="Mã giảm giá..." style="height: 40px; margin-top: -5px;" />
                            </div>
                            <button type="button" class="primary-btn" id="apply-voucher">Kiểm tra</button>
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
                url: '/Order/GetPriceAjax/',
                data: { TransportId: transport },
            }).done(function (res) {
                $("#all-price").html(res);
            });
        });

        $("#apply-voucher").click(function () {
            var voucherCode = $("#voucher-code").val();

            $.ajax({
                url: '/Order/CheckVoucherCode/',
                data: { VoucherCode: voucherCode },
            }).done(function (res) {
                var obj = JSON.parse(res);
                var str = obj.MessageReturn;

                if (obj.Check) {
                    Swal.fire(
                        'Thành công!',
                        str,
                        'success'
                    ).then(function () {
                        $.ajax({
                            url: '/Order/GetVoucherSale/',
                            data: { VoucherCode: voucherCode },
                        }).done(function (res) {
                            $("#voucher-sale").html(res);
                            location.reload();
                        });
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: str
                    })
                }
            });
        });

        $("#remove-voucher").click(function (event) {
            event.preventDefault();

            $.ajax({
                url: '/Order/RemoveVoucher/',
            }).done(function (res) {
                var obj = JSON.parse(res);
                var str = obj.MessageReturn;

                if (obj.Check) {
                    Swal.fire(
                        'Thành công!',
                        str,
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: str
                    })
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

