<%-- 
    Document   : product-insert
    Created on : Aug 21, 2020, 12:43:24 AM
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
                        <h2 class="pageheader-title">Trang quản trị QTB Shop</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="/Admin/BackendProduct" class="breadcrumb-link">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <form role="form" method="POST" action="/Admin/BackendProduct/CreateProduct" enctype="multipart/form-data" class="wd-100">
                        <input name="__RequestVerificationToken" type="hidden" value="4azbddtfaRGnx5K0VdaoYNIDLlX4RsY_5_TvChaSEM0AVJF9ajCdOWp9aFMiExlR6aPD5jbWPn0bQv9WfN2dsaJ5hSl9x3OCSW9T5AhWleg1" />
                        <div class="form-group">
                            <label for="ProductName" class="col-form-label">Tên sản phẩm:</label>
                            <input id="ProductName" maxlength="250" name="ProductName" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="ProductCode" class="col-form-label">Mã hiệu sản phẩm:</label>
                            <input id="ProductCode" maxlength="20" name="ProductCode" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="ProductSale" class="col-form-label">Mức giảm giá:</label>
                            <input id="ProductSale" name="ProductSale" type="number" class="form-control" min="0" value="0">
                        </div>
                        <div class="form-group">
                            <label for="CategoryId" class="col-form-label">Danh mục:</label>
                            <select name="CategoryId" id="CategoryId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="1">Laptop &amp; phụ kiện</option>
                                <option value="2">M&#225;y đồng bộ</option>
                                <option value="3">M&#225;y chơi game</option>
                                <option value="4">Linh kiện m&#225;y t&#237;nh</option>
                                <option value="5">M&#225;y chủ &amp; M&#225;y trạm</option>
                                <option value="6">Gaming Gear &amp; Console</option>
                                <option value="7">Giải ph&#225;p tản nhiệt</option>
                                <option value="8">CPU</option>
                                <option value="9">Mainboard</option>
                                <option value="10">RAM - Bộ nhớ trong</option>
                                <option value="11">Ổ cứng HDD</option>
                                <option value="12">Ổ cứng SSD</option>
                                <option value="13">VGA - Card m&#224;n h&#236;nh</option>
                                <option value="14">Monitor - M&#224;n h&#236;nh</option>
                                <option value="15">Case - vỏ m&#225;y t&#237;nh</option>
                                <option value="16">PSU - Nguồn</option>
                                <option value="17">Sound Card</option>
                                <option value="18">ODD - Ổ đĩa quang</option>
                                <option value="19">B&#224;n ph&#237;m chơi game</option>
                                <option value="20">Chuột chơi game</option>
                                <option value="21">Ghế chơi game</option>
                                <option value="22">B&#224;n gaming</option>
                                <option value="23">Tai nghe chơi game</option>
                                <option value="24">Tay cầm game</option>
                                <option value="25">B&#224;n di chuột</option>
                                <option value="26">M&#225;y chơi game console</option>
                                <option value="27">K&#237;nh thực tế ảo</option>
                                <option value="28">Game bản quyền</option>
                                <option value="29">Loa</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="BrandId" class="col-form-label">Hãng sản xuất:</label>
                            <select name="BrandId" id="BrandId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="2">Asus</option>
                                <option value="4">MSI</option>
                                <option value="5">Samsung</option>
                                <option value="6">Gigabyte</option>
                                <option value="7">Inno3D</option>
                                <option value="8">Thermaltake</option>
                                <option value="9">Xigmatek</option>
                                <option value="10">NZXT</option>
                                <option value="11">Razer</option>
                                <option value="12">Corsair</option>
                                <option value="14">Intel</option>
                                <option value="15">AMD</option>
                                <option value="16">Western Digital</option>
                                <option value="17">Sennheiser</option>
                                <option value="18">DXRACER</option>
                                <option value="19">Sony</option>
                                <option value="20">Microsoft</option>
                                <option value="21">Acer</option>
                                <option value="22">Dell</option>
                                <option value="23">QTC</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ProductFeatureImage" class="col-form-label">Ảnh đại diện của sản phẩm:</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                </div>
                                <input type="text" readonly class="form-control" maxlength="250" name="ProductFeatureImage" id="image-url" aria-label="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ProductPrice" class="col-form-label">Giá:</label>
                            <input id="ProductPrice" name="ProductPrice" type="number" min="1000" value="1000" step="1000" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="ProductSpecification" class="col-form-label">Thông số kỹ thuật của sản phẩm:</label>
                            <textarea name="ProductSpecification" id="ProductSpecification" class="form-control" rows="3"></textarea>
                            <script>CKEDITOR.replace('ProductSpecification');</script>
                            <script>CKFinder.setupCKEditor(null, 'Content/ckfinder')</script>
                        </div>
                        <div class="form-group">
                            <label for="ProductDescription" class="col-form-label">Mô tả sản phẩm:</label>
                            <textarea name="ProductDescription" id="ProductDescription" class="form-control" rows="3"></textarea>
                            <script>CKEDITOR.replace('ProductDescription');</script>
                            <script>CKFinder.setupCKEditor(null, 'Content/ckfinder')</script>
                        </div>
                        <div class="form-group">
                            <label for="ProductImage" class="col-form-label">Hình ảnh sản phẩm:</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-primary" type="button" id="btn-uploads">Chọn ảnh</button>
                                </div>
                                <input type="text" readonly class="form-control" name="ProductImage" id="images-url" aria-label="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ProductStatus" class="col-form-label">Trạng thái:</label>
                            <select name="ProductStatus" id="ProductStatus" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="1">Kích hoạt</option>
                                <option value="0">Không kích hoạt</option>
                            </select>
                        </div>
<!--                        <div class="form-group">
                            <label for="SendEmailRequest" class="col-form-label">Gửi email cho khách hàng đã đăng ký nhận tin:</label>
                            <select name="SendEmailRequest" id="SendEmailRequest" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="1">Gửi</option>
                                <option value="0">Không gửi</option>
                            </select>
                        </div>-->
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-check"></i> Xác nhận</button>
                            <button type="reset" class="btn btn-sm btn-danger"><i class="fas fa-retweet"></i> Làm lại</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true" />