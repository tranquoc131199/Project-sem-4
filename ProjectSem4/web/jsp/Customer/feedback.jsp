<%-- 
    Document   : check-out
    Created on : Aug 17, 2020, 10:36:16 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<div id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.html">Trang chủ</a></li>
            <li class="active">Liên hệ</li>
        </ul>
    </div>
</div>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Phản hồi cho chúng tôi</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-1 custom-dots"></div>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/send-feedback.htm">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="feedbackCatalogId">Bạn muốn phản hồi về vấn đề gì?</label>
                        <select name="feedbackCatalogId" id="feedbackCatalogId" class="form-control" required="required">
                            <c:if test="${not empty feedbackCatalogs}">
                                <option value="0">Lựa chọn danh mục phản hồi</option>
                                <c:forEach items="${feedbackCatalogs}" var="fc">
                                    <option value="${fc.feedbackCatalogId}">${fc.feedbackCatalogName}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="feedbackFullname">Họ tên:</label>
                        <input type="text" class="form-control" id="feedbackFullname" name="feedbackFullname" required="required">
                    </div>
                    <div class="form-group">
                        <label for="feedbackEmail">Email:</label>
                        <input type="email" class="form-control" id="feedbackEmail" name="feedbackEmail" required="required">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="feedbackPhone">Điện thoại:</label>
                        <input type="text" class="form-control" id="feedbackPhone" name="feedbackPhone" required="required">
                    </div>
                    <div class="form-group">
                        <label for="feedbackAddress">Địa chỉ:</label>
                        <input type="text" class="form-control" id="feedbackAddress" name="feedbackAddress" required="required">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="feedbackContent">Nội dung:</label>
                        <textarea name="feedbackContent" id="feedbackContent" class="form-control" rows="8" required="required"></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="primary-btn">Gửi đi</button>
            <button type="reset" class="second-btn">Làm lại</button>
        </form>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>