<%-- 
    Document   : header
    Created on : Aug 17, 2020, 12:12:58 AM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Trang chủ</title>
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+SC:100,300,400,500,700&amp;subset=vietnamese" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/slick-theme.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/nouislider.min.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/font-awesome.min.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Customer/assets/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/libs/css/sweetalert2.min.css">
        <script src="${pageContext.request.contextPath}/jsp/Admin/assets/libs/js/sweetalert2.min.js"></script>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/jsp/Admin/uploads/images/iconLogo.png" />
    </head>
    <body>
        <header>
            <div id="top-header">
                <div class="container">
                    <div class="pull-left">
                        <span>Chào mừng đến với QTB Store</span>
                    </div>
                    <div class="pull-right">
                        <ul class="header-top-links">
                            <li><a href="/Product/Build">Xây dựng cấu hình</a></li>
                            <li><a href="/Home/Faq">Câu hỏi thường gặp</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="header">
                <div class="container">
                    <div class="pull-left dp-flex">
                        <div class="header-logo">
                            <a class="logo" href="${pageContext.request.contextPath}/index.htm">
                                <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/logo.png" class="img-responsive" alt="">
                            </a>
                        </div>
                        <div class="header-search">
                            <form action="/Product/Search" method="post">
                                <input name="__RequestVerificationToken" type="hidden" value="YBVt7S5iWcxNIllVarDBR67tPoYzOFpd8aQIuBnpfCCPslBtIAFt3xAD7gUnlv3CT0S6Qz7JgGcMLC6bxOmTrETje_PM1R2-QCA8d1dGrlk1" />
                                <input class="input search-input" name="ProductName" type="text" placeholder="Nhập từ khoá cần tìm...">
                                <button class="search-btn"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="pull-right">
                        <ul class="header-btns">
                            <li class="header-account dropdown default-dropdown">
                                <c:if test="${empty customer}">
                                    <div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
                                        <div class="header-btns-icon">
                                            <i class="fa fa-user-o"></i>
                                        </div>
                                        <strong class="text-uppercase">Tài khoản <i class="fa fa-caret-down"></i></strong>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/customer/login.htm" class="text-uppercase small-font">Đăng nhập</a> / <a href="${pageContext.request.contextPath}/customer/register.html" class="text-uppercase small-font">Đăng ký</a>
                                </c:if>
                                <c:if test="${not empty customer}">
                                    <div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
                                        <div class="header-btns-icon">
                                            <img src="${pageContext.request.contextPath}/views/backend/uploads/images/Customers/${customer.customerAvatar}" class="img-responsive" style="width: 40px; height: 40px;" />
                                        </div>
                                        <span class="text-uppercase text-center small-font">${customer.customerFullName}</span> <i class="fa fa-caret-down"></i>
                                    </div>
                                    <ul class="custom-menu">
                                        <li><a href="${pageContext.request.contextPath}/customer/index.htm"><i class="fa fa-user-o"></i> Cá nhân</a></li>
                                        <li><a href="${pageContext.request.contextPath}/customer/wishlist.htm"><i class="fa fa-heart-o"></i> Yêu thích</a></li>
                                        <li><a href="${pageContext.request.contextPath}/customer/order.htm"><i class="fa fa-gift"></i> Đơn hàng</a></li>
                                        <li><a href="${pageContext.request.contextPath}/customer/logout.htm"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
                                    </ul>
                                </c:if>
                            </li>                            
                            <li class="header-cart dropdown default-dropdown" id="shopping-cart-ajax">



                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <div class="header-btns-icon">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="qty">0</span>
                                    </div>
                                    <strong class="text-uppercase">Giỏ hàng:</strong>
                                    <br>
                                    <span class="small-font">00</span>
                                </a>
                                <div class="custom-menu">
                                    <div id="shopping-cart">
                                        <div class="shopping-cart-list">
                                        </div>
                                        <div class="shopping-cart-btns">
                                            <button class="main-btn medium-font" id="show-cart">Xem giỏ hàng</button>
                                            <button class="primary-btn medium-font" id="pay-cart">Thanh toán <i class="fa fa-arrow-circle-right"></i></button>
                                        </div>
                                    </div>
                                </div>

                                <script>
                                    $(document).ready(function () {
                                        $("#show-cart").click(function (event) {
                                            event.preventDefault();
                                            window.location.href = '/Order/Index/';
                                        });

                                        $("#pay-cart").click(function (event) {
                                            event.preventDefault();
                                            window.location.href = '/Order/CheckOut/';
                                        });
                                    });
                                </script>
                            </li>
                            <li class="nav-toggle">
                                <button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>