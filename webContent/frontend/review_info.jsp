<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<title>Write a Review - ITF Bookstore</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">	
	<script type="text/javascript" src="js/jquery-3.6.3.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
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
				<h4>${book.title}</h4>
				<img class= "img-fluid" src="data:image/jpg;base64,${book.base64Image}"/>	
			</div>
			
			<div class = "col-sm-8">
				<div id="rateYo"></div>
				<div>&nbsp;</div>
				<div>
					<input type="text" name="headline" size="60" readonly="readonly" value="${review.headline}" class="form-control"/>
				</div>
				<div>&nbsp;</div>
				<div>
					<textarea name="comment" cols="70" rows="10" readonly="readonly"  class="form-control">${review.comment}</textarea>
				</div>
			</div>
		</div>		
	</form>
	<jsp:directive.include file="footer.jsp"/>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#rateYo").rateYo({
		    starWidth: "40px",
			fullStar: true,
			rating: ${review.rating},
			readOnly: true
		});
	});
</script>
</body>
</html>