<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Results for ${keyword}- ITF BookStore"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<c:if test="${fn:length(result) == 0}">
				<h2>No Results for "${keyword}"</h2>
			</c:if>
			
			<c:if test="${fn:length(result) > 0}">
				<h2>Results for "${keyword}"</h2>
			</c:if>
		</div>
	</div>
	
	<c:forEach items="${result}" var="book">
		<div class="row">
			<div class="col-sm-2 text-center">
					<a href="view_book?id=${book.bookId}"> 
						<img width="128" height="164" src="data:image/jpg;base64,${book.base64Image}" />
					</a>
			</div>
			<div class="col-sm-8">
				<div>
					<h3><a href="view_book?id=${book.bookId}">${book.title}</a></h3>
				</div>
				
				<div><jsp:directive.include file="book_rating.jsp"/></div>
				
				<div>
					<i>by ${book.author}</i>
				</div>
				
				<div>
					<c:set var="shortDescription" value="${fn:substring(book.description, 0, 100)}"/>
  					<p>${fn:escapeXml(shortDescription)}...</p>
				</div>					
			</div>
			
			<div class="col-sm-2 text-center">
				<h3>$${book.price}</h3>
				<h3><a href="add_to_cart?book_id=${book.bookId}" class="btn btn-danger">Add To Cart   <i class="fa-solid fa-cart-plus"></i></a></h3>
			</div>
		</div>
		<div class="row">&nbsp;</div>
	</c:forEach>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="d-flex justify-content-center">
	    <ul class="pagination">
	        <c:forEach begin="1" end="${endPage}" var="pageNumber">
	            <c:choose>
	                <c:when test="${pageNumber == index}">
	                    <li class="page-item active">
	                         <a class="page-link" href="search?page=${pageNumber}">${pageNumber}</a>
	                    </li>
	                </c:when>
	                <c:otherwise>
	                    <li class="page-item">
	                         <a class="page-link" href="search?page=${pageNumber}">${pageNumber}</a>
	                    </li>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	    </ul>
	</div>
	<jsp:directive.include file="footer.jsp" />
</div>
</body>
</html>