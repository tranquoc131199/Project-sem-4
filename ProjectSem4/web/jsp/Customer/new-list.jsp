<%-- 
    Document   : new-list
    Created on : Aug 17, 2020, 10:37:12 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>


<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <c:if test="${not empty catalog}">
                <li class="active"><a href="${pageContext.request.contextPath}/new/index.htm">Tin tức</a></li>
                <li class="active">${catalog.catalogName}</li>
            </c:if>
            <c:if test="${empty catalog}">
                <li class="active">Tin tức</li>
            </c:if>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Tin tức</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="about">
        <div class="container">
            <div class="about-main">
                <div class="col-md-8 about-left">
                    <div class="about-three">
                        <div class="a-1">
                            <c:if test="${not empty news}">
                                <c:forEach items="${news}" var="n">
                                    <div class="col-md-6 abt-left">
                                        <a href="${pageContext.request.contextPath}/new/detail.htm?newId=${n.newId}">
                                            <img style="height: 150px;" src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${n.newImage}" alt="${n.newTitle}" class="img-responsive" />
                                        </a>
                                        <h3><a href="${pageContext.request.contextPath}/new/detail.htm?newId=${n.newId}">${n.newTitle}</a></h3>
                                        <p style="height: 100px;">${n.newDescription}</p>
                                        <a href="${pageContext.request.contextPath}/new/detail.htm?newId=${n.newId}" class="primary-btn">Xem chi tiết</a>
                                        <label class="lb-right"><fmt:formatDate value="${n.createdDate}" /></label>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="clearfix"><br /></div>
                    <div class="clearfix"><hr /></div>
                    <div class="about-four">
                        <div class="pull-right">
                            <div class="page-filter">
                                <span class="text-uppercase">Hiển thị trên mỗi trang:</span>
                                <select class="input" id="new-page-size">
                                    <option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10</option>
                                    <option value="20" <c:if test="${pageSize == 20}">selected</c:if>>20</option>
                                    <option value="50" <c:if test="${pageSize == 50}">selected</c:if>>50</option>
                                </select>
                            </div>
                            <c:if test="${not empty paging}">
                                ${paging}
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 about-right heading">
                    <div class="abt-2">
                        <h3>DANH MỤC TIN TỨC</h3>
                        <c:if test="${not empty catalogs}">
                            <c:forEach items="${catalogs}" var="c">
                                <div class="might-grid">
                                    <div><h4><a href="${pageContext.request.contextPath}/new/index.htm?catalogId=${c.catalogId}">${c.catalogName}</a></h4></div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $("#new-page-size").change(function (event) {
            event.preventDefault();
            var pageSize = $(this).val();
    <c:if test="${empty catalogId}">
            window.location.href = '${pageContext.request.contextPath}/new/index.htm?pageSize=' + pageSize;
    </c:if>
    <c:if test="${not empty catalogId}">
            window.location.href = '${pageContext.request.contextPath}/new/index.htm?catalogId=' + ${catalogId} + '&pageSize=' + pageSize;
    </c:if>

        });
    });
</script>


<jsp:include page="widget/footer.jsp" flush="true"/>