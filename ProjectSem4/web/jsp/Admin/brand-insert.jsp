<%-- 
    Document   : brand-insert
    Created on : Aug 21, 2020, 1:41:45 AM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
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
                                    <li class="breadcrumb-item"><a href="/Admin/BackendBrand" class="breadcrumb-link">Hãng sản xuất</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thêm mới hãng sản xuất</li>
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
                            <h3 class="card-header"><b>Thêm mới hãng</b></h3>
                            <div class="card-body">
                                <a href="/Admin/BackendBrand" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                    <form:form commandName="brand" action="insertbrand.htm" method="POST">
                                    <input name="__RequestVerificationToken" type="hidden" value="c0bNorB0_B5SihavLsj_l_yNgAw5TzLlZ-f9aa9GoGKn9kLQOECZ36_je31um1FequPK2thbUmbVoagpMFmmj_WK-xKGFpQvoF8I38bA7dE1" />
                                    <div class="form-group">
                                        <label for="BrandName" class="col-form-label">Tên hãng:</label>
                                        <form:input path="brandName" type="text" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="BrandLogo" class="col-form-label">Logo:</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <form:input path="brandLogo" type="file" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="BrandStatus" class="col-form-label">Trạng thái:</label>
                                        <form:select path="brandStatus" class="form-control" required="required">
                                            <form:option value="1" label="Kích hoạt"/>
                                            <form:option value="0" label="Không kích hoạt"/>
                                        </form:select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-check"></i> Xác nhận</button>
                                        <button type="reset" class="btn btn-sm btn-danger"><i class="fas fa-retweet"></i> Làm lại</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true" />
