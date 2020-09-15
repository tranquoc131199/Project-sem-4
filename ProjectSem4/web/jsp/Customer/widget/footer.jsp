<%-- 
    Document   : footer
    Created on : Aug 17, 2020, 12:13:11 AM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id="footer" class="section section-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="footer">
                    <div class="footer-logo">
                        <a class="logo" href="${pageContext.request.contextPath}/index.html">

                            <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/logo.png" class="img-responsive" alt="">

                        </a>
                    </div>

                    <div class="address-info">
                        <div class='display-flex'><div class='address-icon'><i class='fa fa-globe'></i></div><div><span class='address-title'>Địa chỉ:</span> Số 238 Hoàng Quốc Việt - Cầu Giấy - Hà Nội</div></div><div class='display-flex'><div class='address-icon'><i class='fa fa-phone'></i></div><div><span class='address-title'>Hotline:</span> <a href='tel:0849241190'>0849241190</a></div></div><div class='display-flex'><div class='address-icon'><i class='fa fa-envelope'></i></div><div><span class='address-title'>Email:</span> <a href='mailto:cskh@qtbstore.vn'>cskh@qtbstore.vn</a></div></div>
                    </div>

                    <div class="clearfix"><br></div>

                    <ul class="footer-social">
                        <li><a href='https://facebook.com' target='_blank'><i class='fa fa-facebook'></i></a></li><li><a href='https://twitter.com' target='_blank'><i class='fa fa-twitter'></i></a></li><li><a href='https://instagram.com' target='_blank'><i class='fa fa-instagram'></i></a></li><li><a href='https://plus.google.com' target='_blank'><i class='fa fa-google'></i></a></li><li><a href='https://pinterest.com' target='_blank'><i class='fa fa-pinterest'></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="footer">
                    <h3 class="footer-header">Dịch vụ khách hàng</h3>
                    <ul class="list-links">
                        <li><a href="/Home/About">Giới thiệu</a></li>
                        <li><a href="/Home/Transport">Vận chuyển</a></li>
                        <li><a href="/Home/Payment">Thanh toán</a></li>
                        <li><a href="/Home/FAQ">Câu hỏi thường gặp</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="footer">
                    <h3 class="footer-header">Đăng ký nhận email mới</h3>
                    <p>Để không bỏ lỡ bất kỳ sản phẩm hay chương trình khuyến mại mới nào từ chúng tôi!</p>
                    <form method="POST" action="/Home/EmailRegisted">
                        <input name="__RequestVerificationToken" type="hidden" value="dhTuRzhesMrKE6hgQrdMyP1CCcK3bzCYp2TU-BGeE4RAt1CRh0HiW324stXtIez5UF_agCiCWysQqyE29bSRrhKmMSe8Z9MqsXHUjnPk6Ew1" />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-8">
                                    <input class="input input-email" name="EmailAddress" placeholder="Nhập email của bạn">
                                </div>
                                <div class="col-sm-4">
                                    <button class="primary-btn" type="submit">Đăng ký</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center">
                <div class="footer-copyright">
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is customized <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/tranquoc1311" target="_blank">Template</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/jquery.flexisel.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/jquery.zoom.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/Customer/assets/js/main.js"></script>

<c:if test="${not empty error}">
    <script>
                        Swal.fire({
                            type: 'error',
                            title: 'Thất bại',
                            text: '${error}'
                        });
    </script>
</c:if>
<c:if test="${not empty success}">
    <script>
        Swal.fire({
            type: 'success',
            title: 'Thành công!',
            text: '${success}'
        });
    </script>
</c:if>
</body>
</html>
