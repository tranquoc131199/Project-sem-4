<%-- 
    Document   : home-index
    Created on : Aug 17, 2020, 12:12:32 AM
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
                                                <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/banner05.jpg" alt="">
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
                    <li class="active">Giới thiệu</li>
                </ul>
            </div>
        </div>

        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>QTB l&agrave; một trong những doanh nghiệp h&agrave;ng đầu hoạt động trong lĩnh vực kinh doanh c&aacute;c sản phẩm CNTT. Th&agrave;nh lập từ năm 2001 đến nay, c&ocirc;ng ty đ&atilde; tạo được chỗ đứng vững chắc tr&ecirc;n thị trường b&aacute;n bu&ocirc;n, b&aacute;n lẻ, trở th&agrave;nh thương hiệu quen thuộc v&agrave; l&agrave; đối t&aacute;c tin cậy của nhiều bạn h&agrave;ng trong nước v&agrave; Quốc tế.</p>

                        <p>Lu&ocirc;n lấy yếu tố h&agrave;i h&ograve;a về lợi &iacute;ch l&agrave;m nền tảng, l&atilde;nh đạo C&ocirc;ng ty hiểu rằng, niềm tin của kh&aacute;ch h&agrave;ng về gi&aacute; th&agrave;nh, chất lượng v&agrave; dịch vụ l&agrave; sự sống c&ograve;n của C&ocirc;ng ty. Do vậy, mọi hoạt động kinh doanh của C&ocirc;ng ty lu&ocirc;n hướng tới mục ti&ecirc;u t&ocirc;n trọng v&agrave; bảo đảm quyền lợi cho kh&aacute;ch h&agrave;ng, chinh phục kh&aacute;ch h&agrave;ng bằng chất lượng sản phẩm v&agrave; dịch vụ tối ưu</p>

                        <p>&nbsp;</p>

                        <p><iframe frameborder="0" height="768" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.657600813899!2d105.78126221469924!3d21.046381985988873!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab32dd484c53%3A0x4201b89c8bdfd968!2zMjM4IEhvw6BuZyBRdeG7kWMgVmnhu4d0LCBD4buVIE5odeG6vywgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1555660463769!5m2!1svi!2s" style="border:0" width="1024"></iframe></p>

                    </div>
                </div>
            </div>
        </div>

<jsp:include page="widget/footer.jsp" flush="true"/>