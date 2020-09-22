<%-- 
    Document   : confirm-forgot
    Created on : Sep 22, 2020, 1:48:01 AM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li class="active">Đặt lại mật khẩu</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đặt lại mật khẩu</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/customer/do-confirm-forgot.htm" method="POST" role="form">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="form-group">
                            <label for="customerPassword">Mật khẩu mới:</label>
                            <input type="password" class="input" id="customerPassword" name="customerPassword" />
                        </div>
                        <div class="form-group">
                            <label for="reCustomerPassword">Nhập lại mật khẩu mới:</label>
                            <input type="password" class="input" id="reCustomerPassword" name="reCustomerPassword" />
                        </div>
                        <button type="submit" class="primary-btn">Thay đổi</button>
                        <button type="reset" class="primary-btn">Làm lại</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>
