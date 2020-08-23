<%-- 
    Document   : admin-detail
    Created on : Aug 23, 2020, 12:24:12 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="/Admin/BackendAdmin" class="breadcrumb-link">Quản trị viên</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thông tin quản trị viên</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="user-avatar text-center d-block">
                                <img src="Uploads/images/48426160_369955007105044_8956461886950342656_n.jpg" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                            </div>
                            <div class="text-center">
                                <h2 class="font-24 mb-0">Trần Thảo Loan</h2>
                                <p>
                                    <span class='badge badge-danger'>Quản trị viên</span>
                                </p>
                            </div>
                        </div>
                        <div class="card-body border-top">
                            <h3 class="font-16">Thông tin liên lạc</h3>
                            <div class="">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i><a href="malto:renn.meoo@gmail.com">renn.meoo@gmail.com</a></li>
                                    <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i><a href="tel:0849241190">0849241190</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body border-top">
                            <h3 class="font-16">Liên kết mạng xã hội</h3>
                            <div class="">
                                <ul class="mb-0 list-unstyled">
                                    <li><h3>Chức năng đang được phát triển</h3></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                    <div class="influence-profile-content pills-regular">
                        <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="pills-information-tab" data-toggle="pill" href="#pills-information" role="tab" aria-controls="pills-information" aria-selected="true">Thông tin cá nhân</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-information" role="tabpanel" aria-labelledby="pills-information-tab">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="section-block">
                                            <h2 class="section-title">Thông tin cá nhân</h2>
                                        </div>
                                    </div>
                                    <table>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-user mr-2 text-secondary"></i>Giới tính:</th>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-calendar-alt mr-2 text-secondary"></i>Ngày sinh:</th>
                                            <td>11/10/1997 12:00:00 AM</td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-envelope mr-2 text-secondary"></i>Email:</th>
                                            <td><a href="mailto: renn.meoo@gmail.com">renn.meoo@gmail.com</a></td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-phone mr-2 text-secondary"></i>Điện thoại:</th>
                                            <td><a href="tel:0849241190">0849241190</a></td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-address-card mr-2 text-secondary"></i>Quê quán:</th>
                                            <td>Hải Dương</td>
                                        </tr>
                                        <tr>
                                            <th style="padding-right: 20px;"><i class="fas fa-map-signs mr-2 text-secondary"></i>Địa chỉ:</th>
                                            <td>Sơn La</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true" />
