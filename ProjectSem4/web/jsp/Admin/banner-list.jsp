<%-- 
    Document   : banner-list
    Created on : Aug 23, 2020, 12:24:26 PM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                <a href="${pageContext.request.contextPath}/jsp/Admin/banner-insert.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Thêm mới banner</a>
                                <div class="clearfix"><br></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>Hình ảnh</th>
                                                <th>Mô tả</th>
                                                <!--<th>Đường dẫn</th>-->
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${banners}" var="banner">
                                                <tr>
                                                    <td>
                                                        <img class="img-fluid" style="max-height: 150px;" src="Uploads/images/Banner/${banner.bannerImage}" alt="Demo tin tức thứ ba" />
                                                    </td>
                                                    <td>${banner.bannerDescription}</td>
                                                    <!--<td><a href="/Admin/BackendNew/Detail?NewId=${banner.bannerId}">/Admin/BackendNew/Detail?NewId=${banner.bannerId}</a></td>-->
                                                    <td>
                                                        <c:if test="${banner.bannerStatus==1}">
                                                        <span class="badge badge-success">Kích hoạt</span>
                                                        </c:if>
                                                        <c:if test="${banner.bannerStatus==0}">
                                                        <span class="badge badge-danger">Không kích hoạt</span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a href="/Admin/BackendNew/Detail?NewId=${banner.bannerId}" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> Xem bài viết</a>
                                                        <a href="/Admin/BackendBanner/Edit?BannerId=${banner.bannerId}" class="btn btn-sm btn-warning"><i class="fas fa-check"></i> Sửa</a>
                                                        <a href="/Admin/BackendBanner/Delete?BannerId=${banner.bannerId}" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xoá</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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
