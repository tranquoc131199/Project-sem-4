<%-- 
    Document   : product-update
    Created on : Aug 21, 2020, 12:43:44 AM
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

                    <form role="form" method="POST" action="/Admin/BackendProduct/EditProduct" enctype="multipart/form-data" class="wd-100">
                        <input name="__RequestVerificationToken" type="hidden" value="InqHhtFEhePhi8UfEsd3cSez5pt6lYSG21BeaFCjuZSgbfzN-4OuzRyUDxMmq6Q4cXwu0al88U0qZCNsToxj16_oqUNI-FMegfHByjgUcPg1" />
                        <div class="form-group">
                            <label for="ProductName" class="col-form-label">Tên sản phẩm:</label>
                            <input id="ProductName" maxlength="250" name="ProductName" type="text" class="form-control" value="PC HNC SPECIAL EDITION No1">
                            <input type="hidden" name="ProductId" value="56" />
                        </div>
                        <div class="form-group">
                            <label for="ProductCode" class="col-form-label">Mã hiệu sản phẩm:</label>
                            <input id="ProductCode" maxlength="20" name="ProductCode" type="text" class="form-control" value="No1">
                        </div>
                        <div class="form-group">
                            <label for="ProductSale" class="col-form-label">Mức giảm giá:</label>
                            <input id="ProductSale" name="ProductSale" type="text" class="form-control" value="0">
                        </div>
                        <div class="form-group">
                            <label for="CategoryId" class="col-form-label">Danh mục:</label>
                            <select name="CategoryId" id="CategoryId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="1" >Laptop &amp; phụ kiện</option>
                                <option value="2" >M&#225;y đồng bộ</option>
                                <option value="3" selected>M&#225;y chơi game</option>
                                <option value="4" >Linh kiện m&#225;y t&#237;nh</option>
                                <option value="5" >M&#225;y chủ &amp; M&#225;y trạm</option>
                                <option value="6" >Gaming Gear &amp; Console</option>
                                <option value="7" >Giải ph&#225;p tản nhiệt</option>
                                <option value="8" >CPU</option>
                                <option value="9" >Mainboard</option>
                                <option value="10" >RAM - Bộ nhớ trong</option>
                                <option value="11" >Ổ cứng HDD</option>
                                <option value="12" >Ổ cứng SSD</option>
                                <option value="13" >VGA - Card m&#224;n h&#236;nh</option>
                                <option value="14" >Monitor - M&#224;n h&#236;nh</option>
                                <option value="15" >Case - vỏ m&#225;y t&#237;nh</option>
                                <option value="16" >PSU - Nguồn</option>
                                <option value="17" >Sound Card</option>
                                <option value="18" >ODD - Ổ đĩa quang</option>
                                <option value="19" >B&#224;n ph&#237;m chơi game</option>
                                <option value="20" >Chuột chơi game</option>
                                <option value="21" >Ghế chơi game</option>
                                <option value="22" >B&#224;n gaming</option>
                                <option value="23" >Tai nghe chơi game</option>
                                <option value="24" >Tay cầm game</option>
                                <option value="25" >B&#224;n di chuột</option>
                                <option value="26" >M&#225;y chơi game console</option>
                                <option value="27" >K&#237;nh thực tế ảo</option>
                                <option value="28" >Game bản quyền</option>
                                <option value="29" >Loa</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="BrandId" class="col-form-label">Hãng sản xuất:</label>
                            <select name="BrandId" id="BrandId" class="form-control" required>
                                <option value="">Vui lòng chọn</option>
                                <option value="2" >Asus</option>
                                <option value="4" >MSI</option>
                                <option value="5" >Samsung</option>
                                <option value="6" >Gigabyte</option>
                                <option value="7" >Inno3D</option>
                                <option value="8" >Thermaltake</option>
                                <option value="9" >Xigmatek</option>
                                <option value="10" >NZXT</option>
                                <option value="11" >Razer</option>
                                <option value="12" >Corsair</option>
                                <option value="14" >Intel</option>
                                <option value="15" >AMD</option>
                                <option value="16" >Western Digital</option>
                                <option value="17" >Sennheiser</option>
                                <option value="18" >DXRACER</option>
                                <option value="19" >Sony</option>
                                <option value="20" >Microsoft</option>
                                <option value="21" >Acer</option>
                                <option value="22" >Dell</option>
                                <option value="23" selected>QTC</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ProductFeatureImage" class="col-form-label">Ảnh đại diện của sản phẩm:</label>
                            <div class="clearfix"></div>
                            <img src="Uploads/images/ProductImages/QTC/No1/No11.jpg" class="img-fluid" style="max-width: 250px;" alt="Alternate Text" />
                            <div class="clearfix"><br /></div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-primary" type="button" id="btn-upload">Chọn ảnh</button>
                                </div>
                                <input type="text" readonly class="form-control" maxlength="250" name="ProductFeatureImage" id="image-url" aria-label="" aria-describedby="basic-addon1" value="Uploads/images/ProductImages/QTC/No1/No11.jpg">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ProductPrice" class="col-form-label">Giá:</label>
                            <input id="ProductPrice" name="ProductPrice" type="number" min="1000" value="178049000" step="1000" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="ProductSpecification" class="col-form-label">Thông số kỹ thuật của sản phẩm:</label>
                            <textarea name="ProductSpecification" id="ProductSpecification" class="form-control" rows="3">&lt;h2&gt;TH&amp;Ocirc;NG SỐ KỸ THUẬT&lt;/h2&gt;

                                        &lt;table style=&quot;width:641px&quot;&gt;
                                        &lt;tbody&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;T&amp;ecirc;n gọi&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;PC HNC SPECIAL EDITION No1 I9 7900X/32G/GTX 1080Ti SLI&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;CPU&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;CPU Intel Core i9 - 7900X 3.3 GHz Turbo 4.3 Up to 4.5 GHz / 13.75 MB / 10 Cores, 20 Threads / socket 2066.&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;Bo mạch chủ&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Gigabyte X299 DESIGNARE - EX&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;RAM&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Gskill 16GB (2x8GB) DDR4 Bus 3000Mhz - F4-3000C16D-16GTZR (x2)&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;SSD&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;PCIe Samsung 970 EVO 500GB PCIe NVMe 3.0x4&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;HDD&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Seagate Barracuda Pro 4TB/7200 Sata 128MB 3.5&amp;quot;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;Card đồ họa&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Gigabyte N108TAORUS-11GD&amp;nbsp;(x2)&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;Nguồn&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Seasonic 1000W Prime 1000GD 80 Plus Gold.&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;Case&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Cooler Master COSMOS C700P&amp;nbsp;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;&lt;strong&gt;Tản nhiệt&lt;/strong&gt;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;td&gt;
                                        &lt;p&gt;Combo EKWB Water Cooling&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;/tbody&gt;
                                        &lt;/table&gt;
                            </textarea>
                            <script>CKEDITOR.replace('ProductSpecification');</script>
                        </div>
                        <div class="form-group">
                            <label for="ProductDescription" class="col-form-label">Mô tả sản phẩm:</label>
                            <textarea name="ProductDescription" id="ProductDescription" class="form-control" rows="3">&lt;h2&gt;ĐẶC ĐIỂM NỔI BẬT&lt;/h2&gt;

                                        &lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;https://i.imgur.com/YPpWh7V.jpg&quot; style=&quot;height:300px; width:1000px&quot; /&gt;&lt;/p&gt;

                                        &lt;table border=&quot;0&quot; cellspacing=&quot;0&quot;&gt;
                                        &lt;tbody&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;https://i.imgur.com/hixoeBu.jpg&quot; style=&quot;height:200px; width:400px&quot; /&gt;&lt;/td&gt;
                                        &lt;td style=&quot;vertical-align:middle&quot;&gt;
                                        &lt;p&gt;&lt;strong&gt;Thỏa m&amp;atilde;n cơn kh&amp;aacute;t hiệu năng&lt;/strong&gt;&lt;br /&gt;
                                        &lt;br /&gt;
                                        Sẵn s&amp;agrave;ng chạy tất cả những g&amp;igrave; bạn y&amp;ecirc;u cầu ở mức thiết lập cao nhất kể cả tr&amp;ecirc;n những m&amp;agrave;n h&amp;igrave;nh c&amp;oacute; độ ph&amp;acirc;n giải 4K, c&amp;aacute;c bộ m&amp;aacute;y nằm trong series Special Edition ch&amp;iacute;nh l&amp;agrave; lựa chọn ho&amp;agrave;n hảo nếu bạn đang c&amp;oacute; &amp;yacute; định trở th&amp;agrave;nh một game thủ ki&amp;ecirc;m streamer chuy&amp;ecirc;n nghiệp.&amp;nbsp;&lt;/p&gt;

                                        &lt;p&gt;&amp;nbsp;&lt;/p&gt;
                                        &lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td style=&quot;vertical-align:middle&quot;&gt;&lt;strong&gt;Tản nhiệt nước t&amp;ugrave;y biến mạnh mẽ nhất&amp;nbsp;&lt;/strong&gt;&lt;br /&gt;
                                        &lt;br /&gt;
                                        Trong thế giới Water Cooling, EKWB l&amp;agrave; t&amp;ecirc;n tuổi đứng top đầu bởi chất lượng ho&amp;agrave;n thiện, độ bền, sự linh hoạt v&amp;agrave; dải sản phẩm phong ph&amp;uacute; kh&amp;ocirc;ng thể b&amp;agrave;n c&amp;atilde;i. Khi quyết định mua PC HNC phi&amp;ecirc;n bản đặc biệt, bạn sẽ được to&amp;agrave;n quyền t&amp;ugrave;y biến bộ m&amp;aacute;y của m&amp;igrave;nh. H&amp;atilde;y sẵn s&amp;agrave;ng ngắm nh&amp;igrave;n tuyệt t&amp;aacute;c d&amp;agrave;nh cho ri&amp;ecirc;ng bạn dần dần hiện hữu dưới b&amp;agrave;n tay ma thuật của những kỹ thuật vi&amp;ecirc;n l&amp;agrave;nh nghề nhất.&lt;/td&gt;
                                        &lt;td&gt;&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;https://i.imgur.com/JDlhoHn.jpg&quot; style=&quot;height:168px; width:424px&quot; /&gt;&lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td&gt;&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;https://i.imgur.com/j09qHIA.jpg&quot; style=&quot;height:164px; width:352px&quot; /&gt;&lt;/td&gt;
                                        &lt;td style=&quot;vertical-align:middle&quot;&gt;&lt;strong&gt;D&amp;agrave;nh cho những kẻ chinh phục&lt;/strong&gt;&lt;br /&gt;
                                        &lt;br /&gt;
                                        Chẳng c&amp;oacute; g&amp;igrave; sai khi muốn vượt l&amp;ecirc;n tr&amp;ecirc;n tất cả, những cỗ m&amp;aacute;y cao cấp nhất của HANOICOMPUTER ch&amp;iacute;nh l&amp;agrave; trợ thủ đắc lực để bạn tự tin khẳng định vị thế của m&amp;igrave;nh cả trong game lẫn ngo&amp;agrave;i đời.&lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;tr&gt;
                                        &lt;td style=&quot;vertical-align:middle&quot;&gt;&lt;strong&gt;Gi&amp;aacute; trị tinh thần kh&amp;ocirc;ng thể đong đếm&lt;/strong&gt;&lt;br /&gt;
                                        &lt;br /&gt;
                                        Như những chiếc si&amp;ecirc;u xe, d&amp;ugrave; cho nhiều năm tr&amp;ocirc;i qua hay thời thế đổi thay, những chiến m&amp;atilde; m&amp;agrave; bạn đang thấy vẫn sẽ l&amp;agrave; biểu tượng cho một thời v&amp;agrave;ng son của l&amp;agrave;ng c&amp;ocirc;ng nghệ thế giới. Kh&amp;ocirc;ng ai c&amp;oacute; thể phủ nhận hay l&amp;agrave;m giảm gi&amp;aacute; trị về mặt tinh thần của ch&amp;uacute;ng.&lt;/td&gt;
                                        &lt;td&gt;&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;https://i.imgur.com/hOlQr5F.jpg&quot; style=&quot;height:243px; width:388px&quot; /&gt;&lt;/td&gt;
                                        &lt;/tr&gt;
                                        &lt;/tbody&gt;
                                        &lt;/table&gt;
                            </textarea>
                            <script>CKEDITOR.replace('ProductDescription');</script>
                        </div>
                        <div class="form-group">
                            <label for="ProductStatus" class="col-form-label">Trạng thái:</label>
                            <select name="ProductStatus" id="ProductStatus" class="form-control">
                                <option value="1" selected>Kích hoạt</option>
                                <option value="0" >Không kích hoạt</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ProductImage" class="col-form-label">Hình ảnh sản phẩm:</label>
                            <div class="row">

                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-primary" type="button" id="btn-uploads">Chọn ảnh</button>
                                </div>
                                <input type="text" readonly class="form-control" name="ProductImage" id="images-url" aria-label="" aria-describedby="basic-addon1">
                            </div>
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
</section>

<jsp:include page="widget/footer.jsp" flush="true" />