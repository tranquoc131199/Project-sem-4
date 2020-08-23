<%-- 
    Document   : product-list
    Created on : Aug 21, 2020, 12:17:23 AM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTB Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget" id="append-products">
                <div class="row">
                    <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                        <a href="/Admin/BackendProduct/Create" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Thêm mới sản phẩm</a>
                        <div class="clearfix"><br></div>
                        <div class="row">
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=56">
                                                <img src="Uploads/images/ProductImages/QTC/No1/No11.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">178,049,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=56" title="PC HNC SPECIAL EDITION No1">
                                                    PC HNC SPECIAL EDITION No1                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=56" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=56" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=55">
                                                <img src="Uploads/images/ProductImages/QTC/P12/P121.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">16,690,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=55" title="PC HNC PROFESSIONAL GAMING P12">
                                                    PC HNC PROFESSIONAL GAMING P12                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=55" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=55" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=54">
                                                <img src="Uploads/images/ProductImages/Dell/T5820/T5820.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">53,999,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=54" title="Workstation Dell Precision T5820">
                                                    Workstation Dell Precision T5820                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=54" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=54" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=53">
                                                <img src="Uploads/images/ProductImages/Dell/T3630/T36301.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">24,990,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=53" title="Workstation Dell Precision T3630">
                                                    Workstation Dell Precision T3630                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=53" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=53" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=52">
                                                <img src="Uploads/images/ProductImages/Asus/D340MC-I38100002D/D340MC-I38100002D02.png" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">8,699,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=52" title="PC Asus D340MC-I38100002D">
                                                    PC Asus D340MC-I38100002D                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=52" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=52" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=51">
                                                <img src="Uploads/images/ProductImages/Acer/XC-885/XC-88502.png" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">985,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=51" title="PC Acer Aspire XC-885 DT">
                                                    PC Acer Aspire XC-885 DT                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=51" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=51" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=50">
                                                <img src="Uploads/images/ProductImages/Dell/N5680A/N5680A04.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">22,999,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=50" title="PC Dell Inspiron N5680A">
                                                    PC Dell Inspiron N5680A                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=50" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=50" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=49">
                                                <img src="Uploads/images/ProductImages/Dell/3579_70165058/3579%2070165058_01.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">24,489,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=49" title="Laptop Dell Gaming G3 3579 70165058 i7 8750H/4G/2TB + 16GB Optane SDD /1050Ti 4G/ 15.6 Full HD/FP/ Win 10">
                                                    Laptop Dell Gaming G3 3579 70165058 i7 8750H/4G/2TB + 16GB O...                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=49" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=49" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=48">
                                                <img src="Uploads/images/ProductImages/Dell/5481%2070175946/70170107_01.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">23,987,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=48" title="Laptop Dell Vostro 5481 70175946 i7 /1.55kg/Win 10">
                                                    Laptop Dell Vostro 5481 70175946 i7 /1.55kg/Win 10                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=48" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=48" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=47">
                                                <img src="Uploads/images/ProductImages/Dell/70170107/70170107_04.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">35,999,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=47" title="Laptop Dell XPS 13 9370 70170107 Vỏ nh&#244;m khối / Bạc/">
                                                    Laptop Dell XPS 13 9370 70170107 Vỏ nh&#244;m khối / Bạc/                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=47" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=47" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=46">
                                                <img src="Uploads/images/ProductImages/Asus/Laptop/GX531GW-ES006T/GX531GW-ES006T01.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">61,990,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=46" title="Laptop ASUS ROG Zephyrus S GX531GW-ES006T">
                                                    Laptop ASUS ROG Zephyrus S GX531GW-ES006T                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=46" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=46" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="product-thumbnail">
                                    <div class="product-img-head">
                                        <div class="product-img">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=45">
                                                <img src="Uploads/images/ProductImages/Asus/Laptop/GX531GM-ES004T/GX531GM-ES004T-01.jpg" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="ribbons"></div>
                                        <div class="ribbons-text">
                                            0%
                                        </div>
                                        <div class="product-price">54,990,000 VNĐ</div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-content-head">
                                            <h3 class="product-title">
                                                <a href="/Admin/BackendProduct/Detail?ProductId=45" title="Laptop ASUS ROG Zephyrus S GX531GM-ES004T">
                                                    Laptop ASUS ROG Zephyrus S GX531GM-ES004T                                                        </a>
                                            </h3>
                                            <div class="product-rating d-inline-block">
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                                <i class="fa fa-fw fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-btn">
                                            <a href="/Admin/BackendProduct/Detail?ProductId=45" class="btn btn-primary">Xem chi tiết</a>
                                            <a href="/Admin/BackendProduct/Edit?ProductId=45" class="btn btn-outline-light">Sửa sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <nav aria-label='Page navigation example'>
                                    <ul class='pagination'>
                                        <li class='disabled page-item'><a class='page-link'>&laquo;&laquo;</a></li>
                                        <li class='disabled page-item'><a class='page-link'>&laquo;</a></li>
                                        <li class='active page-item'><span class='page-link'>1</span></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=2&brandId=0&categoryId=0&keyword='>2</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=3&brandId=0&categoryId=0&keyword='>3</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=4&brandId=0&categoryId=0&keyword='>4</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=5&brandId=0&categoryId=0&keyword='>5</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=2&brandId=0&categoryId=0&keyword='>&raquo;</a></li>
                                        <li class='page-item'><a class='page-link' href='/Admin/BackendProduct/Index/?page=5&brandId=0&categoryId=0&keyword='>&raquo;&raquo;</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                        <div class="product-sidebar">
                            <div class="product-sidebar-widget">
                                <h4 class="mb-0">Bộ lọc</h4>
                            </div>
                            <div class="product-sidebar-widget">
                                <h4 class="product-sidebar-widget-title">Danh mục</h4>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=1&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Laptop &amp; phụ kiện</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=2&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>M&#225;y đồng bộ</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=3&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>M&#225;y chơi game</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=4&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Linh kiện m&#225;y t&#237;nh</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=5&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>M&#225;y chủ &amp; M&#225;y trạm</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=6&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Gaming Gear &amp; Console</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=0&categoryId=7&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Giải ph&#225;p tản nhiệt</span>
                                    </div>
                                </a>
                            </div>
                            <div class="product-sidebar-widget">
                                <h4 class="product-sidebar-widget-title">Hãng</h4>
                                <a href="/Admin/BackendProduct/Index/?brandId=2&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Asus</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=4&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>MSI</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=5&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Samsung</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=6&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Gigabyte</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=7&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Inno3D</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=8&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Thermaltake</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=9&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Xigmatek</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=10&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>NZXT</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=11&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Razer</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=12&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Corsair</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=14&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Intel</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=15&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>AMD</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=16&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Western Digital</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=17&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Sennheiser</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=18&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>DXRACER</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=19&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Sony</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=20&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Microsoft</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=21&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Acer</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=22&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>Dell</span>
                                    </div>
                                </a>
                                <a href="/Admin/BackendProduct/Index/?brandId=23&categoryId=0&page=1&keyword=">
                                    <div class="custom-control span-around ">
                                        <span>QTC</span>
                                    </div>
                                </a>
                            </div>
                            <div class="product-sidebar-widget">
                                <a href="/Admin/BackendProduct/ResetFilter" class="btn btn-outline-light" id="reset-filter">Tạo lại bộ lọc</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true" />
