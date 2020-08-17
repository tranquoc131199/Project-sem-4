<%-- 
    Document   : home-index
    Created on : Aug 17, 2020, 12:12:32 AM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>


</section>

    <section id="home">
        <div class="container">
            <div class="home-wrap">
                <div id="home-slick">
                    <div class='banner banner-1'>
                        <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/Banner_001.jpg' alt=''>
                        <div class='banner-caption text-center'>
                            <h1>Demo tin tức thứ nhất</h1>
                            <h3 class='white-color font-weak text-border-neon'>Demo tin tức thứ nhất</h3>
                            <a class='primary-btn border-1-fff' href='/New/Detail/?NewId=1'>Xem chi tiết</a>
                        </div>
                    </div>
                    <div class='banner banner-1'>
                        <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/Banner_002.jpg' alt=''>
                        <div class='banner-caption text-center'>
                            <h1>Demo tin tức thứ hai</h1>
                            <h3 class='white-color font-weak text-border-neon'>Demo tin tức thứ hai</h3>
                            <a class='primary-btn border-1-fff' href='/New/Detail/?NewId=2'>Xem chi tiết</a>
                        </div>
                    </div>
                    <div class='banner banner-1'>
                        <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/Banner_003.jpg' alt=''>
                        <div class='banner-caption text-center'>
                            <h1>Demo tin tức thứ ba</h1>
                            <h3 class='white-color font-weak text-border-neon'>Demo tin tức thứ ba</h3>
                            <a class='primary-btn border-1-fff' href='/New/Detail/?NewId=3'>Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  </section>
<section class="section section-brown top-50">
    <div class="container">
        <div class="row">

            <div class="col-md-4 col-sm-6">
                <a class="banner banner-1" href="/Product/Index/?brandId=0&categoryId=4&view=grid&sort=1&pageSize=12&keyword=">
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/01.jpg" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color">Linh kiện máy tính</h2>
                    </div>
                </a>
            </div>

            <div class="col-md-4 col-sm-6">
                <a class="banner banner-1" href="/Product/Index/?brandId=0&categoryId=2&view=grid&sort=1&pageSize=12&keyword=">
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/02.jpg" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color">Máy đồng bộ</h2>
                    </div>
                </a>
            </div>

            <div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
                <a class="banner banner-1" href="/Product/Index/?brandId=0&categoryId=6&view=grid&sort=1&pageSize=12&keyword=">
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/03.jpg" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color">Gaming gears</h2>
                    </div>
                </a>
            </div>

        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Top giảm giá</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-1 custom-dots"></div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single product-hot">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span class='text-center'>Mới</span>
                            </div>
                            <a href="/Product/Detail?ProductId=11" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Corsair/RAM/Corsair16GbDDR43000/ram_dominator_platinum_1.png" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">
                                4,290,000                             </h3>
                            <div class="product-rating">
                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                            </div>
                            <h2 class="product-name">
                                <a href="/Product/Detail?ProductId=11" title="(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum RGB">
(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum R...                                </a>
                            </h2>
                            <div class="product-btns">
                                <a href="" class="main-btn icon-btn" data-id="11"><i class="fa fa-heart  "></i></a>
                                <a href="" class="main-btn icon-btn" data-id="11"><i class="fa fa-exchange"></i></a>
                                <a href="" class="primary-btn add-to-cart pull-right" data-id="11"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                            </div>
                        </div>
                    </div>
            </div>

            <div class="col-md-9 col-sm-6 col-xs-6">
                <div class="row">
                    <div id="product-slick-1" class="product-slick">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=10" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Corsair/RAM/Corsair8GbDDR42666/ddr4_veng_lpx_blk_02_gearvn_1.png" alt="(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">1,350,000 <del class="product-old-price">1,350,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=10" title="(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX">
(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="10"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=9" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/SSD/Optane32GB/optan1.jpg" alt="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">990,000 <del class="product-old-price">990,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=9" title="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s">
Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s ...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="9"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=8" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/860Evo250g/860-evo-250gb_gearvn_00.jpg" alt="Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">1,850,000 <del class="product-old-price">1,850,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=8" title="Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )">
Samsung SSD 860 Evo 250GB 2.5" Sata 3 550/520 MB/s...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="8"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=7" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/970evo250g/970_evo_250gb_1.jpg" alt="Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">2,650,000 <del class="product-old-price">2,650,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=7" title="Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )">
Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="7"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=6" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i7%208700/intel_core_i7_8700.jpg" alt="Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">8,350,000 <del class="product-old-price">8,350,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=6" title="Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng">
Intel Core i7 8700 / 12M / 3.2GHz / 6 nhân 12 luồn...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="6"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="6"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="6"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=5" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Asus/mainboard/ASUS%20Z390%20ROG%20MAXIMUS%20XI%20HERO%20LGA1151v2/ASUS%20Z390%20ROG%2001.png" alt="ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">7,990,000 <del class="product-old-price">7,990,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=5" title="ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2">
ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="5"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="5"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="5"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=4" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">2,050,000 <del class="product-old-price">2,050,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=4" title="GIGABYTE B360M AORUS PRO LGA1151">
GIGABYTE B360M AORUS PRO LGA1151                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="4"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            
                                        </div>
                                        <a href="/Product/Detail?ProductId=3" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151v2" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">2,050,000 <del class="product-old-price">2,050,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=3" title="GIGABYTE B360M AORUS PRO LGA1151v2">
GIGABYTE B360M AORUS PRO LGA1151v2                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="3"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="3"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="3"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=2" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i5%208400/untitled-1_6e92f263a5c1446f98f837bf820cdb12.jpg" alt="Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">5,250,000 <del class="product-old-price">5,250,000</del></h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=2" title="Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng">
Intel Core i5 8400 / 9M / 2.8GHz / 6 nhân 6 luồng                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="2"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="2"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="2"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section section-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Sản phẩm bán chạy</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-2 custom-dots">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single product-hot">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span class='text-center'>Mới</span>
                                <span class="sale">Bán chạy nhất</span>
                            </div>
                            <a href="/Product/Detail?ProductId=11" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Corsair/RAM/Corsair16GbDDR43000/ram_dominator_platinum_1.png" class="img-responsive" alt="(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum RGB">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">4,290,000</h3>
                            <div class="product-rating">
                                <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                            </div>
                            <h2 class="product-name">
                                <a href="/Product/Detail?ProductId=11" title="(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum RGB">
(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum R...                                </a>
                            </h2>
                            <div class="product-btns">
                                <a href="" class="main-btn icon-btn" data-id="11"><i class="fa fa-heart  "></i></a>
                                <a href="" class="main-btn icon-btn" data-id="11"><i class="fa fa-exchange"></i></a>
                                <a href="" class="primary-btn add-to-cart pull-right" data-id="11"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                            </div>
                        </div>
                    </div>
            </div>

            <div class="col-md-9 col-sm-6 col-xs-6">
                <div class="row">
                    <div id="product-slick-2" class="product-slick">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=10" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Corsair/RAM/Corsair8GbDDR42666/ddr4_veng_lpx_blk_02_gearvn_1.png" alt="(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            1,350,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=10" title="(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX">
(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="10"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="10"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=9" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/SSD/Optane32GB/optan1.jpg" alt="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            990,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=9" title="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s">
Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s ...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="9"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=8" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/860Evo250g/860-evo-250gb_gearvn_00.jpg" alt="Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            1,850,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=8" title="Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )">
Samsung SSD 860 Evo 250GB 2.5" Sata 3 550/520 MB/s...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="8"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="8"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=7" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Samsung/SSD/970evo250g/970_evo_250gb_1.jpg" alt="Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            2,650,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=7" title="Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )">
Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="7"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="7"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=6" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i7%208700/intel_core_i7_8700.jpg" alt="Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            8,350,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=6" title="Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng">
Intel Core i7 8700 / 12M / 3.2GHz / 6 nhân 12 luồn...                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="6"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="6"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="6"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=5" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Asus/mainboard/ASUS%20Z390%20ROG%20MAXIMUS%20XI%20HERO%20LGA1151v2/ASUS%20Z390%20ROG%2001.png" alt="ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            7,990,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=5" title="ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2">
ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="5"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="5"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="5"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=4" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            2,050,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=4" title="GIGABYTE B360M AORUS PRO LGA1151">
GIGABYTE B360M AORUS PRO LGA1151                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="4"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="4"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            
                                        </div>
                                        <a href="/Product/Detail?ProductId=3" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Gigabyte/Mainboard/B360M/b360m_aorus_pro_gearvn.jpg" alt="GIGABYTE B360M AORUS PRO LGA1151v2" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            2,050,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=3" title="GIGABYTE B360M AORUS PRO LGA1151v2">
GIGABYTE B360M AORUS PRO LGA1151v2                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="3"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="3"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="3"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=2" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Intel/CPU/i5%208400/untitled-1_6e92f263a5c1446f98f837bf820cdb12.jpg" alt="Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng" class="img-responsive" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            5,250,000                                        </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name">
                                            <a href="/Product/Detail?ProductId=2" title="Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng">
Intel Core i5 8400 / 9M / 2.8GHz / 6 nhân 6 luồng                                            </a>
                                        </h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="2"><i class="fa fa-heart  "></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="2"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="2"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Sản phẩm mới nhất</h2>
                </div>
            </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span class='text-center'>Mới</span>
                                </div>
                                <a href="/Product/Detail?ProductId=56" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/QTB/No1/No11.jpg" alt="PC HNC SPECIAL EDITION No1" class="img-responsive" />
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">
                                    178,049,000                                 </h3>
                                <div class="product-rating">
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                </div>
                                <h2 class="product-name">
                                    <a href="/Product/Detail?ProductId=56" title="PC HNC SPECIAL EDITION No1">
PC HNC SPECIAL EDITION No1                                    </a>
                                </h2>
                                <div class="product-btns">
                                    <a href="" class="main-btn icon-btn" data-id="56"><i class="fa fa-heart  "></i></a>
                                    <a href="" class="main-btn icon-btn" data-id="56"><i class="fa fa-exchange"></i></a>
                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="56"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span class='text-center'>Mới</span>
                                </div>
                                <a href="/Product/Detail?ProductId=55" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/QTB/P12/P121.jpg" alt="PC HNC PROFESSIONAL GAMING P12" class="img-responsive" />
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">
                                    16,690,000                                 </h3>
                                <div class="product-rating">
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                </div>
                                <h2 class="product-name">
                                    <a href="/Product/Detail?ProductId=55" title="PC HNC PROFESSIONAL GAMING P12">
PC HNC PROFESSIONAL GAMING P12                                    </a>
                                </h2>
                                <div class="product-btns">
                                    <a href="" class="main-btn icon-btn" data-id="55"><i class="fa fa-heart  "></i></a>
                                    <a href="" class="main-btn icon-btn" data-id="55"><i class="fa fa-exchange"></i></a>
                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="55"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span class='text-center'>Mới</span>
                                </div>
                                <a href="/Product/Detail?ProductId=54" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Dell/T5820/T5820.jpg" alt="Workstation Dell Precision T5820" class="img-responsive" />
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">
                                    53,999,000                                 </h3>
                                <div class="product-rating">
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                </div>
                                <h2 class="product-name">
                                    <a href="/Product/Detail?ProductId=54" title="Workstation Dell Precision T5820">
Workstation Dell Precision T5820                                    </a>
                                </h2>
                                <div class="product-btns">
                                    <a href="" class="main-btn icon-btn" data-id="54"><i class="fa fa-heart  "></i></a>
                                    <a href="" class="main-btn icon-btn" data-id="54"><i class="fa fa-exchange"></i></a>
                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="54"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span class='text-center'>Mới</span>
                                </div>
                                <a href="/Product/Detail?ProductId=53" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/Dell/T3630/T36301.jpg" alt="Workstation Dell Precision T3630" class="img-responsive" />
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">
                                    24,990,000                                 </h3>
                                <div class="product-rating">
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                </div>
                                <h2 class="product-name">
                                    <a href="/Product/Detail?ProductId=53" title="Workstation Dell Precision T3630">
Workstation Dell Precision T3630                                    </a>
                                </h2>
                                <div class="product-btns">
                                    <a href="" class="main-btn icon-btn" data-id="53"><i class="fa fa-heart  "></i></a>
                                    <a href="" class="main-btn icon-btn" data-id="53"><i class="fa fa-exchange"></i></a>
                                    <a href="" class="primary-btn add-to-cart pull-right" data-id="53"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>
</section>

<section class="section section-brown">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <a href="#">
                        <h2 class="title">Tin bài mới</h2>
                    </a>
                </div>
            </div>
            <div class="col-md-8">
                    <div class="banner banner-1 news">
                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/khuyenmai.png" alt="">
                        <div class="news-title">
                            <a href="/New/Detail?NewId=27">
                                <h3 class="primary-color">Duy nhất chỉ c&#243; tại QTB</h3>
                            </a>
                        </div>
                        <div class="clearfix"><hr></div>
                        <div class="news-description">
                            Sản phẩm mua tại QTB l&#224; h&#224;ng ch&#237;nh h&#227;ng, bạn c&#243; thể chọn chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 097543355 để được tư vấn, mua h&#224;ng nhanh.
                        </div>
                        <div class="news-detail">
                            <a href="/New/Detail?NewId=27" class="primary-btn">Xem chi tiết</a>
                        </div>
                    </div>
            </div>

            <div class="col-md-4 list-news-release">
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=27">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/khuyenmai.png" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=27" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=27">
                                    <span class="release-news-title">Duy nhất chỉ c&#243; tại QTB</span>
                                </a>
                                <div class="release-news-description">
                                    Sản phẩm mua tại QTB l&#224; h&#224;ng ch&#237;nh h&#227;ng, bạn c&#243; thể chọn chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 097543355 để được tư vấn, mua h&#224;ng nhanh.
                                </div>
                            </div>
                        </div>
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=26">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/macbook.jpg" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=26" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=26">
                                    <span class="release-news-title">LAPTOP Khuyến mại</span>
                                </a>
                                <div class="release-news-description">
                                    Khuyến mại duy nhất th&#225;ng 4
                                </div>
                            </div>
                        </div>
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=25">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/lapdell.jpg" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=25" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=25">
                                    <span class="release-news-title">Laptop Dell</span>
                                </a>
                                <div class="release-news-description">
                                    M&#225;y t&#237;nh Dell c&#243; những điểm kh&#225;c biệt khi đứng giữa h&#224;ng ng&#224;n mẫu m&#225;y t&#237;nh từ nhiều thương hiệu
                                </div>
                            </div>
                        </div>
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=24">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/hinh15(1).jpg" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=24" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=24">
                                    <span class="release-news-title">Giới thiệu hệ thống cửa h&#224;ng QTB</span>
                                </a>
                                <div class="release-news-description">
                                    Hệ thống cửa h&#224;ng h&#224;ng đầu Việt Nam 
                                </div>
                            </div>
                        </div>
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=23">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/11060881_888443704534720_2036613721015644854_n.jpg" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=23" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=23">
                                    <span class="release-news-title">Tin tức về chủ đề &quot;giải đ&#225;p thắc mắc&quot;</span>
                                </a>
                                <div class="release-news-description">
                                    tại sao m&#225;y t&#237;nh kết nối mạng d&#226;y c&#243; dấu chấm than ạ?
                                </div>
                            </div>
                        </div>
                        <div class="row release-news">
                            <div class="col-sm-5">
                                <a class="release-news-image" href="/New/Detail?NewId=22">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/hinh1.jpg" alt="">
                                </a>
                                <div class="clearfix"><br></div>
                                <a href="/New/Detail?NewId=22" class="new-detail form-control">Xem chi tiết</a>
                            </div>
                            <div class="col-sm-7 release-news-body">
                                <a href="/New/Detail?NewId=22">
                                    <span class="release-news-title">B&#225;o c&#225;o doanh số h&#224;ng th&#225;ng</span>
                                </a>
                                <div class="release-news-description">
                                    Người d&#249;ng doanh nghiệp nhỏ c&#243; thể theo d&#245;i doanh số cũng như dự b&#225;o h&#224;ng th&#225;ng, h&#224;ng qu&#253; v&#224; h&#224;ng năm bằng c&#225;ch d&#249;ng mẫu th&#244;ng minh n&#224;y
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Các thương hiệu nổi tiếng</h2>
                </div>
            </div>
            <div class="col-md-12">
                <div class="top-brands">
                    <ul>
                                <li>
                                    <a href="/Product/Brand?BrandId=2">
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/asus-logo-hd-photo-15.png" alt="Asus" />
                                    </a>
                                </li>
                                <li>
                                    <a href="/Product/Brand?BrandId=4">
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/msi-logo.png" alt="MSI" />
                                    </a>
                                </li>
                                <li>
                                    <a href="/Product/Brand?BrandId=5">
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/1280px-Samsung_Logo_svg.png" alt="Samsung" />
                                    </a>
                                </li>
                                <li>
                                    <a href="/Product/Brand?BrandId=6">
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/gigabyte-logo-805x352.jpg" alt="Gigabyte" />
                                    </a>
                                </li>
                                <li>
                                    <a href="/Product/Brand?BrandId=7">
                                        <img class="img-responsive" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/logo.png" alt="Inno3D" />
                                    </a>
                                </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>



<jsp:include page="widget/footer.jsp" flush="true"/>