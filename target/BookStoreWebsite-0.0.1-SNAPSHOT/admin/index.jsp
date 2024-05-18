<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="My Order - ITF Bookstore"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center"><h1>Administrative Dasboard</h1></div>
	</div>
	<div class="row">
		<hr width ="80%" />
	</div>

	<div class="row">
		<div class="col text-center"><h2>Quick Action:</h2></div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-2 text-center">
			<b><a href="new_book"><i class="fa-solid fa-book"></i>   New Book</a> &nbsp</b>
		</div>
		
		<div class="col-2 text-center">
			<b><a href="user_form.jsp"><i class="fa-solid fa-user"></i>   New User</a> &nbsp</b>
		</div>
		
		<div class="col-2 text-center">
			<b><a href="category_form.jsp"><i class="fa-solid fa-bolt-lightning"></i>  New Category</a> &nbsp</b>
		</div>
		
		<div class="col-2 text-center  ">
			<b><a href="new_customer"><i class="fa-solid fa-person"></i>   New Customer</a> &nbsp</b>
		</div>
	</div>
	
	<div class="row">
		<hr width ="80%" />
	</div>
	
	<div class="row">
		<div class="col text-center"><h2>Recent Sales:</h2></div>
	</div>
	
	
	<div align = "center">
		<table  class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Order ID</th>
					<th>Ordered By</th>
					<th>Book Quantity</th>
					<th>Total</th>
					<th>Payment Method</th>
					<th>Status</th>
					<th>Order Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listMostRecentSales}" var="order" varStatus="status">
				<tr>
					<td><a href="view_order?id=${order.orderId}"><b>${order.orderId}</b></a></td>
					<td>${order.customer.fullname}</td>
					<td>${order.bookCopies}</td>
					<td>${order.total}</td>
					<td>${order.paymentMethod}</td>
					<td>${order.status}</td>
					<td>${order.orderDate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
	<div class="row">
		<hr width ="80%" />
	</div>
	
	<div class="row">
		<div class="col text-center"><h2>Recent Reviews:</h2></div>
	</div>
	<div align = "center">
		<table class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Book</th>
					<th>Rating</th>
					<th>Headline</th>
					<th>Customer</th>
					<th>Review On</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listMostRecentReviews}" var="review" >
				<tr>
					<td>${review.book.title}</td>
					<td>${review.rating}</td>
					<td><a href="edit_review?id=${review.reviewId}"> ${review.headline}</a></td>
					<td>${review.customer.fullname}</td>
					<td>${review.reviewTime}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row">
		<hr width ="80%" />
	</div>
	<div class="row">
		<div class="col text-center"><h2>Statistics:</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	<div align = "center">
			<b>Total Users</b>: ${totalUsers} &nbsp;&nbsp;&nbsp;&nbsp;
			<b>Total Books</b>: ${totalBooks} &nbsp;&nbsp;&nbsp;&nbsp;
			<b>Total Customers</b>: ${totalCustomer} &nbsp;&nbsp;&nbsp;&nbsp;
			<b>Total Reviews</b>: ${totalReviews} &nbsp;&nbsp;&nbsp;&nbsp;
			<b>Total Orders</b>: ${totalOrders} &nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>