<%-- 
    Document   : register
    Created on : Aug 17, 2020, 10:37:35 PM
    Author     : Acer Nitro 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li class="active">Đăng Ký</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đăng Ký</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form action="${pageContext.request.contextPath}/customer/do-register.htm" method="POST" role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerFullname">Họ và tên:</label>
                                <input type="text" class="input" id="customerFullName" name="customerFullName" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerBirthday">Ngày sinh:</label>
                                <input type="date" class="input" id="customerBirthday" name="customerBirthday" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerPassword">Mật khẩu:</label>
                                <input type="password" class="input" id="customerPassword" name="customerPassword" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="reCustomerPassword">Nhập lại mật khẩu:</label>
                                <input type="password" class="input" id="reCustomerPassword" name="reCustomerPassword" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerGender">Giới tính:</label>
                                <select name="customerGender" id="customerGender" class="input" required="required">
                                    <option value="">Vui lòng chọn</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerEmail">Email:</label>
                                <input type="email" class="input" id="customerEmail" name="customerEmail" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerPhone">Điện thoại:</label>
                                <input type="text" class="input" id="customerPhone" name="customerPhone" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customerAddress">Địa chỉ:</label>
                                <input type="text" class="input" id="customerAddress" name="customerAddress" />
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="primary-btn">Đăng ký</button>
                    <button type="reset" class="primary-btn">Làm lại</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>