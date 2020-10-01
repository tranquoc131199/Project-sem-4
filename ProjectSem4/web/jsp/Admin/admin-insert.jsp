<%-- 
    Document   : admin-insert
    Created on : 
    Author     : Thang Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>

<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTBStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.htm" class="breadcrumb-link">Quản trị viên</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới quản trị viên</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header"><b>Tạo mới quản trị viên</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/index.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/admin-do-insert.htm" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="adminFullname" class="col-form-label">Họ và tên:</label>
                                        <input id="adminFullname" name="adminFullname" maxlength="250" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminBirthday" class="col-form-label">Ngày sinh:</label>
                                        <input id="adminBirthday" name="adminBirthday" type="date" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <h5>Giới tính</h5>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input is-valid" id="AdminGenderMale" name="adminGender" value="1" checked="">
                                            <label class="custom-control-label" for="AdminGenderMale">Nam</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input is-invalid" id="AdminGenderFemale" name="adminGender" value="0">
                                            <label class="custom-control-label" for="AdminGenderFemale">Nữ</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminEmail">Email:</label>
                                        <input id="adminEmail" name="adminEmail" maxlength="250" type="email" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminPhone">Số điện thoại:</label>
                                        <input id="adminPhone" name="adminPhone" maxlength="20" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminPassword">Mật khẩu:</label>
                                        <input id="adminPassword" name="adminPassword" type="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminIdCard" class="col-form-label">Số CMND:</label>
                                        <input id="adminIdCard" name="adminIdCard" maxlength="20" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminAvatar" class="col-form-label">Ảnh đại diện:</label>
                                        <input type="file" class="form-control" id="adminAvatar" name="adminAvatar" maxlength="250" />
                                    </div>
                                    <div class="form-group">
                                        <label for="adminAddress">Địa chỉ:</label>
                                        <textarea class="form-control" id="adminAddress" name="adminAddress" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminHomeLand">Quê quán:</label>
                                        <textarea class="form-control" id="adminHomeLand" name="adminHomeLand" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminStatus" class="col-form-label">Chức vụ</label>
                                        <select name="adminStatus" id="adminStatus" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Quản trị viên</option>
                                            <option value="2">Quản lý cấp cao</option>
                                            <option value="3">Quản lý</option>
                                            <option value="4">Người kiểm duyệt</option>
                                            <option value="5">Nhân viên</option>
                                            <option value="0">Khoá</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-check"></i> Xác nhận</button>
                                        <button type="reset" class="btn btn-sm btn-danger"><i class="fas fa-retweet"></i> Làm lại</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    Copyright © 2018 QTCStore. All rights reserved customize by <a href="https://facebook.com/phamducthang452/" target="_blank">ThangPD</a>.
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="text-md-right footer-links d-none d-sm-block">
                        <a href="javascript: void(0);">About</a>
                        <a href="javascript: void(0);">Support</a>
                        <a href="javascript: void(0);">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
