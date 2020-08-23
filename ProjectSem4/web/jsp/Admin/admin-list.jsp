<%-- 
    Document   : admin-list
    Created on : Aug 23, 2020, 12:23:44 PM
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
                                <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                            <li class="breadcrumb-item"><a href="/Admin/BackendAdmin" class="breadcrumb-link">Quản trị viên</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Danh sách</li>
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
                                    <a href="/Admin/BackendAdmin/Create" class="btn btn-secondary"><i class="fas fa-plus"></i> Thêm mới quản trị viên</a>
                                    <div class="clearfix"><br></div>
                                    <form method="POST" action="/Admin/BackendAdmin/SearchAdmin">
                                        <input name="__RequestVerificationToken" type="hidden" value="fLASYEyQnTZ6GRCjYb2mNR-k-BcVwCIQBqNDb4t2T4fqxvISL3AnukEZNqxgjATIA28xQc3dTDFVe489peijGY99mt9lvOuvG6aVdqF_Aec1" />
                                        <input class="form-control form-control-lg" name="AdminEmail" type="search" placeholder="Tìm kiếm quản trị viên theo email..." aria-label="Search">
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
                                            <div class="user-avatar float-xl-left pr-4 float-none">
                                                <img src="Uploads/images/48426160_369955007105044_8956461886950342656_n.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                            </div>
                                            <div class="pl-xl-3">
                                                <div class="m-b-0">
                                                    <div class="user-avatar-name d-inline-block">
                                                        <h2 class="font-24 m-b-10">Trần Thảo Loan</h2>
                                                    </div>
                                                </div>
                                                <div class="user-avatar-address">
                                                    <p class="mb-2">
                                                        <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">Sơn La</span>
                                                    </p>
                                                    <p class="mb-2">
                                                        <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <span class="m-l-10">Nữ</span>
                                                    </p>
                                                    <p class="mb-2">
                                                        <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10">11/10/1997 12:00:00 AM</span>
                                                    </p>
                                                    <div class="mt-3">
                                                        <span class='badge badge-danger'>Quản trị viên</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="float-xl-right float-none mt-xl-0 mt-4">
                                                <a href="/Admin/BackendAdmin/Info?AdminId=2" class="btn btn-secondary">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="user-avatar float-xl-left pr-4 float-none">
                                                <img src="Uploads/images/1adminavatar23295223122018.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                            </div>
                                            <div class="pl-xl-3">
                                                <div class="m-b-0">
                                                    <div class="user-avatar-name d-inline-block">
                                                        <h2 class="font-24 m-b-10">Dư Hồng Qu&#226;n</h2>
                                                    </div>
                                                </div>
                                                <div class="user-avatar-address">
                                                    <p class="mb-2">
                                                        <i class="fa fa-map-marker-alt mr-2 text-primary"></i>Địa chỉ: <span class="m-l-10">Số nh&#224; 16 ng&#245; 5 Phạm Văn Đồng - Mai Dịch - Cầu Giấy - H&#224; Nội</span>
                                                    </p>
                                                    <p class="mb-2">
                                                        <i class="fas fa-user mr-2 text-primary"></i>Giới tính: <span class="m-l-10">Nam</span>
                                                    </p>
                                                    <p class="mb-2">
                                                        <i class="fas fa-calendar-alt mr-2 text-primary"></i>Ngày sinh: <span class="m-l-10">11/24/1990 12:00:00 AM</span>
                                                    </p>
                                                    <div class="mt-3">
                                                        <span class='badge badge-danger'>Quản trị viên</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="float-xl-right float-none mt-xl-0 mt-4">
                                                <a href="/Admin/BackendAdmin/Info?AdminId=1" class="btn btn-secondary">Xem chi tiết</a>
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
