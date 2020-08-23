<%-- 
    Document   : new-insert
    Created on : Aug 23, 2020, 12:14:01 PM
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendNew" class="breadcrumb-link">Tin tức</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới tin tức</li>
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
                            <h3 class="card-header"><b>Tạo mới tin tức</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendNew" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendNew/CreateNew" role="form" enctype="multipart/form-data">
                                    <input name="__RequestVerificationToken" type="hidden" value="UYjAT3dMTt1LtXXDZtSnNN5VOyAQUd_HW-CZF81A2QMPeCOEyopdWPsl3lMrB8RZ6KmiII_10vDRbCmJL6uLyCc1HDPF_BF6fAeqIaDUD3o1" />
                                    <div class="form-group">
                                        <label for="CatalogId" class="col-form-label">Chuyên mục tin:</label>
                                        <select name="CatalogId" id="CatalogId" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Tin doanh nghiệp</option>
                                            <option value="2">Tin c&#244;ng nghệ</option>
                                            <option value="3">Tin khuyến m&#227;i</option>
                                            <option value="4">B&#225;o c&#225;o doanh thu</option>
                                            <option value="5">Tuyển dụng</option>
                                            <option value="6">Hướng dẫn</option>
                                            <option value="7">Giải đ&#225;p</option>
                                            <option value="8">Tin tức từ c&#225;c h&#227;ng</option>
                                            <option value="9">Khuyến m&#227;i th&#225;ng</option>
                                            <option value="10">Khuyến m&#227;i đợt</option>
                                            <option value="11">C&#225;c chương tr&#236;nh khuyến m&#227;i</option>
                                            <option value="12">Th&#244;ng tin cửa h&#224;ng</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewTitle" class="col-form-label">Tiêu đề:</label>
                                        <input id="NewTitle" name="NewTitle" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="NewImage" class="col-form-label">Hình ảnh:</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                            </div>
                                            <input type="text" readonly class="form-control" name="NewImage" id="image-url" aria-label="" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewDescription" class="col-form-label">Mô tả ngắn:</label>
                                        <input id="NewDescription" name="NewDescription" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="NewContent" class="col-form-label">Nội dung bài viết:</label>
                                        <textarea name="NewContent" id="NewContent" class="form-control" rows="4" required="required"></textarea>
                                        <script>CKEDITOR.replace('NewContent');</script>
                                        <script>CKFinder.setupCKEditor(null, 'Content/ckfinder')</script>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="NewStatus" id="NewStatus" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Kích hoạt</option>
                                            <option value="0">Không kích hoạt</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="SendEmailRequest" class="col-form-label">Gửi email cho khách hàng đã đăng ký nhận tin:</label>
                                        <select name="SendEmailRequest" id="SendEmailRequest" class="form-control" required>
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Gửi</option>
                                            <option value="0">Không gửi</option>
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