<%-- 
    Document   : revenue
    Created on : Oct 2, 2020, 11:08:39 PM
    Author     : Acer Nitro 5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/navbar.jsp" flush="true"/>

<section class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Trang quản trị QTBtore</h2>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard.htm" class="breadcrumb-link">Trang quản trị</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/order.htm" class="breadcrumb-link">Đơn hàng</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Doanh thu</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ecommerce-widget">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
                        <div class="section-block">
                            <h3 class="section-title"><b>Thống kê doanh thu</b></h3>
                        </div>
                        <div class="tab-vertical">
                            <ul class="nav nav-tabs" id="myTab3" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link" id="revenue-week-tab" data-toggle="tab" href="#revenue-week" role="tab" aria-controls="revenue-week" aria-selected="false">Doanh thu theo tuần</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="revenue-month-tab" data-toggle="tab" href="#revenue-month" role="tab" aria-controls="revenue-month" aria-selected="false">Doanh thu theo tháng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="revenue-quarter-tab" data-toggle="tab" href="#revenue-quarter" role="tab" aria-controls="revenue-quarter" aria-selected="false">Doanh thu theo quý</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="revenue-year-tab" data-toggle="tab" href="#revenue-year" role="tab" aria-controls="revenue-year" aria-selected="false">Doanh thu theo năm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="revenue-custom-tab" data-toggle="tab" href="#revenue-custom" role="tab" aria-controls="revenue-custom" aria-selected="false">Doanh thu theo khoảng thời gian</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent3">
                                <div class="tab-pane fade" id="revenue-week" role="tabpanel" aria-labelledby="revenue-week-tab">
                                    <h3>Doanh thu theo tuần</h3>
                                    <div class="row" style="padding: 20px 5px; border: 1px solid #ccc; border-radius: 10px;">
                                        <div class="col-md-6">
                                            <h4><b>Thống kê doanh thu</b></h4>
                                            <table class="table table-bordered table-hover table-striped table-condensed">
                                                <tbody>
                                                    <tr>
                                                        <th><b>Số sản phẩm bán ra</b></th>
                                                        <td><c:if test="${not empty weekRevenue}"> ${weekRevenue.totalProductSale} (Sản phẩm)</c:if></td>
                                                        </tr>
                                                        <tr>
                                                            <th><b>Tổng doanh thu</b></th>
                                                            <td><c:if test="${not empty weekRevenue}"><fmt:formatNumber value="${weekRevenue.totalRevenue}" /> VNĐ</c:if></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-6">
                                                <h4><b>Thống kê sản phẩm</b></h4>
                                                <table class="table table-bordered table-hover table-striped table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng đã bán</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${not empty weekRevenue}">
                                                        <c:forEach items="${weekRevenue}" var="o">
                                                            <tr>
                                                                <td>${o.singleOrderDetails.productName}</td>
                                                                <td><fmt:formatNumber value="${o.singleOrderDetails.productPrice}" /> VNĐ</td>
                                                                <td>${o.singleOrderDetails.productSaleQuantity}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="revenue-month" role="tabpanel" aria-labelledby="revenue-month-tab">
                                    <h3>Doanh thu theo tháng</h3>
                                    <div class="row" style="padding: 20px 5px; border: 1px solid #ccc; border-radius: 10px;">
                                        <div class="col-md-6">
                                            <h4><b>Thống kê doanh thu</b></h4>
                                            <table class="table table-bordered table-hover table-striped table-condensed">
                                                <tbody>
                                                    <tr>
                                                        <th><b>Số sản phẩm bán ra</b></th>
                                                        <td><c:if test="${not empty monthRevenue}"> ${monthRevenue.totalProductSale} (Sản phẩm)</c:if></td>
                                                        </tr>
                                                        <tr>
                                                            <th><b>Tổng doanh thu</b></th>
                                                            <td><c:if test="${not empty monthRevenue}"><fmt:formatNumber value="${monthRevenue.totalRevenue}" /> VNĐ</c:if></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-6">
                                                <h4><b>Thống kê sản phẩm</b></h4>
                                                <table class="table table-bordered table-hover table-striped table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng đã bán</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${not empty monthRevenue}">
                                                        <c:forEach items="${monthRevenue}" var="o">
                                                            <tr>
                                                                <td>${o.singleOrderDetails.productName}</td>
                                                                <td><fmt:formatNumber value="${o.singleOrderDetails.productPrice}" /> VNĐ</td>
                                                                <td>${o.singleOrderDetails.productSaleQuantity}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="revenue-quarter" role="tabpanel" aria-labelledby="revenue-quarter-tab">
                                    <h3>Doanh thu theo quý</h3>
                                    <div class="row" style="padding: 20px 5px; border: 1px solid #ccc; border-radius: 10px;">
                                        <div class="col-md-6">
                                            <h4><b>Thống kê doanh thu</b></h4>
                                            <table class="table table-bordered table-hover table-striped table-condensed">
                                                <tbody>
                                                    <tr>
                                                        <th><b>Số sản phẩm bán ra</b></th>
                                                        <td><c:if test="${not empty quarterRevenue}"> ${quarterRevenue.totalProductSale} (Sản phẩm)</c:if></td>
                                                        </tr>
                                                        <tr>
                                                            <th><b>Tổng doanh thu</b></th>
                                                            <td><c:if test="${not empty quarterRevenue}"><fmt:formatNumber value="${quarterRevenue.totalRevenue}" /> VNĐ</c:if></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-6">
                                                <h4><b>Thống kê sản phẩm</b></h4>
                                                <table class="table table-bordered table-hover table-striped table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng đã bán</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${not empty quarterRevenue}">
                                                        <c:forEach items="${quarterRevenue}" var="o">
                                                            <tr>
                                                                <td>${o.singleOrderDetails.productName}</td>
                                                                <td><fmt:formatNumber value="${o.singleOrderDetails.productPrice}" /> VNĐ</td>
                                                                <td>${o.singleOrderDetails.productSaleQuantity}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="revenue-year" role="tabpanel" aria-labelledby="revenue-year-tab">
                                    <h3>Doanh thu theo năm</h3>
                                    <div class="row" style="padding: 20px 5px; border: 1px solid #ccc; border-radius: 10px;">
                                        <div class="col-md-6">
                                            <h4><b>Thống kê doanh thu</b></h4>
                                            <table class="table table-bordered table-hover table-striped table-condensed">
                                                <tbody>
                                                    <tr>
                                                        <th><b>Số sản phẩm bán ra</b></th>
                                                        <td><c:if test="${not empty yearRevenue}"> ${yearRevenue.totalProductSale} (Sản phẩm)</c:if></td>
                                                        </tr>
                                                        <tr>
                                                            <th><b>Tổng doanh thu</b></th>
                                                            <td><c:if test="${not empty yearRevenue}"><fmt:formatNumber value="${yearRevenue.totalRevenue}" /> VNĐ</c:if></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-6">
                                                <h4><b>Thống kê sản phẩm</b></h4>
                                                <table class="table table-bordered table-hover table-striped table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng đã bán</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${not empty yearRevenue}">
                                                        <c:forEach items="${yearRevenue}" var="o">
                                                            <tr>
                                                                <td>${o.singleOrderDetails.productName}</td>
                                                                <td><fmt:formatNumber value="${o.singleOrderDetails.productPrice}" /> VNĐ</td>
                                                                <td>${o.singleOrderDetails.productSaleQuantity}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="revenue-custom" role="tabpanel" aria-labelledby="revenue-custom-tab">
                                    <h2>Doanh thu theo khoảng thời gian</h2>
                                    <div class="clearfix"><br/></div>
                                    <form action="order-detail_submit" method="POST">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <label for="start-date"><h3>Từ ngày:</h3></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="date" name="start-date" id="start-date" class="form-control" value="" required="required" title="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <label for="start-date"><h3>Đến ngày:</h3></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input type="date" name="start-date" id="start-date" class="form-control" value="" required="required" title="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"><br/></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" id="check-date-revenue" class="btn btn-secondary">Kiểm tra doanh thu</button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="clearfix"><br/></div>
                                    <div class="row" style="padding: 20px 5px; border: 1px solid #ccc; border-radius: 10px;" id="append-content-html">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function() {
        $("#promotion-revenue").change(function (event) {
            event.preventDefault();

            window.location.href = "/ProjectSem4/admin/revenue/index.htm?promotionId=" + $("#promotion-revenue").val();
        });

        $("#check-date-revenue").click(function (event) {
            event.preventDefault();

            var startDate = $("#start-date").val();
            var endDate = $("#end-date").val();

            $.ajax({
                url: '/ProjectSem4/admin/revenue/custom.htm',
                data: {startDate: startDate, endDate: endDate}
            }).always(function (res) {
                $("#append-content-html").html(res);
            });
        });
    });
</script>

<jsp:include page="widget/footer.jsp" flush="true"/>
