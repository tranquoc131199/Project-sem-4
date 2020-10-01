<%-- 
    Document   : brand-update
    Created on : Aug 22, 2020, 11:40:29 AM
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
                        <h2 class="pageheader-title">Trang quản trị QTCStore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Admin" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="/Admin/BackendBrand" class="breadcrumb-link">Hãng sản xuất</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa hãng sản xuất</li>
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
                            <h3 class="card-header"><b>Thông tin hãng</b></h3>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/admin/brand.htm" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i> Quay lại</a>
                                <div class="clearfix"><br></div>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/brand/brandUpdate.htm" role="form" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="brandName" class="col-form-label">Tên hãng:</label>
                                        <input name="brandName" id="brandName" maxlength="250" type="text" class="form-control" value="${brand.brandName}" />
                                        <input type="hidden" name="brandId" value="${brand.brandId}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="brandPiority" class="col-form-label">Độ ưu tiên:</label>
                                        <input name="brandPiority" id="brandPiority" readonly value="${brand.brandPiority}" type="number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="brandLogo" class="col-form-label">Logo:</label>
                                        <div class="clearfix"><br /></div>
                                        <img class="img-responsive" style="height: 100px" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/Brands/${brand.brandLogo}" />
                                        <div class="clearfix"><br /></div>
                                        <input type="file" readonly class="form-control" maxlength="250" name="brandLogo" id="brandLogo" value="${brand.brandLogo}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="brandStatus" class="col-form-label">Trạng thái:</label>
                                        <select name="brandStatus" id="brandStatus" class="form-control" required="required">
                                            <option value="1" <c:if test="${brand.brandStatus == 1}">selected</c:if>>Kích hoạt</option>
                                            <option value="0" <c:if test="${brand.brandStatus == 0}">selected</c:if>>Không kích hoạt</option>
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