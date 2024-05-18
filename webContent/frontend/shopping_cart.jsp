<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Shopping Cart"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div>&nbsp;</div>
	<div class="row">
		<div class="col text-center"><h2>Shopping Cart Details</h2></div>
	</div>

		
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center"><h4>${message}</h4></div>
		</div>
	</c:if>
		
	<c:set var="cart" value="${sessionScope['cart']}"/>
	
	<c:if test="${cart.totalItems == 0 }">
		<div class="row">
			<div class="col text-center"><h4>There's no items in your cart</h4></div>
		</div>
	</c:if>
		
		
	<c:if test="${cart.totalItems > 0 }">	
		<form action="update_cart" method="post" id="cartForm" style="max-width: 600px;margin: 0 auto">
			<c:forEach items="${cart.items}" var="item" varStatus="status">
				<div class="row border rounded p-1">
					<div class="col-sm">
						<div>${status.index + 1}</div>
					</div>
				
					<div class="col-5">
						<img class="img-fluid" src="data:image/jpg;base64,${item.key.base64Image}"/>
					</div>
					
					
					<div class="col-6">
						<div><h5>${item.key.title}</h5></div>
						<div>
							<input type="hidden" name="bookId" value="${item.key.bookId}"/>
							<input type="number" name="quantity${status.index + 1}" value="${item.value}"
								 class="form-control" style="max-width: 50px" size="5" required="required"
								step="1" min="1" />
						</div>
						<div>
							X <fmt:formatNumber value= "${item.key.price}"/> $
						</div>
						<div>
							= <span class="h5"><fmt:formatNumber value= "${item.value * item.key.price}"/>$</span>
						</div>
						
						<div align="right">
							<a href="remove_from_cart?book_id=${item.key.bookId}">Remove  <i class="fa-solid fa-trash"></i></a>
						</div>
					</div>
				</div>
				<div class="row">&nbsp;</div>
			</c:forEach>
			
			<div class="row">
				<div class="col-12 text-center">
					<b>${cart.totalQuantity} books</b>
					&nbsp;&nbsp;
					<span class="h4">Total: <fmt:formatNumber value= "${cart.totalAmount}"/>$</span>
				</div>
			</div>
			&nbsp;&nbsp;
			<div class="row">
				<div class="col-12 text-center">
					<button type="submit" class="btn btn-warning mr-5">Update</button>
					&nbsp;&nbsp;
					<input type="button" class="btn btn-secondary" id="clearCart" value="Clear Cart"/>
				</div>
			</div>
			&nbsp;&nbsp;
			<div class="row">
				<div class="col-12 text-center">
					<a href="${pageContext.request.contextPath}/">Continue Shopping</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="checkout">Checkout</a>
				</div>
			</div>
		</form>
		</c:if>
	&nbsp;&nbsp;
	<jsp:directive.include file="footer.jsp"/>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#clearCart").click(function(){
			window.location = "clear_cart";
		});
		
		$("#cartForm").validate({
			rules: {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
					quantity${status.index + 1}: {
						required: true,
						number: true,
						min: 1
					},
				</c:forEach>
			},
			
			messages: {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
					quantity${status.index + 1}: {required: "Please enter quantity"},
					number: "Quantity must be number",
					min: "Quantity must be greater than 0"
				</c:forEach>
			},
		});
	});
</script>
</body>
</html>