<%-- 
    Document   : categories-list
    Created on : Aug 21, 2020, 1:45:51 AM
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
                                    <li class="breadcrumb-item active" aria-current="page">Danh mục sản phẩm</li>
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
                                <a href="/Admin/BackendCategory/Create" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Thêm mới danh mục sản phẩm</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên danh mục</th>
                                                <th>Danh mục cha</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Loa</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=29" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=29" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Game bản quyền</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=28" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=28" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>K&#237;nh thực tế ảo</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=27" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=27" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>M&#225;y chơi game console</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=26" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=26" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>B&#224;n di chuột</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=25" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=25" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tay cầm game</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=24" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=24" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tai nghe chơi game</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=23" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=23" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>B&#224;n gaming</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=22" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=22" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ghế chơi game</td>
                                                <td>Gaming Gear & Console</td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=21" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=21" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Chuột chơi game</td>
                                                <td>
                                                    Gaming Gear & Console                                                        </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendCategory/Edit?CategoryId=20" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendCategory/Disable?CategoryId=20" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <nav aria-label='Page navigation example'>
                                        <ul class='pagination'>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;&laquo;</a></li>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;</a></li>
                                            <li class='active page-item'><span class='page-link'>1</span></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=2'>2</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=3'>3</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=2'>&raquo;</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendCategory/Index/?page=3'>&raquo;&raquo;</a></li>
                                        </ul>
                                    </nav>
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