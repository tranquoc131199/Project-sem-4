<%-- 
    Document   : new-update
    Created on : Aug 23, 2020, 12:14:59 PM
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
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa tin tức</li>
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
                            <h3 class="card-header"><b>Chỉnh sửa tin tức</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendNew" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendNew/EditNew" role="form" enctype="multipart/form-data">
                                    <input name="__RequestVerificationToken" type="hidden" value="iaozAiIj-17Xi-jSRZOo6TN8uowNY7qz2wUbdx_gStk-sOJ9g_AmFgC5g2Gq87vMAfa69lTwAowvmSYQrW9vfoNw5FXCyIfUASauZIhu4fA1" />
                                    <div class="form-group">
                                        <label for="CatalogId" class="col-form-label">Chuyên mục tin:</label>
                                        <select name="CatalogId" id="CatalogId" class="form-control" required="required">
                                            <option value="1" >Tin doanh nghiệp</option>
                                            <option value="2" >Tin c&#244;ng nghệ</option>
                                            <option value="3" >Tin khuyến m&#227;i</option>
                                            <option value="4" >B&#225;o c&#225;o doanh thu</option>
                                            <option value="5" >Tuyển dụng</option>
                                            <option value="6" >Hướng dẫn</option>
                                            <option value="7" >Giải đ&#225;p</option>
                                            <option value="8" >Tin tức từ c&#225;c h&#227;ng</option>
                                            <option value="9" >Khuyến m&#227;i th&#225;ng</option>
                                            <option value="10" selected>Khuyến m&#227;i đợt</option>
                                            <option value="11" >C&#225;c chương tr&#236;nh khuyến m&#227;i</option>
                                            <option value="12" >Th&#244;ng tin cửa h&#224;ng</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewTitle" class="col-form-label">Tiêu đề:</label>
                                        <input id="NewTitle" name="NewTitle" type="text" class="form-control" value="Duy nhất chỉ c&#243; tại QTC">
                                        <input type="hidden" name="NewId" value="27" />
                                    </div>
                                    <div class="form-group">
                                        <label for="NewImage" class="col-form-label">Hình ảnh:</label>
                                        <img class="img-fluid" style="max-width: 150px;" src="Uploads/images/News/khuyenmai.png" />
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                            </div>
                                            <input type="text" readonly class="form-control" name="NewImage" value="Uploads/images/News/khuyenmai.png" id="image-url" aria-label="" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewDescription" class="col-form-label">Mô tả ngắn:</label>
                                        <input id="NewDescription" name="NewDescription" type="text" class="form-control" value="Sản phẩm mua tại QTC l&#224; h&#224;ng ch&#237;nh h&#227;ng, bạn c&#243; thể chọn chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 097543355 để được tư vấn, mua h&#224;ng nhanh.">
                                    </div>
                                    <div class="form-group">
                                        <label for="NewContent" class="col-form-label">Nội dung bài viết:</label>
                                        <textarea name="NewContent" id="NewContent" class="form-control" rows="4" required="required">&lt;p&gt;Được biết, từ nay &amp;ndash; 192/4, khi đặt mua trước si&amp;ecirc;u phẩm tầm trung OPPO F11 tại FPT Shop, bạn sẽ được nhận ngay bộ qu&amp;agrave; tặng si&amp;ecirc;u khủng gồm:&lt;/p&gt;

                                                    &lt;ul&gt;
                                                    &lt;li&gt;Loa bluetooth Havit&lt;/li&gt;
                                                    &lt;li&gt;Trả g&amp;oacute;p 0% l&amp;atilde;i suất&lt;/li&gt;
                                                    &lt;li&gt;G&amp;oacute;i bảo h&amp;agrave;nh 2 năm&lt;/li&gt;
                                                    &lt;li&gt;Giảm th&amp;ecirc;m 5% khi thanh to&amp;aacute;n qua VN Pay (tối đa 500.000 đồng)&lt;/li&gt;
                                                    &lt;/ul&gt;

                                                    &lt;p&gt;Như vậy, bạn chỉ cần trả trước từ 2,18 triệu đồng (tương đương 30% gi&amp;aacute; trị sản phẩm) l&amp;agrave; đ&amp;atilde; trở th&amp;agrave;nh chủ nh&amp;acirc;n của chiếc smartphone &amp;ldquo;đ&amp;igrave;nh đ&amp;aacute;m&amp;rdquo; OPPO F11, khoản c&amp;ograve;n lại sẽ được trả g&amp;oacute;p với l&amp;atilde;i suất ưu đ&amp;atilde;i 0%..&lt;/p&gt;

                                                    &lt;p&gt;&lt;em&gt;&lt;img alt=&quot;Nhận th&#234;m phiếu mua h&#224;ng 500.000 đồng khi nhận OPPO F11 tại FPT Shop&quot; id=&quot;OPPO F11&quot; src=&quot;https://fptshop.com.vn/uploads/images/tin-tuc/82366/Originals/F11_8.PNG&quot; title=&quot;OPPO F11&quot; /&gt;&lt;/em&gt;&lt;/p&gt;

                                                    &lt;p&gt;&lt;em&gt;V&amp;agrave;o ng&amp;agrave;y 20/4, 50 kh&amp;aacute;ch h&amp;agrave;ng đầu ti&amp;ecirc;n đến nhận m&amp;aacute;y OPPO F11 tại FPT Shop sẽ được tặng th&amp;ecirc;m phiếu mua h&amp;agrave;ng 500.000 đồng&lt;/em&gt;&lt;/p&gt;

                                                    &lt;p&gt;Từ ng&amp;agrave;y 20/4, OPPO F11 sẽ ch&amp;iacute;nh thức l&amp;ecirc;n kệ tại tất cả c&amp;aacute;c cửa h&amp;agrave;ng thuộc FPT Shop tr&amp;ecirc;n to&amp;agrave;n quốc với gi&amp;aacute; b&amp;aacute;n si&amp;ecirc;u y&amp;ecirc;u đ&amp;atilde;i 7.290.000 đồng, c&amp;ugrave;ng 2 m&amp;agrave;u sang trọng Xanh Ngọc Thạch v&amp;agrave; T&amp;iacute;m Thạch Anh. Đặc biệt, khi chọn mua OPPO F11 tại FPT Shop, bạn kh&amp;ocirc;ng chỉ được hưởng ưu đ&amp;atilde;i trả g&amp;oacute;p 0% l&amp;atilde;i suất với khoản trả trước chỉ từ 2,18 triệu đồng, m&amp;agrave; c&amp;ograve;n được giảm th&amp;ecirc;m 5% (tối đa 500.000 đồng) khi thanh to&amp;aacute;n qua VNPAY-QR.&lt;/p&gt;

                                                    &lt;h3&gt;&lt;a href=&quot;https://fptshop.com.vn/dien-thoai/oppo-f11&quot; target=&quot;_blank&quot;&gt;ĐẶT MUA OPPO F11&lt;/a&gt;&lt;/h3&gt;

                                                    &lt;h3&gt;&lt;strong&gt;Một số h&amp;igrave;nh ảnh của chiếc smartphone đ&amp;igrave;nh đ&amp;aacute;m OPPO F11:&lt;/strong&gt;&lt;/h3&gt;

                                                    &lt;p&gt;&lt;img alt=&quot;Nhận th&#234;m phiếu mua h&#224;ng 500.000 đồng khi nhận OPPO F11 tại FPT Shop&quot; id=&quot;OPPO F11&quot; src=&quot;https://fptshop.com.vn/uploads/images/tin-tuc/82366/Originals/F11_6.PNG&quot; title=&quot;OPPO F11&quot; /&gt;&lt;/p&gt;

                                                    &lt;p&gt;&lt;img alt=&quot;Nhận th&#234;m phiếu mua h&#224;ng 500.000 đồng khi nhận OPPO F11 tại FPT Shop&quot; id=&quot;OPPO F11&quot; src=&quot;https://fptshop.com.vn/uploads/images/tin-tuc/82366/Originals/F11_5.PNG&quot; title=&quot;OPPO F11&quot; /&gt;&lt;/p&gt;

                                                    &lt;p&gt;&lt;img alt=&quot;Nhận th&#234;m phiếu mua h&#224;ng 500.000 đồng khi nhận OPPO F11 tại FPT Shop&quot; id=&quot;OPPO F11&quot; src=&quot;https://fptshop.com.vn/uploads/images/tin-tuc/82366/Originals/F11_9.PNG&quot; title=&quot;OPPO F11&quot; /&gt;&lt;/p&gt;

                                                    &lt;p&gt;&lt;strong&gt;Sản phẩm mua tại FPT Shop l&amp;agrave; h&amp;agrave;ng ch&amp;iacute;nh h&amp;atilde;ng,&amp;nbsp;&lt;strong&gt;bạn c&amp;oacute; thể chọn chọn mua trực tiếp tại&amp;nbsp;&lt;/strong&gt;&lt;a href=&quot;https://fptshop.com.vn/cua-hang&quot; target=&quot;_blank&quot; title=&quot;Huawei P30|P30 Pro&quot; type=&quot;Huawei P30|P30 Pro&quot;&gt;cửa hàng&lt;/a&gt;&lt;strong&gt;,&amp;nbsp;&lt;/strong&gt;mua online hoặc gọi hotline 1800 6601 để được tư vấn, mua h&amp;agrave;ng nhanh.&lt;/strong&gt;&lt;/p&gt;
                                        </textarea>
                                        <script>CKEDITOR.replace('NewContent');</script>
                                        <script>CKFinder.setupCKEditor(null, 'Content/ckfinder')</script>
                                    </div>
                                    <div class="form-group">
                                        <label for="NewStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="NewStatus" id="NewStatus" class="form-control" required="required">
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