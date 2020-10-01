<%-- 
    Document   : product-list
    Created on : Aug 17, 2020, 10:37:28 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
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
                            <input type="text" class="input" id="search-product" name="productName" placeholder="Tên sản phẩm...">
                            <button type="submit" class="btn btn-custom" id="btn-product" style="border-radius: 0;"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </aside>

                <c:if test="${not empty brands}">
                    <aside class="aside">
                        <h3 class="aside-title">Lọc theo hãng:</h3>
                        <ul class="size-option">
                            <c:forEach items="${brands}" var="b">
                                <li><a href="${pageContext.request.contextPath}/product/index.htm?brandId=${b.brandId}&categoryId=${categoryId}&view=${view}&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}">${b.brandName}</a></li>
                                </c:forEach>
                        </ul>
                    </aside>
                </c:if>

                <c:if test="${not empty parentCategories}">
                    <aside class="aside">
                        <h3 class="aside-title">Lọc theo danh mục:</h3>
                        <ul class="size-option">
                            <c:forEach items="${parentCategories}" var="c">
                                <li><a href="${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${c.categoryId}&view=${view}&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}">${c.categoryName}</a></li>
                                </c:forEach>
                        </ul>
                    </aside>
                </c:if>

                <aside class="aside">
                    <a href="${pageContext.request.contextPath}/product/index.htm" class="primary-btn">Xoá hết bộ lọc</a>
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
                            <a href="${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}" <c:if test="${view == 'grid'}">class='active'</c:if>><i class="fa fa-th-large"></i></a>
                            <a href="${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=list&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}" <c:if test="${view == 'list'}">class='active'</c:if>><i class="fa fa-bars"></i></a>
                            </div>
                            <div class="sort-filter">
                                <span class="text-uppercase">Sắp xếp theo:</span>
                                <select class="input" id="sort-type-1">
                                    <option value="1" <c:if test="${sort == 1}">selected</c:if>>Giá tăng dần</option>
                                <option value="2" <c:if test="${sort == 2}">selected</c:if>>Giá giảm dần</option>
                                <option value="3" <c:if test="${sort == 3}">selected</c:if>>Đánh giá tăng dần</option>
                                <option value="4" <c:if test="${sort == 4}">selected</c:if>>Đánh giá giảm dần</option>
                                <option value="5" <c:if test="${sort == 5}">selected</c:if>>Số lượng bán ra tăng dần</option>
                                <option value="6" <c:if test="${sort == 6}">selected</c:if>>Số lượng bán ra giảm dần</option>
                                <option value="7" <c:if test="${sort == 7}">selected</c:if>>Mới nhất</option>
                                </select>

                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="page-filter">
                                <span class="text-uppercase">Hiển thị mỗi trang:</span>
                                <select class="input" id="page-size-1">
                                    <option value="12" <c:if test="${pageSize == 12}">selected</c:if>>12</option>
                                <option value="24" <c:if test="${pageSize == 24}">selected</c:if>>24</option>
                                <option value="60" <c:if test="${pageSize == 60}">selected</c:if>>60</option>
                                </select>
                            </div>
                        </div>

                    <c:if test="${not empty paging}">
                        ${paging}
                    </c:if>
                </div>

                <div id="store">
                    <div class="row">
                        <c:if test="${view == 'grid'}">
                            <c:if test="${not empty products}">
                                <c:forEach items="${products}" var="p">
                                    <div class="col-md-4 col-sm-6 col-xs-6">
                                        <div class="product product-single">
                                            <div class="product-thumb">
                                                <div class="product-label">
                                                    <c:if test="${isNewProduct}">
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
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                    </div>
                </div>

                <div class="store-filter clearfix">
                    <div class="pull-left">
                        <div class="row-filter">
                            <a href="${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}" <c:if test="${view == 'grid'}">class='active'</c:if>><i class="fa fa-th-large"></i></a>
                            <a href="${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=list&sort=${sort}&pageSize=${pageSize}&keyword=${keyword}" <c:if test="${view == 'list'}">class='active'</c:if>><i class="fa fa-bars"></i></a>
                            </div>
                            <div class="sort-filter">
                                <span class="text-uppercase">Sắp xếp theo:</span>
                                <select class="input" id="sort-type-1">
                                    <option value="1" <c:if test="${sort == 1}">selected</c:if>>Giá tăng dần</option>
                                <option value="2" <c:if test="${sort == 2}">selected</c:if>>Giá giảm dần</option>
                                <option value="3" <c:if test="${sort == 3}">selected</c:if>>Đánh giá tăng dần</option>
                                <option value="4" <c:if test="${sort == 4}">selected</c:if>>Đánh giá giảm dần</option>
                                <option value="5" <c:if test="${sort == 5}">selected</c:if>>Số lượng bán ra tăng dần</option>
                                <option value="6" <c:if test="${sort == 6}">selected</c:if>>Số lượng bán ra giảm dần</option>
                                <option value="7" <c:if test="${sort == 7}">selected</c:if>>Mới nhất</option>
                                </select>

                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="page-filter">
                                <span class="text-uppercase">Hiển thị mỗi trang:</span>
                                <select class="input" id="page-size-1">
                                    <option value="12" <c:if test="${pageSize == 12}">selected</c:if>>12</option>
                                <option value="24" <c:if test="${pageSize == 24}">selected</c:if>>24</option>
                                <option value="60" <c:if test="${pageSize == 60}">selected</c:if>>60</option>
                                </select>
                            </div>
                        </div>

                    <c:if test="${not empty paging}">
                        ${paging}
                    </c:if>
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
            window.location.href = '${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=' + $("#sort-type-1").val() + '&pageSize=12&page=1&keyword=';
        });

        $("#sort-type-2").change(function (event) {
            event.preventDefault();
            console.log($("#sort-type-2").val());
            window.location.href = '${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=' + $("#sort-type-2").val() + '&pageSize=12&page=1&keyword=';
        });

        $("#page-size-1").change(function (event) {
            event.preventDefault();
            console.log($("#page-size-1").val());
            window.location.href = '${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=1&pageSize=' + $("#page-size-1").val() + '&page=1&keyword=';
        });

        $("#page-size-2").change(function (event) {
            event.preventDefault();
            console.log($("#page-size-2").val());
            window.location.href = '${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=1&pageSize=' + $("#page-size-2").val() + '&page=1&keyword=';
        });

        var keyword = $("#search-product").val();
        $("#search-product").keydown(function (event) {
            if (event.keyCode === 13) {
                window.location.href = '${pageContext.request.contextPath}/product/index.htm?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=1&pageSize=12&page=1&keyword=' + keyword;
            }
        });

        $("#btn-product").click(function (event) {
            event.preventDefault();
            var keyword = $("#search-product").val();
            window.location.href = '${pageContext.request.contextPath}/product/index.html?brandId=${brandId}&categoryId=${categoryId}&view=grid&sort=1&pageSize=12&page=1&keyword=' + keyword;
        });
    });
</script>


<jsp:include page="widget/footer.jsp" flush="true"/>