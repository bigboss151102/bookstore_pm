<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Review Management"/>
	</jsp:include>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title>Edit Review</title>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	<div class="row">
		<div class="col text-center"><h2>Edit Review</h2></div>
	</div>
	<div class="row">&nbsp;</div>
  	<div class="row justify-content-center">
		<form action="update_review" method="post" id="reviewForm">
	      	<input type="hidden" name="reviewId" value="${review.reviewId}">

				<div class="form-group row">
					<label class="col-sm-2 col-formp-label"><b>Last Name:</b></label>
					<div class="col-sm-5">${review.book.title}</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-formp-label"><b>Rating:</b></label>
					<div class="col-sm-5">${review.rating}</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-formp-label"><b>Customer:</b></label>
					<div class="col-sm-5">${review.customer.fullname}</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-formp-label"><b>Headline:</b></label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="headline"
							id="headline" value="${review.headline}">
					</div>
				</div>


				<div class="form-group row">
					<label class="col-sm-2 col-formp-label"><b>Comment:</b></label>
					<div class="col-sm-5">
						<textarea rows="8" class="form-control" name="comment"
							id="comment" style="width: 600px">${review.comment}</textarea>
					</div>
				</div>

				<div class="row">&nbsp;</div>
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col text-center">
						<button type="submit" class="btn btn-warning">Save</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="button" id="buttonCancel" class="btn btn-secondary"
							value="Cancel">
					</div>
				</div>
			</form>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>

</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#reviewForm").validate({
		rules: {
			headline: "required",
			comment:  "required"
		},
		
		messages: {
			headline:"Please enter headline",
			comment: "Please enter comment"
		},
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});
</script>
</html>