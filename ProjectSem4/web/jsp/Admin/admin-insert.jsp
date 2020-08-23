<%-- 
    Document   : admin-insert
    Created on : Aug 23, 2020, 12:24:01 PM
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendAdmin/Create" class="breadcrumb-link">Quản trị viên</a></li>
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
                                <a href="/Admin/BackendAdmin" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendAdmin/CreateAdmin" enctype="multipart/form-data">
                                    <input name="__RequestVerificationToken" type="hidden" value="5R7kjNvil9PPcitZehe7b0lix8m2jfiU9wBemCXPEMt7EABWEBPNBHN47W2sIoxzzLy2c8UdfIliH1qC-MKhbOpGlCZw9EjZx9xWVAlMwCM1" />
                                    <div class="form-group">
                                        <label for="AdminFullname" class="col-form-label">Họ và tên:</label>
                                        <input id="AdminFullname" name="AdminFullname" maxlength="250" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminBirthday" class="col-form-label">Ngày sinh:</label>
                                        <input id="AdminBirthday" name="AdminBirthday" type="date" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <h5>Giới tính</h5>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input is-valid" id="AdminGenderMale" name="AdminGender" value="1" checked="">
                                            <label class="custom-control-label" for="AdminGenderMale">Nam</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input is-invalid" id="AdminGenderFemale" name="AdminGender" value="0">
                                            <label class="custom-control-label" for="AdminGenderFemale">Nữ</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminEmail">Email:</label>
                                        <input id="AdminEmail" name="AdminEmail" maxlength="250" type="email" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminPhone">Số điện thoại:</label>
                                        <input id="AdminPhone" name="AdminPhone" maxlength="20" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminPassword">Mật khẩu:</label>
                                        <input id="AdminPassword" name="AdminPassword" type="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminIdCard" class="col-form-label">Số CMND:</label>
                                        <input id="AdminIdCard" name="AdminIdCard" maxlength="20" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminAvatar" class="col-form-label">Ảnh đại diện:</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                            </div>
                                            <input type="text" readonly class="form-control" name="AdminAvatar" maxlength="250" id="image-url" aria-label="" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminAddress">Địa chỉ:</label>
                                        <textarea class="form-control" id="AdminAddress" name="AdminAddress" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminHomeLand">Quê quán:</label>
                                        <textarea class="form-control" id="AdminHomeLand" name="AdminHomeLand" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="AdminStatus" class="col-form-label">Chức vụ</label>
                                        <select name="AdminStatus" id="AdminStatus" class="form-control" required="required">
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
</section>

<jsp:include page="widget/footer.jsp" flush="true" />
