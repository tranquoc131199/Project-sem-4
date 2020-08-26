<%-- 
    Document   : user-wishlist
    Created on : Aug 17, 2020, 10:38:23 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Danh sách yêu thích</li>
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
    <div class="function-item ">
        <a href="/Customer/ChangeAvatar" title="Đổi ảnh đại diện">Đổi ảnh đại diện</a>
    </div>
    <div class="function-item function-active">
        <a href="/Customer/Wishlist" title="Danh sách yêu thích">Danh sách yêu thích</a>
    </div>
    <div class="function-item ">
        <a href="/Customer/OrderList" title="Đơn hàng">Đơn hàng</a>
    </div>
</div>
            </div>
            <div class="col-md-9">
                <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-6">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span class='text-center'>Mới</span>
                                        </div>
                                        <a href="/Product/Detail?ProductId=9" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                        <img src="Areas/Admin/Uploads/images/ProductImages/Intel/SSD/Optane32GB/optan1.jpg" alt="Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            990,000                                         </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name"><a href="/Product/Detail?ProductId=9">Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s</a></h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="9"><i class="fa fa-heart active"></i></a>
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
                                        <a href="/Product/Detail?ProductId=54" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                        <img src="Areas/Admin/Uploads/images/ProductImages/Dell/T5820/T5820.jpg" alt="Workstation Dell Precision T5820" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            53,999,000                                         </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name"><a href="/Product/Detail?ProductId=54">Workstation Dell Precision T5820</a></h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="54"><i class="fa fa-heart active"></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="54"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="54"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
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
                                        <a href="/Product/Detail?ProductId=56" class="main-btn quick-view"><i class="fa fa-eye"></i> Chi tiết</a>
                                        <img src="Areas/Admin/Uploads/images/ProductImages/QTC/No1/No11.jpg" alt="PC HNC SPECIAL EDITION No1" />
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">
                                            178,049,000                                         </h3>
                                        <div class="product-rating">
                                            <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                        </div>
                                        <h2 class="product-name"><a href="/Product/Detail?ProductId=56">PC HNC SPECIAL EDITION No1</a></h2>
                                        <div class="product-btns">
                                            <a href="" class="main-btn icon-btn" data-id="56"><i class="fa fa-heart active"></i></a>
                                            <a href="" class="main-btn icon-btn" data-id="56"><i class="fa fa-exchange"></i></a>
                                            <a href="" class="primary-btn add-to-cart pull-right" data-id="56"><i class="fa fa-shopping-cart"></i> Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true"/>
