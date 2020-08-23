<%-- 
    Document   : banner-insert
    Created on : Aug 23, 2020, 12:31:15 PM
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendBanner" class="breadcrumb-link">Banner</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới banner</li>
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
                            <h3 class="card-header"><b>Thêm mới banner</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendBanner" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendBanner/CreateBanner" enctype="multipart/form-data">
                                    <input name="__RequestVerificationToken" type="hidden" value="CnBgxZ87aQ5IM6U8jMroDjjiz00uy863km8bB3JgO6lmEKwq_PF5O1NKoPpHiG-rAflSkFH9iqgmGjCaJvviOwBbeHWrtNrTkYHRRMf5I0w1" />
                                    <div class="form-group">
                                        <label for="BannerDescription" class="col-form-label">Mô tả banner</label>
                                        <input id="BannerDescription" maxlength="250" name="BannerDescription" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="NewId" class="col-form-label">Bài viết dẫn link:</label>
                                        <select name="NewId" id="NewId" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="9">CHƯƠNG TR&#204;NH KHUYẾN M&#195;I: POWERED BY MSI</option>
                                            <option value="10">AEROCOOL - PROJECT 7  ĐỊNH VỊ THƯƠNG HIỆU CAO CẤP</option>
                                            <option value="11">Kh&#244;ng chỉ l&#224; niềm mơ ước của nhiều game thủ, thời gian tới card đồ họa AMD Radeon VII khả năng sẽ l&#224; m&#243;n hời cho c&#225;c nh&#224; sản xuất nội dung khi c&#243; đến 16GB VRAM v&#224; nhanh hơn người tiền nhiệm Radeon RX Vega 64 đến 36%.</option>
                                            <option value="12">AMD RYZEN</option>
                                            <option value="13">QTC ĐỒNG H&#192;NH C&#217;NG ĐỘI TUYỂN VIỆT NAM</option>
                                            <option value="14">QTC TUYỂN DỤNG VỊ TR&#205; CỰC HOT - REVIEWER CHO CHANNEL YOUTUBE 88.000 SUB+</option>
                                            <option value="15">CHƯƠNG TR&#204;NH KHUYẾN M&#195;I MỪNG SINH NHẬT SHOWROOM TH&#193;I H&#192; 9 TUỔI</option>
                                            <option value="16">Tuyển dụng Nh&#226;n vi&#234;n Kỹ thuật thi c&#244;ng Camera </option>
                                            <option value="17">Hướng dẫn kh&#225;ch h&#224;ng</option>
                                            <option value="19">Ch&#237;nh s&#225;ch d&#249;ng thử sản phẩm:</option>
                                            <option value="20">Ch&#237;nh s&#225;ch giao h&#224;ng</option>
                                            <option value="21">QTCStore khai trương chi nh&#225;nh thứ 5 tại quận H&#224; Đ&#244;ng</option>
                                            <option value="22">B&#225;o c&#225;o doanh số h&#224;ng th&#225;ng</option>
                                            <option value="23">Tin tức về chủ đề &quot;giải đ&#225;p thắc mắc&quot;</option>
                                            <option value="24">Giới thiệu hệ thống cửa h&#224;ng QTC</option>
                                            <option value="25">Laptop Dell</option>
                                            <option value="26">LAPTOP Khuyến mại</option>
                                            <option value="27">Duy nhất chỉ c&#243; tại QTC</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="BannerImage" class="col-form-label">Hình ảnh:</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                            </div>
                                            <input type="text" readonly class="form-control" maxlength="250" name="BannerImage" id="image-url" aria-label="" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="BannerStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="BannerStatus" id="BannerStatus" class="form-control" required="required">
                                            <option value="">Vui lòng chọn</option>
                                            <option value="1">Kích hoạt</option>
                                            <option value="0">Không kích hoạt</option>
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

