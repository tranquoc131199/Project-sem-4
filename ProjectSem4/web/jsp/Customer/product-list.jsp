<%-- 
    Document   : product-list
    Created on : Aug 17, 2020, 10:37:28 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Sản phẩm</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <article id="aside" class="col-md-3">

                <aside class="aside">
                    <h3 class="aside-title">Tìm theo tên</h3>
                    <form action="/Product/Search" method="post">
                        <div class="dp-flex">
                            <input name="__RequestVerificationToken" type="hidden" value="Gt2WKWQBo6gf_d634stJjbkr6_uPO6Gkwk_qPjpawZOFDAFGRF8u_M2E1kiNg34zT7ZFNqUKgQE24G-BeQDXzCTcTC33ogphbsuEHREgRTc1" />
                            <input type="text" class="input" id="search-product" name="ProductName" placeholder="Tên sản phẩm...">
                            <button type="submit" class="btn btn-custom" id="btn-product" style="border-radius: 0;"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </aside>

                <aside class="aside">
                    <h3 class="aside-title">Lọc theo hãng:</h3>
                    <ul class="size-option">
                                    <li><a href="/Product/Index/?brandId=2&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Asus</a></li>
                                    <li><a href="/Product/Index/?brandId=4&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">MSI</a></li>
                                    <li><a href="/Product/Index/?brandId=5&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Samsung</a></li>
                                    <li><a href="/Product/Index/?brandId=6&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Gigabyte</a></li>
                                    <li><a href="/Product/Index/?brandId=7&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Inno3D</a></li>
                                    <li><a href="/Product/Index/?brandId=8&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Thermaltake</a></li>
                                    <li><a href="/Product/Index/?brandId=9&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Xigmatek</a></li>
                                    <li><a href="/Product/Index/?brandId=10&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">NZXT</a></li>
                                    <li><a href="/Product/Index/?brandId=11&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Razer</a></li>
                                    <li><a href="/Product/Index/?brandId=12&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Corsair</a></li>
                                    <li><a href="/Product/Index/?brandId=14&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Intel</a></li>
                                    <li><a href="/Product/Index/?brandId=15&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">AMD</a></li>
                                    <li><a href="/Product/Index/?brandId=16&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Western Digital</a></li>
                                    <li><a href="/Product/Index/?brandId=17&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Sennheiser</a></li>
                                    <li><a href="/Product/Index/?brandId=18&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">DXRACER</a></li>
                                    <li><a href="/Product/Index/?brandId=19&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Sony</a></li>
                                    <li><a href="/Product/Index/?brandId=20&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Microsoft</a></li>
                                    <li><a href="/Product/Index/?brandId=21&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Acer</a></li>
                                    <li><a href="/Product/Index/?brandId=22&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">Dell</a></li>
                                    <li><a href="/Product/Index/?brandId=23&categoryId=0&view=grid&sort=1&pageSize=12&keyword=">QTC</a></li>
                    </ul>
                </aside>

                <aside class="aside">
                    <h3 class="aside-title">Lọc theo danh mục:</h3>
                    <ul class="size-option">
                                    <li><a href="/Product/Index/?brandId=0&categoryId=1&view=grid&sort=1&pageSize=12&keyword=">Laptop &amp; phụ kiện</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=2&view=grid&sort=1&pageSize=12&keyword=">M&#225;y đồng bộ</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=3&view=grid&sort=1&pageSize=12&keyword=">M&#225;y chơi game</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=4&view=grid&sort=1&pageSize=12&keyword=">Linh kiện m&#225;y t&#237;nh</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=5&view=grid&sort=1&pageSize=12&keyword=">M&#225;y chủ &amp; M&#225;y trạm</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=6&view=grid&sort=1&pageSize=12&keyword=">Gaming Gear &amp; Console</a></li>
                                    <li><a href="/Product/Index/?brandId=0&categoryId=7&view=grid&sort=1&pageSize=12&keyword=">Giải ph&#225;p tản nhiệt</a></li>
                    </ul>
                </aside>

                <aside class="aside">
                    <a href="/Product/Index/" class="primary-btn">Xoá hết bộ lọc</a>
                </aside>

                <aside class="aside">
                    <h3 class="aside-title">Top đánh giá</h3>
                            <div class="product product-widget">
                                <div class="product-thumb">
                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i5%208400/untitled-1_6e92f263a5c1446f98f837bf820cdb12.jpg" alt="Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng" />
                                </div>
                                <div class="product-body">
                                    <h2 class="product-name">
                                        <a href="/Product/Detail?ProductId=2">
Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng                                        </a>
                                    </h2>
                                    <h3 class="product-price">
                                        5,250,000                                     </h3>

                                    <div class="product-rating">
                                        <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        <a href="" class="main-btn2 add-to-cart" data-id="2">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="product product-widget">
                                <div class="product-thumb">
                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151" />
                                </div>
                                <div class="product-body">
                                    <h2 class="product-name">
                                        <a href="/Product/Detail?ProductId=4">
GIGABYTE B360M AORUS PRO LGA1151                                        </a>
                                    </h2>
                                    <h3 class="product-price">
                                        2,050,000                                     </h3>

                                    <div class="product-rating">
                                        <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        <a href="" class="main-btn2 add-to-cart" data-id="4">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="product product-widget">
                                <div class="product-thumb">
                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Asus/mainboard/ASUS%20Z390%20ROG%20MAXIMUS%20XI%20HERO%20LGA1151v2/ASUS%20Z390%20ROG%2001.png" alt="ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2" />
                                </div>
                                <div class="product-body">
                                    <h2 class="product-name">
                                        <a href="/Product/Detail?ProductId=5">
ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2                                        </a>
                                    </h2>
                                    <h3 class="product-price">
                                        7,990,000                                     </h3>

                                    <div class="product-rating">
                                        <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        <a href="" class="main-btn2 add-to-cart" data-id="5">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="product product-widget">
                                <div class="product-thumb">
                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i7%208700/intel_core_i7_8700.jpg" alt="Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng" />
                                </div>
                                <div class="product-body">
                                    <h2 class="product-name">
                                        <a href="/Product/Detail?ProductId=6">
Intel Core i7 8700 / 12M / 3.2GHz / 6 nhân 12 luồn...                                        </a>
                                    </h2>
                                    <h3 class="product-price">
                                        8,350,000                                     </h3>

                                    <div class="product-rating">
                                        <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        <a href="" class="main-btn2 add-to-cart" data-id="6">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                </aside>
            </article>

            <article id="main" class="col-md-9">

                <div class="store-filter clearfix">
                    <div class="pull-left">
                        <div class="row-filter">
                                <a href="/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=12&keyword=" class='active'><i class="fa fa-th-large"></i></a>
                                <a href="/Product/Index/?brandId=0&categoryId=0&view=list&sort=1&pageSize=12&keyword="><i class="fa fa-bars"></i></a>
                        </div>
                        <div class="sort-filter">
                            <span class="text-uppercase">Sắp xếp theo:</span>
                            <select class="input" id="sort-type-1">
                                <option value="1" selected>Giá tăng dần</option>
                                <option value="2" >Giá giảm dần</option>
                                <option value="3" >Đánh giá tăng dần</option>
                                <option value="4" >Đánh giá giảm dần</option>
                                <option value="5" >Số lượng bán ra tăng dần</option>
                                <option value="6" >Số lượng bán ra giảm dần</option>
                            </select>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="page-filter">
                            <span class="text-uppercase">Hiển thị mỗi trang:</span>
                            <select class="input" id="page-size-1">
                                <option value="12" selected>12</option>
                                <option value="24" >24</option>
                                <option value="60" >60</option>
                            </select>
                        </div>

<ul class='store-pages'><li><span class='text-uppercase'>Trang:</span></li><li><a class='disabled'><i class='fa fa-caret-left'></i></a></li><li class='active'>1</li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=2&keyword='>2</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=3&keyword='>3</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=4&keyword='>4</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=5&keyword='>5</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=2&keyword='><i class='fa fa-caret-right'></i></a></li></ul>                    </div>
                </div>

                    <div id="store">
                        <div class="row">
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=24" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/MSI/SHIELD%20MOUSEPAD/gearvn_mousepad_msi01.png" alt="MSI GAMING SHIELD MOUSEPAD" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    300,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=24">MSI GAMING SHIELD MOUSEPAD</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="24"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="24"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="24"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=51" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Acer/XC-885/XC-88502.png" alt="PC Acer Aspire XC-885 DT" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    985,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=51">PC Acer Aspire XC-885 DT</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="51"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="51"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="51"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=9" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/SSD/Optane32GB/optan1.jpg" alt="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    990,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=9">Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="9"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=13" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/WD/WD1TBBlue7200rpm/WD1TBblue1.jpg" alt="WD HDD 1TB Blue 7200rpm" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    990,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=13">WD HDD 1TB Blue 7200rpm</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="13"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="13"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="13"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=10" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Corsair/RAM/Corsair8GbDDR42666/ddr4_veng_lpx_blk_02_gearvn_1.png" alt="(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    1,350,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=10">(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="10"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=37" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Razer/Mouse/DAElite/a.png" alt="Chuột Razer DeathAdder Elite" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    1,490,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=37">Chuột Razer DeathAdder Elite</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="37"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="37"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="37"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=29" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Microsoft/XboxOneS/gearvn-xboxone-s-001.jpg" alt="Microsoft XBOX ONE S ( Hỗ trợ kết nối Bluetooth )" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    1,790,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=29">Microsoft XBOX ONE S ( Hỗ trợ kết nối Bluetooth )</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="29"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="29"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="29"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=8" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/860Evo250g/860-evo-250gb_gearvn_00.jpg" alt="Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    1,850,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=8">Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="8"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=12" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/WD/WD1TBBlack7200rpm/WD1TB1.jpg" alt="WD HDD 1TB Black 7200rpm" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    2,000,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=12">WD HDD 1TB Black 7200rpm</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="12"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="12"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="12"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=4" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    2,050,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=4">GIGABYTE B360M AORUS PRO LGA1151</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="4"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=38" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Razer/Mouse/RazerMambaElite/5g_tournament_01.jpg" alt="Chuột Razer Mamba Elite" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    2,349,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=38">Chuột Razer Mamba Elite</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="38"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="38"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="38"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <span class='text-center'>Mới</span>
                                                </div>
                                                <a href="/Product/Detail?ProductId=7" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/970evo250g/970_evo_250gb_1.jpg" alt="Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )" />
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">
                                                    2,650,000                                                 </h3>
                                                <div class="product-rating">
                                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                                </div>
                                                <h2 class="product-name"><a href="/Product/Detail?ProductId=7">Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )</a></h2>
                                                <div class="product-btns">
                                                    <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-heart "></i></a>
                                                    <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-exchange"></i></a>
                                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="7"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>

                <div class="store-filter clearfix">
                    <div class="pull-left">
                        <div class="row-filter">
                                <a href="/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=12&keyword=" class='active'><i class="fa fa-th-large"></i></a>
                                <a href="/Product/Index/?brandId=0&categoryId=0&view=list&sort=1&pageSize=12&keyword="><i class="fa fa-bars"></i></a>
                        </div>
                        <div class="sort-filter">
                            <span class="text-uppercase">Sắp xếp theo:</span>
                            <select class="input" id="sort-type-2">
                                <option value="1" selected>Giá tăng dần</option>
                                <option value="2" >Giá giảm dần</option>
                                <option value="3" >Đánh giá tăng dần</option>
                                <option value="4" >Đánh giá giảm dần</option>
                                <option value="5" >Số lượng bán ra tăng dần</option>
                                <option value="6" >Số lượng bán ra giảm dần</option>
                            </select>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="page-filter">
                            <span class="text-uppercase">Hiển thị mỗi trang:</span>
                            <select class="input" id="page-size-2">
                                <option value="12" selected>12</option>
                                <option value="24" >24</option>
                                <option value="60" >60</option>
                            </select>
                        </div>

<ul class='store-pages'><li><span class='text-uppercase'>Trang:</span></li><li><a class='disabled'><i class='fa fa-caret-left'></i></a></li><li class='active'>1</li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=2&keyword='>2</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=3&keyword='>3</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=4&keyword='>4</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=5&keyword='>5</a></li><li><a href='/Product/Index/?brandid=0&categoryId=0&view=grid&sort=1&pageSize=12&page=2&keyword='><i class='fa fa-caret-right'></i></a></li></ul>                    </div>
                </div>

            </article>
        </div>
    </div>
</section>


<script>
    $(document).ready(function () {
        $("#sort-type-1").change(function (event) {
            event.preventDefault();
            console.log($("#sort-type-1").val());
            window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=' + $("#sort-type-1").val() + '&pageSize=12&page=1&keyword=';
        });

        $("#sort-type-2").change(function (event) {
            event.preventDefault();
            console.log($("#sort-type-2").val());
            window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=' + $("#sort-type-2").val() + '&pageSize=12&page=1&keyword=';
        });

        $("#page-size-1").change(function (event) {
            event.preventDefault();
            console.log($("#page-size-1").val());
            window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=' + $("#page-size-1").val() + '&page=1&keyword=';
        });

        $("#page-size-2").change(function (event) {
            event.preventDefault();
            console.log($("#page-size-2").val());
            window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=' + $("#page-size-2").val() + '&page=1&keyword=';
        });

        var keyword = $("#search-product").val();
        $("#search-product").keydown(function (event) {
            if (event.keyCode == 13) {
                window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=12&page=1&keyword=' + keyword;
            }
        });

        $("#btn-product").click(function (event) {
            event.preventDefault();
            var keyword = $("#search-product").val();
            window.location.href = '/Product/Index/?brandId=0&categoryId=0&view=grid&sort=1&pageSize=12&page=1&keyword=' + keyword;
        });
    });
</script>


<jsp:include page="widget/footer.jsp" flush="true"/>