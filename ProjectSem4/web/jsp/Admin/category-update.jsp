<%-- 
    Document   : category-update
    Created on : Aug 21, 2020, 1:46:40 AM
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendCategory" class="breadcrumb-link">Danh mục sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa danh mục sản phẩm</li>
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
                            <h3 class="card-header"><b>Thông tin danh mục sản phẩm</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendCategory" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="/Admin/BackendCategory/EditCategory">
                                    <input name="__RequestVerificationToken" type="hidden" value="Kdgwr8NKyVccAGmd96nNeLoHbakaQSFd9mCuVljsxGd47X6NfrfNcUSNdOtGzKzIfYgUR6a4cGvmiBGkci08NolKrlRoPi2awEnyY6KjFrc1" />
                                    <div class="form-group">
                                        <label for="CategoryName" class="col-form-label">Tên danh mục sản phẩm</label>
                                        <input id="CategoryName" name="CategoryName" maxlength="250" type="text" class="form-control" value="Loa">
                                        <input name="CategoryId" type="hidden" value="29">
                                    </div>
                                    <div class="form-group">
                                        <label for="ParentId" class="col-form-label">Danh mục cha:</label>
                                        <select name="ParentId" id="ParentId" class="form-control">
                                            <option value="0">Không có danh mục cha</option>
                                            <option value="1" > Laptop &amp; phụ kiện</option>
                                            <option value="2" > M&#225;y đồng bộ</option>
                                            <option value="3" > M&#225;y chơi game</option>
                                            <option value="4" > Linh kiện m&#225;y t&#237;nh</option>
                                            <option value="5" > M&#225;y chủ &amp; M&#225;y trạm</option>
                                            <option value="6" selected> Gaming Gear &amp; Console</option>
                                            <option value="7" > Giải ph&#225;p tản nhiệt</option>
                                            <option value="8" > CPU</option>
                                            <option value="9" > Mainboard</option>
                                            <option value="10" > RAM - Bộ nhớ trong</option>
                                            <option value="11" > Ổ cứng HDD</option>
                                            <option value="12" > Ổ cứng SSD</option>
                                            <option value="13" > VGA - Card m&#224;n h&#236;nh</option>
                                            <option value="14" > Monitor - M&#224;n h&#236;nh</option>
                                            <option value="15" > Case - vỏ m&#225;y t&#237;nh</option>
                                            <option value="16" > PSU - Nguồn</option>
                                            <option value="17" > Sound Card</option>
                                            <option value="18" > ODD - Ổ đĩa quang</option>
                                            <option value="19" > B&#224;n ph&#237;m chơi game</option>
                                            <option value="20" > Chuột chơi game</option>
                                            <option value="21" > Ghế chơi game</option>
                                            <option value="22" > B&#224;n gaming</option>
                                            <option value="23" > Tai nghe chơi game</option>
                                            <option value="24" > Tay cầm game</option>
                                            <option value="25" > B&#224;n di chuột</option>
                                            <option value="26" > M&#225;y chơi game console</option>
                                            <option value="27" > K&#237;nh thực tế ảo</option>
                                            <option value="28" > Game bản quyền</option>
                                            <option value="29" > Loa</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="CategoryStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="CategoryStatus" id="CategoryStatus" class="form-control">
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
