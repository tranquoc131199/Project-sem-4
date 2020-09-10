<%-- 
    Document   : login
    Created on : Aug 17, 2020, 10:36:50 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Đăng nhập</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đăng nhập</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/customer/do-login.htm" method="POST" role="form">
                <input name="__RequestVerificationToken" type="hidden" value="BIQujFUnm56q4XlMnMGrzZQwdZ5Ko2ncMxBAflx8OP3NCAeYvNusoyOnS_0xCaj726oJ8uCAA_nG7D0DVRxWOQpgsiPj2QohADR2KVnFecc1" />
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="form-group">
                            <label for="customerEmail">Email:</label>
                            <input type="email" class="input" id="customerEmail" name="customerEmail" />
                        </div>
                        <div class="form-group">
                            <label for="customerPassword">Mật khẩu:</label>
                            <input type="password" class="input" id="customerPassword" name="customerPassword" />
                        </div>
                        <button type="submit" class="primary-btn">Đăng nhập</button>
                        <button type="reset" class="primary-btn">Làm lại</button>
                        <br />
                        <a href="${pageContext.request.contextPath}/customer/forgot.htm"><u>Quên mật khẩu?</u></a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>