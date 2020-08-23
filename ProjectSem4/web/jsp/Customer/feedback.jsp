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





<div id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Phản hồi</li>
        </ul>
    </div>
</div>

<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Phản hồi cho chúng tôi</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-1 custom-dots"></div>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" action="/Home/DoFeedback">
            <input name="__RequestVerificationToken" type="hidden" value="xWbVTYbstxIyfU4v-ZfUdJmtddAlHd2u4DnaG3OJIOJX9PCpAQR0bcf87auoTax1es_xnXfdrsVphr67c4a8UhGvfWZCK-8Gu7rnzHUHRXc1" />
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="FeedbackCatalogId">Bạn muốn phản hồi về vấn đề gì?</label>
                        <select name="FeedbackCatalogId" id="FeedbackCatalogId" class="form-control" required="required">
                            <option value="">Chọn danh mục phản hồi</option>
                            <option value="1">Chăm s&#243;c kh&#225;ch h&#224;ng</option>
                            <option value="2">Vận chuyển</option>
                            <option value="3">Đơn h&#224;ng</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="FeedbackFullname">Họ tên:</label>
                        <input type="text" class="form-control" id="FeedbackFullname" name="FeedbackFullname" required="required">
                    </div>
                    <div class="form-group">
                        <label for="FeedbackEmail">Email:</label>
                        <input type="email" class="form-control" id="FeedbackEmail" name="FeedbackEmail" required="required">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="FeedbackPhone">Điện thoại:</label>
                        <input type="text" class="form-control" id="FeedbackPhone" name="FeedbackPhone" required="required">
                    </div>
                    <div class="form-group">
                        <label for="FeedbackAddress">Địa chỉ:</label>
                        <input type="text" class="form-control" id="FeedbackAddress" name="FeedbackAddress" required="required">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="FeedbackContent">Nội dung:</label>
                        <textarea name="FeedbackContent" id="FeedbackContent" class="form-control" rows="8" required="required"></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="primary-btn">Gửi đi</button>
            <button type="reset" class="second-btn">Làm lại</button>
        </form>
    </div>
</div>
<jsp:include page="widget/footer.jsp" flush="true"/>