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

	<div class="row">&nbsp;</div>

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
		<div class="row">
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">
				<div class="card">
					<div class="card-header">
						<div class="text-center"><h3>Review Your Order Details <a href="view_cart">Edit</a></h3></div>	
					</div>
					<div class="card-body">
						<div>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
								<div class="row">
									<div class="col-sm">${status.index + 1}</div>
									<div class="col-5">
										<img width="128" height="164" src="data:image/jpg;base64,${item.key.base64Image}"/>																			
									</div>
									<div class="col-6">
										<div><h6>${item.key.title}</h6></div>
										
										<div>
											by <i>${item.key.author}</i>
										</div>
										<div>
											<fmt:formatNumber value= "${item.key.price}"/> $
										</div>
										<div>
											X <input type="text" name="quantity${status.index + 1}" value="${item.value}" size="5" readonly="readonly" />
										</div>
										<div>= <b><fmt:formatNumber value= "${item.value * item.key.price}"/>$</b></div>
									</div>	
								</div>
								<div class="row">&nbsp;</div>
							</c:forEach>
							<div class="row">
								<div class="col text-center">
									<p>Number Of Book: ${cart.totalQuantity} $</p>
									<p>Subtotal: ${cart.totalAmount} $</p>
									<p>Tax: ${tax} $</p>
									<p>Shipping Fee: ${shippingFee} $</p>
									<p><b>Total: ${cart.totalAmount} $</b></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">&nbsp;</div>
				
				<div class="card">
					<div class="card-header">
						<div class="text-center"><h3>Recipient Information</h3></div>	
					</div>
				</div>
				
				<div class="card-body">
					<form id= "orderForm" action="place_order" method="post">
							<div class="form-group row">
								<label class="col-sm-4 col-formp-label">First Name:</label>
								<div class="col-sm-8"><input type="text" name="firstname" value="${loggedCustomer.firstname}" required="required" class="form-control"/></div>
							</div>
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Last Name:</label>
								<div class="col-sm-8"><input type="text" name="lastname" value="${loggedCustomer.lastname}"required="required" class="form-control"/></div>
							</div>
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Phone:</label>
								<div class="col-sm-8"><input type="text" name="phone" value="${loggedCustomer.phone}"required="required" class="form-control"/></div>
					        </div>
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Address Line 1:</label>
								<div class="col-sm-8"><input type="text" name="address1" value="${loggedCustomer.addressLine1}" required="required" class="form-control"/></div>
							</div>	
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Address Line 2:</label>
								<div class="col-sm-8"><input type="text" name="address2" value="${loggedCustomer.addressLine2}" required="required" class="form-control"/></div>
							</div>						
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">City:</label>
								<div class="col-sm-8"><input type="text" name="city" value="${loggedCustomer.city}" required="required" class="form-control"/></div>
							</div>
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">State:</label>
								<div class="col-sm-8"><input type="text" name="state" value="${loggedCustomer.state}" required="required" class="form-control"/></div>
							</div>						
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Zip Code:</label>
								<div class="col-sm-8"><input type="text" name="zipcode" value="${loggedCustomer.zipcode}" required="required" class="form-control"/></div>
							</div>						
							<div class="form-group row">
								<label class="col-sm-4 col-form-label">Country:</label>
								<div class="col-sm-8">
									<select name="country" id="country" class="form-control" required="required">
									<c:forEach items="${mapCountries}" var="country">
										<option value="${country.value}" <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
									</c:forEach>
									</select>
								</div>
							</div>													
						
						<div class="row">
							<div class="col text-center"><h2>Payment</h2></div>
						</div>
						
						
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Choose your payment method:</label>
							<div class="col-sm-8">
								&nbsp;&nbsp;&nbsp;
								<select name="paymentMethod" class="form-control">
									<option value="Cash On Delivery">Cash On Delivery</option>
									<option value="PayPal">PayPal or Credit Card</option>
								</select>
							</div>
						</div>
						
						<div class="row">
							<div class="col text-center">
								<button type="submit" class="btn btn-danger mr-4">Place Order</button>
								<a href="${pageContext.request.contextPath}/">Continue Shopping</a>
							</div>
						</div>
					</form>				
				</div>
			</div>
		</div>
	</c:if>
	</div>
	<div>&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>

<script type="text/javascript">

	$(document).ready(function(){
		$("#orderForm").validate({
			rules:{
				firstname: "required",
				lastname: "required",
				phone: "required",
				address1: "required",
				address2: "required",
				city: "required",
				state: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages:{
				firstname: "Please enter first name",
				lastname: "Please enter last name",
				phone: "Please enter recipient phone",
				address1: "Please enter address line 1",
				address2: "Please enter address line 2",
				city: "Please enter city",
				state: "Please enter state",
				zipcode: "Please enter zipcode",
				country: "Please enter country",
			}
		});
	});
</script>
</body>
</html>