<%-- 
    Document   : header
    Created on : Aug 20, 2020, 11:35:56 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/libs/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<!--    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/multi-select/css/multi-select.css">-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/jsp/Admin/uploads/images/iconLogo.png" />
    <title>Trang quản trị</title>
    <script src="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/Admin/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/Admin/ckfinder/ckfinder.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/libs/css/sweetalert2.min.css">
    <script src="${pageContext.request.contextPath}/jsp/Admin/assets/libs/js/sweetalert2.min.js"></script>
</head>
<body>
    <main class="dashboard-main-wrapper">
        <header class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="/Admin">
                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/logo.png" class="img-fluid" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <form method="POST" action="/Admin/BackendProduct/Search" id="search-form" enctype="multipart/form-data">
                                <input name="__RequestVerificationToken" type="hidden" value="ETYGG0-sbiwIbw4wg2IqkTbNnOCyikyFziVt5GkOHPToEli_9TexOPJqYWpgBkCvXHPzRmMREw5ZIX9baXsuEecmUSAA3KO2rKKYWHLKujo1" />
                                <div id="custom-search" class="top-search-bar">
                                    <input class="form-control" id="searchProduct" type="text" name="ProductName" placeholder="Tìm kiếm sản phẩm..">
                                </div>
                            </form>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/1adminavatar23295223122018.jpeg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">Trần Mạnh Quốc </h5>
                                    <span class="status"></span><span class="badge-dot badge-success mr-1"></span> Sẵn sàng
                                </div>
                                <a class="dropdown-item" href="/Admin/BackendAdmin/Info?AdminId=1"><i class="fas fa-user mr-2"></i>Trang cá nhân</a>
                                <a class="dropdown-item" href="/Admin/BackendAdmin/Logout"><i class="fas fa-power-off mr-2"></i>Đăng xuất</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>