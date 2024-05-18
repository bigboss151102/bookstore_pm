<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Customer Login"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div align="center">
		<form id="reviewForm" action="submit_review" method="post" style="max-width: 900px; margin: 0 auto">
			<div class="row">
				<div class="col"><h2>Your Review</h2></div>
				<div class="col">&nbsp;</div>
				<div class = "col"><h4>${loggedCustomer.fullname}</h4></div>
			</div>
			
			<div class="row">
				<div class="col"><hr/></div>
			</div>
			
			
			<div class="row">
				<div class = "col-sm-4">
					<span id = "book-title">${book.title}</span>
					<img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}"/>	
				</div>
				
				<div class = "col-sm-8">
					<h3>Your review has been posted.Thank you !</h3>
				</div>
			</div>
		</form>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>