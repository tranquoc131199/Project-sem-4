<%-- 
    Document   : login
    Created on : Aug 20, 2020, 11:14:39 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đăng nhập quản trị viên</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/libs/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/jsp/Admin/assets/images/iconLogo.png" />
        <style>
            html,
            body {
                height: 100%;
            }

            body {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
            }
        </style>
    </head>
    <body>
        <div class="splash-container">
            <div class="card ">
                <div class="card-header text-center">
                    <a href="index.html">
                        <img src="${pageContext.request.contextPath}/jsp/Admin/assets/images/logo_1.png" class="img-fluid" alt="">
                    </a>
                </div>
                <div class="card-body">
                    <span class="splash-description">Điền thông tin đăng nhập</span>
                    <form method="POST" role="form" action="${pageContext.request.contextPath}/admin/do-login.htm">
                        <input name="__RequestVerificationToken" type="hidden" value="7BkypVQ17wADg5uPk3gep16l3afdGjuPb2gbo_J56eBUOFk-qZTyt09rayCBhgrVvcMsSl7TOMhONv1Aa941vRZOjSgmqkzvxjB0fhJguhA1" />
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="username" name="AdminEmail" type="email" placeholder="Email" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="password" name="AdminPassword" type="password" placeholder="**********">
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/jsp/Admin/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/Admin/assets/libs/css/sweetalert2.min.css">
        <script src="${pageContext.request.contextPath}/jsp/Admin/assets/libs/js/sweetalert2.min.js"></script>
    <c:if test="${not empty error}">
        <script>
            Swal.fire({
                type: 'error',
                title: '${error}'
            })
        </script>
    </c:if>
    <c:if test="${not empty success}">
        <script>
            Swal.fire({
                type: 'success',
                title: '${success}',
            })
        </script>
    </c:if>
</body>
</html>