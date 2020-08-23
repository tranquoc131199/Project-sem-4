<%-- 
    Document   : new-list
    Created on : Aug 23, 2020, 12:11:53 PM
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
                                    <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
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
                            <h3 class="card-header"><b>Danh sách</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendNew/Create" class="btn btn-sm btn-success"><i class="fas fa-plus"></i> Thêm mới tin</a>
                                <a href="/Admin/BackendNew/Catalog" class="btn btn-sm btn-primary"><i class="fas fa-clipboard-list"></i> Danh mục tin</a>
                                <a href="/Admin/BackendNew/CreateCatalog" class="btn btn-sm btn-secondary"><i class="fas fa-plus-circle"></i> Thêm mới danh mục</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tiêu đề</th>
                                                <th>Hình ảnh</th>
                                                <th>Mô tả ngắn</th>
                                                <th>Ngày đăng</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Duy nhất chỉ c&#243; tại QTC</td>
                                                <td>
                                                    <img src="Uploads/images/News/khuyenmai.png" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Sản phẩm mua tại QTC l&#224; h&#224;ng ch&#237;nh h&#227;ng, bạn c&#243; thể chọn chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 097543355 để được tư vấn, mua h&#224;ng nhanh.
                                                </td>
                                                <td>4/19/2019 2:48:31 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=27" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=27" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=27" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>LAPTOP Khuyến mại</td>
                                                <td>
                                                    <img src="Uploads/images/News/macbook.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Khuyến mại duy nhất th&#225;ng 4
                                                </td>
                                                <td>4/19/2019 2:45:21 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=26" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=26" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=26" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Laptop Dell</td>
                                                <td>
                                                    <img src="Uploads/images/News/lapdell.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    M&#225;y t&#237;nh Dell c&#243; những điểm kh&#225;c biệt khi đứng giữa h&#224;ng ng&#224;n mẫu m&#225;y t&#237;nh từ nhiều thương hiệu
                                                </td>
                                                <td>4/19/2019 2:41:34 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=25" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=25" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=25" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Giới thiệu hệ thống cửa h&#224;ng QTC</td>
                                                <td>
                                                    <img src="Uploads/images/News/hinh15(1).jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Hệ thống cửa h&#224;ng h&#224;ng đầu Việt Nam 
                                                </td>
                                                <td>4/19/2019 2:38:41 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=24" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=24" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=24" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tin tức về chủ đề &quot;giải đ&#225;p thắc mắc&quot;</td>
                                                <td>
                                                    <img src="Uploads/images/News/11060881_888443704534720_2036613721015644854_n.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    tại sao m&#225;y t&#237;nh kết nối mạng d&#226;y c&#243; dấu chấm than ạ?
                                                </td>
                                                <td>4/19/2019 2:27:51 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=23" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=23" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=23" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>B&#225;o c&#225;o doanh số h&#224;ng th&#225;ng</td>
                                                <td>
                                                    <img src="Uploads/images/News/hinh1.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Người d&#249;ng doanh nghiệp nhỏ c&#243; thể theo d&#245;i doanh số cũng như dự b&#225;o h&#224;ng th&#225;ng, h&#224;ng qu&#253; v&#224; h&#224;ng năm bằng c&#225;ch d&#249;ng mẫu th&#244;ng minh n&#224;y
                                                </td>
                                                <td>4/19/2019 2:21:26 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=22" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=22" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=22" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>QTCStore khai trương chi nh&#225;nh thứ 5 tại quận H&#224; Đ&#244;ng</td>
                                                <td>
                                                    <img src="Uploads/images/News/3010_45062831_2812350678835708_2901796745467920384_o.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    QTCStore khai trương chi nh&#225;nh thứ 5 tại quận H&#224; Đ&#244;ng
                                                </td>
                                                <td>4/19/2019 1:44:05 PM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=21" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=21" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=21" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ch&#237;nh s&#225;ch giao h&#224;ng</td>
                                                <td>
                                                    <img src="Uploads/images/News/hinh12.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Giao h&#224;ng miễn ph&#237;
                                                </td>
                                                <td>4/19/2019 10:34:31 AM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=20" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=20" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=20" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ch&#237;nh s&#225;ch d&#249;ng thử sản phẩm:</td>
                                                <td>
                                                    <img src="Uploads/images/News/hinh11.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    Trong v&#242;ng Ba (03) ng&#224;y đầu ti&#234;n được đổi trả miễn ph&#237;
                                                </td>
                                                <td>4/19/2019 10:31:57 AM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=19" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=19" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=19" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hướng dẫn kh&#225;ch h&#224;ng</td>
                                                <td>
                                                    <img src="Uploads/images/News/hinh9.jpg" alt="hình ảnh bài viết" class="img-fluid" style="max-width: 150px;" />
                                                </td>
                                                <td>
                                                    C&#193;C BƯỚC MUA H&#192;NG V&#192; THANH TO&#193;N ONLINE
                                                </td>
                                                <td>4/19/2019 10:25:24 AM</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=17" class="btn btn-sm btn-info"><i class="fas fa-eye"></i> Xem</a>
                                                    <a href="/Admin/BackendNew/Edit?NewId=17" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendNew/Delete?NewId=17" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                        </tbody>
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
