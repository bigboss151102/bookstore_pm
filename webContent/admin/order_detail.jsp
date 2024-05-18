<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Orders Management"/>
	</jsp:include>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>	
	<div class="row">&nbsp;</div>	
	<div class="row">
		<div class="col text-center"><h2>Details of Order ID: ${order.orderId}</h2></div>
	</div>
	<div class="row">&nbsp;</div>	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center"><h4 class="message">${message}</h4></div>
		</div>
	</c:if>
	<jsp:directive.include file="../common/common_order_details.jsp"/>	
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<div class="row">
		<div class="col text-center">
			<a href="edit_order?id=${order.orderId}" class="btn btn-warning">Edit Order</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href="javascript:void(0);" class="btn btn-secondary deleteLink" data-order-id="${order.orderId}" >Delete Order</a>
		</div>
	</div>
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<div class="row">&nbsp;</div>	
	<jsp:directive.include file="footer.jsp"/>
	<script>
		$(document).ready(function() {
		  $(".deleteLink").on("click", function() {
		    var orderId = $(this).data("order-id");
		    if (confirm("Are you sure you want to delete the Order with ID " + orderId + " ?")) {
		      window.location = "delete_order?id=" + orderId;
		    }
		  });
		});
	</script>
</div>
</body>
</html>