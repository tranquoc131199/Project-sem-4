<%-- 
    Document   : banner-list
    Created on : Aug 23, 2020, 12:24:26 PM
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
                                    <li class="breadcrumb-item active" aria-current="page">Banner</li>
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
                                <a href="/Admin/BackendBanner/Create" class="btn btn-success"><i class="fas fa-plus"></i> Thêm mới banner</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Hình ảnh</th>
                                                <th>Mô tả</th>
                                                <th>Đường dẫn</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img class="img-fluid" style="max-height: 150px;" src="Uploads/images/Banner/Banner_003.jpg" alt="Demo tin tức thứ ba" />
                                                </td>
                                                <td>Demo tin tức thứ ba</td>
                                                <td><a href="/Admin/BackendNew/Detail?NewId=3">Demo tin tức thứ ba</a></td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=3" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem bài viết</a>
                                                    <a href="/Admin/BackendBanner/Edit?BannerId=6" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendBanner/Delete?BannerId=6" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img class="img-fluid" style="max-height: 150px;" src="Uploads/images/Banner/Banner_002.jpg" alt="Demo tin tức thứ hai" />
                                                </td>
                                                <td>Demo tin tức thứ hai</td>
                                                <td><a href="/Admin/BackendNew/Detail?NewId=2">Demo tin tức thứ hai</a></td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=2" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem bài viết</a>
                                                    <a href="/Admin/BackendBanner/Edit?BannerId=5" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendBanner/Delete?BannerId=5" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img class="img-fluid" style="max-height: 150px;" src="Uploads/images/Banner/Banner_001.jpg" alt="Demo tin tức thứ nhất" />
                                                </td>
                                                <td>Demo tin tức thứ nhất</td>
                                                <td><a href="/Admin/BackendNew/Detail?NewId=1">Demo tin tức thứ nhất</a></td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendNew/Detail?NewId=1" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem bài viết</a>
                                                    <a href="/Admin/BackendBanner/Edit?BannerId=4" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                    <a href="/Admin/BackendBanner/Delete?BannerId=4" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
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
