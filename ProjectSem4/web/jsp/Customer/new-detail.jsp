<%-- 
    Document   : new-detail
    Created on : Aug 17, 2020, 10:36:59 PM
    Author     : Acer Nitro 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="widget/header.jsp" flush="true"/>
<jsp:include page="widget/other/navbar.jsp" flush="true"/>

<section id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/new/index.htm">Tin tức</a></li>
            <li class="active">${news.newTitle}</li>
        </ul>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">${news.newTitle}</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1 hidden-sm hidden-xs text-center">
                <div class="tag-date">
                    <div class="tag-day"><fmt:formatDate value="${news.createdDate}" pattern="dd" /></div>
                    <div class="tag-month small-font"><fmt:formatDate value="${news.createdDate}" pattern="MM" /></div>
                </div>
            </div>
            <div class="col-md-8 col-sm-9 col-xs-9">
                <div class="new-detail-image">
                    <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${news.newImage}" class="img-responsive" alt="${news.newTitle}" />
                </div>
                <div class="new-detail-content" style="overflow: hidden;">
                    ${news.newContent}
                </div>
                <div class="new-detail-info dp-flex">
                    <ul>
                        
                        </ul>
                        <ul class="pull-right">
                            <li>
                                <i class="fa fa-clock-o"></i> <fmt:formatDate value="${news.createdDate}" pattern="HH:mm:ss dd-MM-yyyy" />
                        </li>
                        <li>
                            <i class="fa fa-user"></i> ${news.adminId.adminFullName}
                        </li>
                    </ul>
                </div>
                <div class="clearfix"><br></div>
                <hr>
                <div class="comment-list" id="comment-list">
                    <c:if test="${not empty newComments}">
                        <c:forEach items="${newComments}" var="cmt">
                            <div class="comment-items">
                                <div class="comment-info">
                                    <img src="${pageContext.request.contextPath}/views/backend/uploads/images/Customers/${cmt.customerId.customerAvatar}" class="img-responsive" alt="Customer Avatar" />
                                    <div class="comment-user-name text-center">${cmt.customerId.customerFullname}</div>
                                </div>
                                <div class="comment-content">
                                    ${cmt.newCommentContent}
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>

                <div class="comment-form">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">Bình luận</h3>
                            </div>
                        </div>
                    </div>
                    <form action="" method="POST" role="form">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="hidden" name="newId" value="${news.newId}" />
                                    <textarea name="newCommentContent" class="form-control" rows="8" required="required" placeholder="Nhập nội dung..."></textarea>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="primary-btn">Gửi bình luận</button>
                    </form>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="release-title large-font upper-case">Tin liên quan</div>
                <div class="list-release-news">
                    <c:if test="${not empty relatedNews}">
                        <c:forEach items="${relatedNews}" var="n">
                            <div class="release-new-item">
                                <div class="release-new-image">
                                    <a href="${pageContext.request.contextPath}/new/detail.htm?newId=${n.newId}">
                                        <img src="${pageContext.request.contextPath}/jsp/Admin/uploads/images/News/${n.newImage}" class="img-responsive" alt="${n.newTitle}" />
                                    </a>
                                </div>
                                <div class="release-new-info">
                                    <div class="release-new-title medium-font" style="font-weight: bold; text-decoration: underline;">
                                        <a href="${pageContext.request.contextPath}/new/detail.htm?newId=${n.newId}" title="${n.newTitle}">${n.newTitle}</a>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 upper-case">
                                            <i class="fa fa-user"></i> ${n.adminId.adminFullName}
                                        </div>
                                        <div class="col-md-6">
                                            <i class="fa fa-clock-o"></i> <fmt:formatDate value="${n.createdDate}" />
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="widget/footer.jsp" flush="true"/>