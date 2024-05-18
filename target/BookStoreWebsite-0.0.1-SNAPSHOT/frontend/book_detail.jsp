<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="${book.title}- ITF BookStore"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div>&nbsp;</div>
	<div class="row">
		<div class="col-12">
			<h2>${book.title}</h2>by <span id="author"> ${book.author}</span>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-2">
			<img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}"/>	
		</div>
		
		<div class="col-sm-8">
			<div>
				<jsp:directive.include file="book_rating.jsp"/>
					<a href="#reviews">${fn:length(book.reviews)}-Reviews</a>	
			</div>
			<div>
				${book.description}
			</div>
		</div>
		
		<div class="col-sm-2 text-center" >
			<div><h2>$${book.price}</h2></div>
			<div><button id="buttonAddToCart" class="btn btn-danger">Add to Cart  <i class="fa-solid fa-cart-plus"></i></button></div>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col-12 text-center">
			<h3><a id="reviews">Customer Reviews</a></h3>
			&nbsp;
			<button id="buttonWriteReview" class="btn btn-secondary">Write Review   <i class="fa-sharp fa-solid fa-pen-to-square"></i></button>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>

	<c:forEach items="${book.reviews}" var="review">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<c:forTokens items="${review.stars}" delims="," var="star">
				<c:if test="${star eq 'on' }">
					<img src="images/rating_on.png">
				</c:if>
				<c:if test="${star eq 'off' }">
					<img src="images/rating_off.png">
				</c:if>
				</c:forTokens>
				- <b>${review.headline}</b>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				by ${review.customer.fullname} on ${review.reviewTime}
			</div>
			<div class="col-sm-1"></div>
		</div>

		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				${review.comment}
			</div>
			<div class="col-sm-1"></div>
		</div>

		<div class="row">&nbsp;</div>
	</c:forEach>
</div>
	
	<jsp:directive.include file="footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#buttonWriteReview").click(function(){
				window.location = "write_review?book_id=" + ${book.bookId};
			});
			$("#buttonAddToCart").click(function(){
				window.location = "add_to_cart?book_id=" + ${book.bookId};
			});
		});
	</script>
</body>
</html>