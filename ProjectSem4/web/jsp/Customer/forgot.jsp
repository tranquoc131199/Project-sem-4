<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li class="active">Quên mật khẩu</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Quên mật khẩu</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/customer/do-forgot.htm" method="POST" role="form">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="form-group">
                            <label for="customerEmail">Email:</label>
                            <input type="email" class="input" id="customerEmail" name="customerEmail" />
                        </div>
                        <button type="submit" class="primary-btn">Xác nhận</button>
                        <button type="reset" class="primary-btn">Làm lại</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<jsp:include page="widget/footer.jsp" flush="true"/>