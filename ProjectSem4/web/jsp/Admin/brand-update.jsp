<%-- 
    Document   : brand-update
    Created on : Aug 22, 2020, 11:40:29 AM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true" />
<jsp:include page="widget/navbar.jsp" flush="true" />
<!DOCTYPE html>
<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">1
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="/Admin/BackendBrand" class="breadcrumb-link">Hãng sản xuất</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa hãng sản xuất</li>
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
                            <h3 class="card-header"><b>Thông tin hãng</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendBrand" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendBrand/EditBrand" role="form" enctype="multipart/form-data">
                                    <input name="__RequestVerificationToken" type="hidden" value="XKbPpcJ1L3V-zwDz3v3Z8PLkYfgjeJLfdVLtMdaVe1qrX-7B_eaDA9pJoPCMFvEFoxcJxuyOf2MVX45pteGnVmHmMSMFJYUXeyr3FL3ZqYE1" />
                                    <div class="form-group">
                                        <label for="BrandName" class="col-form-label">Tên hãng:</label>
                                        <input id="BrandName" name="BrandName" maxlength="250" type="text" class="form-control" value="Dell">
                                        <input name="BrandId" type="hidden" value="22">
                                    </div>
                                    <div class="form-group">
                                        <label for="BrandLogo" class="col-form-label">Logo:</label>
                                        <br/>
                                        <img class="img-fluid" style="max-width: 150px;" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brand-Logo/logodell.png" />
                                        <div class="clearfix"><br/></div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                            </div>
                                            <input type="text" readonly class="form-control" maxlength="250" name="BrandLogo" value="Uploads/images/Brand-Logo/logodell.png" id="image-url" aria-label="" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="BrandStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="BrandStatus" id="BrandStatus" class="form-control" required="required">
                                            <option value="1" selected>Kích hoạt</option>
                                            <option value="0" >Không kích hoạt</option>
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