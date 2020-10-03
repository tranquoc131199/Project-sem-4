<%-- 
    Document   : navbar
    Created on : Aug 20, 2020, 11:36:04 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<aside class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="${pageContext.request.contextPath}/admin/dashboard.htm">Bảng điều khiển</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav flex-column">
                    <li class="nav-divider">
                        Quản trị
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard.htm"><i class="fas fa-fw fa-tachometer-alt"></i> Bảng điều khiển </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-fw fa-puzzle-piece"></i> Nhóm sản phẩm </a>
                        <div id="submenu-2" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/brand.htm"><i class="fas fa-fw fa-building"></i> Hãng sản xuất</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/category.htm"><i class="fas fa-fw fa-list"></i> Danh mục sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/product.htm"><i class="fas fa-fw fa-lightbulb"></i> Sản phẩm</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fas fa-fw fa-users"></i> Nhóm khách hàng </a>
                        <div id="submenu-1" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/customer.htm"><i class="fas fa-fw fa-users"></i> Khách hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/feedback.htm"><i class="fas fa-fw fa-road"></i> Phản hồi</a>
                                </li>
                            </ul>
                        </div>
                    </li>                           
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-paw"></i> Nhóm tin tức </a>
                        <div id="submenu-3" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/new.htm"><i class="fas fa-fw fa-newspaper"></i> Tin tức</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/catalog.htm"><i class="fas fa-clipboard-list"></i> Danh mục tin tức</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-readme"></i> Nhóm đơn hàng </a>
                        <div id="submenu-4" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/order/index.htm"><i class="fas fa-fw fa-file-code"></i> Đơn hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/revenue.htm"><i class="fas fa-chart-bar"></i> Doanh thu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/transport.htm"><i class="fas fa-fw fa-truck"></i> Vận chuyển</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/payment.htm"><i class="fas fa-fw fa-credit-card"></i> Thanh toán</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-divider">
                        Tính năng
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-cog"></i> Cài đặt </a>
                        <div id="submenu-5" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/banner.htm"><i class="fas fa-fw fa-desktop"></i> Banner</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/logo.htm"><i class="fas fa-fw fa-image"></i> Logo</a>
                                </li>
                            </ul>
                        </div>
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-cogs"></i> Nâng cao </a>
                        <div id="submenu-6" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/index.htm"><i class="fab fa-fw fa-snapchat-ghost"></i> Quản trị viên</a>
                                </li>
                            </ul>
                        </div>
                        <div class="abc-bottom"><br /></div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</aside>