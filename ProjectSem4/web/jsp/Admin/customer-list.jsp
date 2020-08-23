<%-- 
    Document   : customer-list
    Created on : Aug 21, 2020, 12:58:46 AM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="influence-finder">
        <div class="container-fluid dashboard-content">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTB Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh sách khách hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <form method="POST" action="">
                                <input name="__RequestVerificationToken" type="hidden" value="" />
                                <input class="form-control form-control-lg" type="search" name="CustomerName" placeholder="Tìm kiếm khách hàng theo tên..." aria-label="Search">
                                <button class="btn btn-primary search-btn" type="submit">Tìm</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-8 col-md-8 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="row">
                                        <div class="col col-md-2 user-avatar float-xl-left pr-4 float-none text-center">
                                            <a href="/admin/customer/detail.html?customerId=">
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/assets/images/trieulotu.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                            </a>
                                            <h2 class="font-24 m-b-10"><a href="">Quoc</a></h2>
                                            <p>                                           
                                                <span class='badge badge-success'>Kích hoạt</span>

                                            </p>
                                        </div>
                                        <div class="col col-md-10 pl-xl-3">
                                            <div class="user-avatar-address">
                                                <p class="mb-2">
                                                    <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">Nhổn</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <span class="m-l-10">Nam</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10">3/12/1995 12:00:00 AM</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-envelope mr-2 text-primary"></i>Email: <span class="m-l-10">phuongml@gmail.com</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-phone mr-2 text-primary"></i>Điện thoại: <span class="m-l-10">0903286182</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="row">
                                        <div class="col col-md-2 user-avatar float-xl-left pr-4 float-none text-center">
                                            <a href="/admin/customer/detail.html?customerId=">
                                                <img src="${pageContext.request.contextPath}/jsp/Admin/assets/images/trieulotu.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                            </a>
                                            <h2 class="font-24 m-b-10"><a href="">Quoc</a></h2>
                                            <p>                                           
                                                <span class='badge badge-success'>Kích hoạt</span>

                                            </p>
                                        </div>
                                        <div class="col col-md-10 pl-xl-3">
                                            <div class="user-avatar-address">
                                                <p class="mb-2">
                                                    <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">Nhổn</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <span class="m-l-10">Nam</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10">3/12/1995 12:00:00 AM</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-envelope mr-2 text-primary"></i>Email: <span class="m-l-10">phuongml@gmail.com</span>
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-phone mr-2 text-primary"></i>Điện thoại: <span class="m-l-10">0903286182</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true" />
