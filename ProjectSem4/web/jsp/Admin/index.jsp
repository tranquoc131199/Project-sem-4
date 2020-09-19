<%-- 
    Document   : index
    Created on : Aug 20, 2020, 11:25:09 PM
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
                                            <li class="breadcrumb-item active" aria-current="page">Bảng điều khiển</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="ecommerce-widget">
                        <div class="row">
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><b>SẢN PHẨM</b></h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">55</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                            <span>Sản phẩm</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><b>ĐƠN HÀNG</b></h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">0</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                            <span>Đơn hàng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><b>PHẢN HỒI</b></h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">0</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-primary font-weight-bold">
                                            <span>Phản hồi</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><b>DOANH THU</b></h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">00</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-secondary font-weight-bold">
                                            <span>VNĐ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header"><b>ĐƠN HÀNG GẦN ĐÂY</b></h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">Mã đơn hàng</th>
                                                        <th class="border-0">Người đặt hàng</th>
                                                        <th class="border-0">Tổng tiền</th>
                                                        <th class="border-0">Email</th>
                                                        <th class="border-0">Điện thoại</th>
                                                        <th class="border-0">Địa chỉ</th>
                                                        <th class="border-0">Thời gian đặt hàng</th>
                                                        <th class="border-0">Trạng thái</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header"><b>SẢN PHẨM BÁN CHẠY</b></h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table no-wrap p-table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">Tên sản phẩm</th>
                                                        <th class="border-0">Lượt mua</th>
                                                        <th class="border-0">Giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=1">Laptop Asus ROG Strix Scar Edition GL503GE-EN021T</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=2">Intel Core i5 8400 / 9M / 2.8GHz / 6 nh&#226;n 6 luồng</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=4">GIGABYTE B360M AORUS PRO LGA1151</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=5">ASUS Z390 ROG MAXIMUS XI HERO LGA1151v2</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=6">Intel Core i7 8700 / 12M / 3.2GHz / 6 nh&#226;n 12 luồng</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=7">Samsung SSD 970 Evo 250G M.2 NVMe ( MZ-V7E250BW )</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=8">Samsung SSD 860 Evo 250GB 2.5&quot; Sata 3 550/520 MB/s ( MZ-76E250BW )</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=9">Intel Optane Memory 32GB - M.2 NVMe Read 1350MB/s Write 290MB/s</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=10">(8G DDR4 1x8G 2666 ) Corsair Vengeance LPX</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="/Admin/BackendProduct/Detail?ProductId=11">(16G DDR4 2x8G 3000 ) Corsair Dominator Platinum RGB</a></td>
                                                        <td>0</td>
                                                        <td>00</td>
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