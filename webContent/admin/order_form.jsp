<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Management Order"/>
	</jsp:include>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>	
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center"><h2 class="pageheading">Edit Order ID: ${order.orderId}</h2></div>
	</div>
	<div class="row">&nbsp;</div>	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center"><h4 class="message">${message}</h4></div>
		</div>
	</c:if>
	
	<form action="update_order" method="post">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="card">
					<div class="card-header">
						<div class="text-center"><h3>Information Order</h3></div>	
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col"><b>Ordered By: </b></div>
							<div class="col">${order.customer.fullname}</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col"><b>Order Date:  </b></div>
							<div class="col">${order.orderDate}</div>
						</div>
	
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col"><b>Payment Method: </b></div>
							<div class="col">
								<select name="paymentMethod" class="form-control">
									<option value="Cash On Delivery" <c:if test="${order.paymentMethod eq 'Cash On Delivery'}">selected='selected'</c:if> >Cash On Delivery</option>
									<option value="paypal" <c:if test="${order.paymentMethod eq 'paypal'}">selected='selected'</c:if> >PayPal or Credit Card</option>
								</select>
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col"><b>Order Status:  </b></div>
							<div class="col">
								<select name="orderStatus" class="form-control">
									<option value="Processing"<c:if test = "${order.status eq 'Processing'}">selected = 'selected'</c:if> >Processing</option>
									<option value="Shipping" <c:if test = "${order.status eq 'Shipping'}">selected = 'selected'</c:if> >Shipping</option>
									<option value="Delivered" <c:if test = "${order.status eq 'Delivered'}">selected = 'selected'</c:if> >Delivered</option>
									<option value="Completed" <c:if test = "${order.status eq 'Completed'}">selected = 'selected'</c:if> >Completed</option>
									<option value="Cancelled" <c:if test = "${order.status eq 'Cancelled'}">selected = 'selected'</c:if> >Cancelled</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			<div class="row">&nbsp;</div>
			<div class="card">
				<div class="card-header">
					<div class="text-center"><h2>Recipient Information</h2></div>	
				</div>	
				
				<div class="card-body">
					<div class="row">
						<div class="col"><b>First Name: </b></div>
						<div  class="col"><input type="text" class="form-control" name="firstname" value="${order.firstname}" size="45" required="required"  maxlength="50"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Last Name: </b></div>
						<div  class="col"><input type="text" class="form-control" name="lastname"   value="${order.lastname}" size="45"  required="required"  maxlength="50"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Phone: </b></div>
						<div  class="col"><input type="text" class="form-control" name="phone"  value="${order.phone}" size="45"  required="required"  maxlength="20"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Address Line 1: </b></div>
						<div  class="col"><input type="text" class="form-control" name="address1"  value="${order.addressLine1}" size="45"  required="required" maxlength="500"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Address Line 2: </b></div>
						<div  class="col"><input type="text" class="form-control" name="address2" value="${order.addressLine2}" size="45"  required="required"  maxlength="500"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>City: </b></div>
						<div  class="col"><input type="text" class="form-control" name="city"  value="${order.city}" size="45"  required="required" maxlength="50"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>State: </b></div>
						<div class="col"><input type="text" class="form-control"  name="state"   value="${order.state}" size="45"  required="required"   maxlength="50"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Zipcode: </b></div>
						<div class="col"><input type="text"  class="form-control" name="zipcode" value="${order.zipcode}" size="45" required="required"   maxlength="50"/></div>
					</div>
					<div class="row">&nbsp;</div>
					<div class="row">
						<div class="col"><b>Country: </b></div>
						<div class="col">
							<select name="country" required="required" class="form-control">
								<c:forEach items="${mapCountries}" var="country">
									<option value="${country.value}" <c:if test='${order.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">&nbsp;</div>
			<div class="card">
				<div class="card-header">
					<div class="text-center"><h3>Ordered Books:</h3></div>	
				</div>	
			
				<div align="center">
					<table class="table table-bordered table-striped table-hover table-responsive-sm">
						<thead class="thead-dark">
							<tr>
								<th>Index</th>
								<th class="col-4" >Book Title</th>
								<th>Author</th>
								<th class="col-2">Price</th>
								<th class="col-1" >Quantity</th>
								<th>Subtotal</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									
									<td>
										<img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64"/>
										${orderDetail.book.title}
									</td>
									
									<td>${orderDetail.book.author}</td>
									<td>
										<input type="hidden" name="price" value="${orderDetail.book.price}"/>
										$ ${orderDetail.book.price}
									</td>
									<td>
										<input type="hidden" name="bookId" value="${orderDetail.book.bookId}"/>
										<input type="number" name="quantity${status.index + 1}" class="form-control" value="${orderDetail.quantity}" size="3" step="1" min="1" required="required"/>
									</td>
									<td>$ ${orderDetail.subtotal}</td>
									<td><a href="remove_book_from_order?id=${orderDetail.book.bookId}"><i class="fas fa-trash"></i></a></td>
								</tr>
								<tr>
								    <td colspan="7" align="right">
								        <p><b>Subtotal: </b>${order.subtotal}</p>
								     
								        <div style="display: flex; justify-content: flex-end; align-items: center;">
								            <label style="margin-right: 10px;"><b>Tax:</b></label>
								            <input type="number" size="3" class="form-control" name="tax" value="${order.tax}" required="required" step="0.1" min="0.0" style="width: 80px; text-align: right;">
								        </div>
								        <div>&nbsp;</div>
								        <div style="display: flex; justify-content: flex-end; align-items: center;">
								            <label style="margin-right: 10px;"><b>Shipping Fee:</b></label>
								            <input type="number" size="3" class="form-control" name="shippingFee" value="${order.shippingFee}" required="required" step="0.1" min="0.0" style="width: 80px; text-align: right;">
								        </div>
								        <div>&nbsp;</div>
								        <p><b>TOTAL:</b>${order.total}</p>
									
								    </td>
					            </tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">&nbsp;</div>
			<div class="row">	
				<div class="col text-center">
					</br>
					<a href="javascript:showAddBook()" class="btn btn-danger mr-3"><b>Add Books</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="submit"  class="btn btn-warning mr-3" value="Save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="Cancel" class="btn btn-secondary" onclick="javascript:window.location.href='list_order'"/>		
				</div>
			</div>
		</div>
	</div>
</form>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<jsp:directive.include file="footer.jsp"/>
		<script>
			function showAddBook() {
				var width = 600;
				var height = 250;
				var left = (screen.width - width) / 2;
				var top = (screen.height - height) / 2;
				
				window.open('add_book_form', '_blank', 
						'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
			}	
		</script>
</div>
</body>
</html>