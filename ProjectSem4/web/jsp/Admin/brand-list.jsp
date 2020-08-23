<%-- 
    Document   : brands
    Created on : Aug 21, 2020, 1:38:51 AM
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
                                    <li class="breadcrumb-item active" aria-current="page">Hãng sản xuất</li>
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
                                <a href="/Admin/BackendBrand/Create" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Thêm mới hãng</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Tên hãng</th>
                                                <th>Logo</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>QTB</td>
                                                <td>
                                                    <img src="Uploads/images/1logoes02265726122018.png" class="img-fluid" style="max-height: 150px;" alt="QTC">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=23" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=23" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Dell</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/logodell.png" class="img-fluid" style="max-height: 150px;" alt="Dell">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=22" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=22" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Acer</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/acer.png" class="img-fluid" style="max-height: 150px;" alt="Acer">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=21" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=21" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Microsoft</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/Microsoft-logo_rgb_wht.png" class="img-fluid" style="max-height: 150px;" alt="Microsoft">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=20" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=20" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Sony</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/SONY-LOGO-1.jpg" class="img-fluid" style="max-height: 150px;" alt="Sony">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=19" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=19" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>DXRACER</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/5901e28b93587572b4b21ce9.png" class="img-fluid" style="max-height: 150px;" alt="DXRACER">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=18" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=18" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Sennheiser</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/SennheiserLogo-e1495637258494.png" class="img-fluid" style="max-height: 150px;" alt="Sennheiser">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=17" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=17" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Western Digital</td>
                                                <td>
                                                    <img src="Uploads/images/Brand-Logo/31_wdlogo.jpg" class="img-fluid" style="max-height: 150px;" alt="Western Digital">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=16" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=16" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>AMD</td>
                                                <td>
                                                    <img src="Uploads/images/ProductImages/AMD/1280px-AMD_Logo_svg.png" class="img-fluid" style="max-height: 150px;" alt="AMD">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=15" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=15" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Intel</td>
                                                <td>
                                                    <img src="Uploads/images/ProductImages/Intel/1024px-Intel-logo_svg.png" class="img-fluid" style="max-height: 150px;" alt="Intel">
                                                </td>
                                                <td>
                                                    <span class="badge badge-success">Kích hoạt</span>
                                                </td>
                                                <td>
                                                    <a href="/Admin/BackendBrand/Edit?BrandId=14" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Cập nhật</a>
                                                    <a href="/Admin/BackendBrand/Disable?BrandId=14" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Huỷ kích hoạt</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <nav aria-label='Page navigation example'>
                                        <ul class='pagination'>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;&laquo;</a></li>
                                            <li class='disabled page-item'><a class='page-link'>&laquo;</a></li>
                                            <li class='active page-item'><span class='page-link'>1</span></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendBrand/Index/?page=2'>2</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendBrand/Index/?page=3'>3</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendBrand/Index/?page=2'>&raquo;</a></li>
                                            <li class='page-item'><a class='page-link' href='/Admin/BackendBrand/Index/?page=3'>&raquo;&raquo;</a></li>
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