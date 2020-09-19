<%-- 
    Document   : home-index
    Created on : Aug 17, 2020, 12:12:32 AM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>


</section>

<section id="home">
    <div class="container">
        <div class="home-wrap">
            <div id="home-slick">
                <div class='banner banner-1'>
                    <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/banner01.jpg' alt=''>
                    <div class='banner-caption text-center'>
                        <h1></h1>
                        <h3 class='white-color font-weak text-border-neon'></h3>
                        <a class='primary-btn border-1-fff' href='/New/Detail/?NewId=1'>Xem chi tiết</a>
                    </div>
                </div>
                <div class='banner banner-1'>
                    <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/banner02.jpg' alt=''>
                    <div class='banner-caption text-center'>
                        <h1></h1>
                        <h3 class='white-color font-weak text-border-neon'></h3>
                        <a class='primary-btn border-1-fff' href='/New/Detail/?NewId=2'>Xem chi tiết</a>
                    </div>
                </div>
                <div class='banner banner-1'>
                    <img src='${pageContext.request.contextPath}/jsp/Admin/uploads/images/Banner/banner03.jpg' alt=''>
                    <div class='banner-caption text-center'>
                        <h1></h1>
                        <h3 class='white-color font-weak text-border-neon'></h3>
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
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/img1.png" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color"></h2>
                    </div>
                </a>
            </div>

            <div class="col-md-4 col-sm-6">
                <a class="banner banner-1" href="/Product/Index/?brandId=0&categoryId=2&view=grid&sort=1&pageSize=12&keyword=">
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/img2.png" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color"></h2>
                    </div>
                </a>
            </div>

            <div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
                <a class="banner banner-1" href="/Product/Index/?brandId=0&categoryId=6&view=grid&sort=1&pageSize=12&keyword=">
                    <img src="${pageContext.request.contextPath}/jsp/Customer/assets/img/img3.png" alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color"></h2>
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

            <c:if test="${not empty bestSaleProduct}">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single product-hot">
                        <div class="product-thumb">
                            <div class="product-label">
                                <c:if test="${bestSaleProduct.isNewProduct}">
                                    <span class='text-center'>Mới</span>
                                </c:if>
                                <c:if test="${bestSaleProduct.product.productSale > 0}">
                                    <span class="sale">-${bestSaleProduct.product.productSale}%</span>
                                </c:if>
                            </div>
                            <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${bestSaleProduct.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${bestSaleProduct.product.productFeatureImage}" alt="${bestSaleProduct.product.productName}">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">${bestSaleProduct.priceString}</h3>
                            <div class="product-rating">
                                ${bestSaleProduct.productStarString}
                            </div>
                            <h2 class="product-name">
                                <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${bestSaleProduct.product.productId}" title="${bestSaleProduct.product.productName}">
                                    <c:if test="${fn:length(bestSaleProduct.product.productName) > 50}">
                                        ${fn:substring(bestSaleProduct.product.productName, 0, 50)}...
                                    </c:if>
                                    <c:if test="${fn:length(bestSaleProduct.product.productName) <= 50}">
                                        ${bestSaleProduct.product.productName}
                                    </c:if>
                                </a>                                </a>
                            </h2>
                            <div class="product-btns">
                                <a href="" class="main-btn icon-btn" data-id="${bestSaleProduct.product.productId}"><i class="fa fa-heart <c:if test="${bestSaleProduct.isWishlist}">active</c:if>"></i></a>
                                <a href="" class="main-btn icon-btn" data-id="${bestSaleProduct.product.productId}"><i class="fa fa-exchange"></i></a>
                                <a href="" class="primary-btn add-to-cart pull-right" data-id="${bestSaleProduct.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="col-md-9 col-sm-6 col-xs-6">
                <div class="row">
                    <div id="product-slick-1" class="product-slick">
                        <c:forEach items="${best12SaleProducts}" var="p">
                            <div class="product product-single">
                                <div class="product-thumb">
                                    <div class="product-label">
                                        <c:if test="${p.isNewProduct}">
                                            <span class='text-center'>Mới</span>
                                        </c:if>
                                        <c:if test="${p.product.productSale > 0}">
                                            <span class="sale">-${p.product.productSale}%</span>
                                        </c:if>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${p.product.productFeatureImage}" alt="${p.product.productName}">
                                </div>
                                <div class="product-body">
                                    <h3 class="product-price">
                                        ${p.priceString}
                                    </h3>
                                    <div class="product-rating">
                                        ${p.productStarString}
                                    </div>
                                    <h2 class="product-name">
                                        <a href="${pageContext.request.contextPath}/product/detail.html?productId=${p.product.productId}">${p.product.productName}</a>    

                                    </h2>
                                    <div class="product-btns">
                                        <a href="" class="main-btn icon-btn" data-id="${bestSaleProduct.product.productId}"><i class="fa fa-heart <c:if test="${bestSaleProduct.isWishlist}">active</c:if>"></i></a>
                                        <a href="" class="main-btn icon-btn" data-id="${bestSaleProduct.product.productId}"><i class="fa fa-exchange"></i></a>
                                        <a href="" class="primary-btn add-to-cart pull-right" data-id="${p.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                    </div>
                                </div>
                            </div>  
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<c:if test="${not empty best12SellProducts}">
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
                                <c:if test="${bestSellProduct.isNewProduct}">
                                    <span class='text-center'>Mới</span>
                                </c:if>
                                <c:if test="${bestSellProduct.product.productSale > 0}">
                                    <span class="sale">-${bestSellProduct.product.productSale}%</span>
                                </c:if>
                            </div>
                            <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${bestSellProduct.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Xem chi tiết</a>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${bestSellProduct.product.productFeatureImage}" alt="${bestSellProduct.product.productName}">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">
                                ${bestSellProduct.priceString}
                            </h3>
                            <div class="product-rating">
                                ${bestSellProduct.productStarString}
                            </div>
                            <h2 class="product-name">
                                <a href="${pageContext.request.contextPath}/product/detail.html?productId=${bestSellProduct.product.productId}" title="${bestSellProduct.product.productName}">
                                    <c:if test="${fn:length(bestSellProduct.product.productName) > 50}">
                                        ${fn:substring(bestSellProduct.product.productName, 0, 50)}...
                                    </c:if>
                                    <c:if test="${fn:length(bestSellProduct.product.productName) <= 50}">
                                        ${bestSellProduct.product.productName}
                                    </c:if>
                                </a>
                            </h2>
                            <div class="product-btns">
                                <a href="" class="main-btn icon-btn" data-id="${bestSellProduct.product.productId}"><i class="fa fa-heart <c:if test="${bestSellProduct.isWishlist}">active</c:if>"></i></a>
                                <a href="" class="main-btn icon-btn" data-id="${bestSellProduct.product.productId}"><i class="fa fa-exchange"></i></a>
                                <a href="" class="primary-btn add-to-cart pull-right" data-id="${bestSellProduct.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-9 col-sm-6 col-xs-6">
                    <div class="row">
                        <div id="product-slick-2" class="product-slick">
                            <c:forEach items="${best12SellProducts}" var="p">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <c:if test="${p.isNewProduct}">
                                                <span class='text-center'>Mới</span>
                                            </c:if>
                                            <c:if test="${p.product.productSale > 0}">
                                                <span class="sale">-${p.product.productSale}%</span>
                                            </c:if>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${p.product.productFeatureImage}" alt="${p.product.productName}" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            ${p.priceString}
                                        </h3>
                                        <div class="product-rating">
                                            ${p.productStarString}
                                        </div>
                                        <h2 class="product-name"><a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}">${p.product.productName}</a></h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-heart <c:if test="${p.isWishlist}">active</c:if>"></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="${p.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Sản phẩm mới nhất</h2>
                </div>
            </div>
            <c:forEach items="${fourNewestProducts}" var="p">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <c:if test="${p.isNewProduct}">
                                    <span class='text-center'>Mới</span>
                                </c:if>
                            </div>
                            <a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/ProductImages/${p.product.productFeatureImage}" alt="${p.product.productName}" />
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">
                                ${p.priceString}                            
                            </h3>
                            <div class="product-rating">
                                ${p.productStarString}
                            </div>
                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/product/detail.htm?productId=${p.product.productId}">${p.product.productName}</a></h2>
                            <div class="product-btns">
                                <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-heart <c:if test="${p.isWishlist}">active</c:if>"></i></a>
                                <a href="" class="main-btn icon-btn" data-id="${p.product.productId}"><i class="fa fa-exchange"></i></a>
                                <a href="" class="primary-btn add-to-cart pull-right" data-id="${p.product.productId}"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>  
            </c:forEach>
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
                        Sản phẩm mua tại QTB l&#224; h&#224;ng ch&#237;nh h&#227;ng, bạn c&#243; thể chọn chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 19008080s để được tư vấn, mua h&#224;ng nhanh.
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