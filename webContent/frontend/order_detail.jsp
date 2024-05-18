<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="My Order Details"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>	
	
	<c:if test="${order == null}">
		<div class="row">
			<div class="col text-center"><h4>Sorry, you are not authorized to view this order</h4></div>
		</div>
	</c:if>

	
	<c:if test="${order != null}">
		<div class="row">
			<div class="col text-center"><h2>Your Order ID: ${order.orderId}</h2></div>
		</div>
		<jsp:directive.include file="../common/common_order_details.jsp"/>	
	</c:if>
	
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>