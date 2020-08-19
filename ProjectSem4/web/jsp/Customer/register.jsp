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
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Đăng ký</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Đăng ký tài khoản</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form action="/Customer/DoRegister" method="POST" role="form">
                    <input name="__RequestVerificationToken" type="hidden" value="PagKHthtRpxoA4kmyHqYz5FQevIODs8eqYVWdJWL5tzM8lVnL7vkWQ7TzQOVde1cji2L_Qi50O9RhLZ9rLcbG5G0KuQnfmHfSfi5AO8NT481" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerFullname">Họ và tên:</label>
                                <input type="text" class="input" id="CustomerFullname" name="CustomerFullname" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerBirthday">Ngày sinh:</label>
                                <input type="date" class="input" id="CustomerBirthday" name="CustomerBirthday" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerPassword">Mật khẩu:</label>
                                <input type="password" class="input" id="CustomerPassword" name="CustomerPassword" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ReCustomerPassword">Nhập lại mật khẩu:</label>
                                <input type="password" class="input" id="ReCustomerPassword" name="ReCustomerPassword" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerGender">Giới tính:</label>
                                <select name="CustomerGender" id="CustomerGender" class="input" required="required">
                                    <option value="">Vui lòng chọn</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerEmail">Email:</label>
                                <input type="email" class="input" id="CustomerEmail" name="CustomerEmail" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerPhone">Điện thoại:</label>
                                <input type="text" class="input" id="CustomerPhone" name="CustomerPhone" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CustomerAddress">Địa chỉ:</label>
                                <input type="text" class="input" id="CustomerAddress" name="CustomerAddress" />
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