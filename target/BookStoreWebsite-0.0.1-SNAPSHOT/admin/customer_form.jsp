<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Customer Management"/>
	</jsp:include>
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>

	
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>

	<c:if test="${customer != null}">
		<div class="row">
			<div class="col text-center"><h2>Edit Customer</h2></div>
		</div>
	</c:if>
	<c:if test="${customer == null}">
		<div class="row">
			<div class="col text-center"><h2>Create New Customer</h2></div>
		</div>
	</c:if>

	<div class="row">&nbsp;</div>
	<div align = "center">
		<c:if test="${customer != null}">
			<form action="update_customer" method="post" id="customerForm" style = "max-width: 800px; margin: 0 auto;border: 0 auto" >
			<input type="hidden" name="customerId" value="${customer.customerId}"/>
		</c:if>
		
		<c:if test="${customer == null}">
			<form action="create_customer" method="post" id="customerForm" style = "max-width: 800px; margin: 0 auto;border: 0 auto">
		</c:if>
		
		<jsp:directive.include file="../common/customer_form.jsp"/>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>

<script>
$(document).ready(function(){		
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});
</script>

</html>