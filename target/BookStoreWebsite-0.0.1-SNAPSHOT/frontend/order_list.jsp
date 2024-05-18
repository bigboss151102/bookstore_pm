<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		<div class="col text-center"><h2>My Order History</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	<c:if test="${fn:length(listOrders) == 0}">
		<div class="row">
			<div class="col text-center"><h2>You have not placed any orders.</h2></div>
		</div>
	</c:if>

	<c:if test="${fn:length(listOrders) > 0}">
	<div align = "center">
		<table class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Index</th>
					<th>Order ID</th>
					<th>Quantity</th> 
					<th>Total Amount</th>
					<th>Order Date</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${listOrders}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${order.orderId}</td>
						<td>${order.bookCopies}</td>
						<td>$ ${order.total}</td>
						<td>${order.orderDate}</td>
						<td>${order.status}</td>
						<td>
							<a href="show_order_detail?id=${order.orderId}">View Details     <i class="fa-solid fa-eye"></i></a> &nbsp;	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">&nbsp;</div>
		<div class="d-flex justify-content-center">
		  <nav aria-label="Page navigation example">
		    <ul class="pagination">
		      <li class="page-item">
		        <c:if test="${index > 1}">
		          <a class="page-link" href="view_orders?page=${index-1}" aria-label="Previous">
		            <span aria-hidden="true">&laquo;</span>
		            <span class="sr-only">Previous</span>
		          </a>
		        </c:if>
		      </li>
		      <c:choose>
		        <c:when test="${index <= 2}">
		          <c:forEach begin="1" end="3" var="pageNumber">
		            <c:choose>
		              <c:when test="${pageNumber == index}">
		                <li class="page-item active">
		                  <a class="page-link" href="view_orders?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:when>
		              <c:otherwise>
		                <li class="page-item">
		                  <a class="page-link" href="view_orders?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:otherwise>
		            </c:choose>
		          </c:forEach>
		        </c:when>
		        <c:when test="${index > 2}">
		          <li class="page-item">
		            <a class="page-link" href="view_orders?page=1">1</a>
		          </li>
	              <li class="page-item disabled">
	                  <a class="page-link">...</a>
	              </li>
		          <c:forEach begin="${index - 1}" end="${index + 1}" var="pageNumber">
		            <c:choose>
		              <c:when test="${pageNumber == index}">
		                <li class="page-item active">
		                  <a class="page-link" href="list_books?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:when>
		              <c:otherwise>
		                <c:if test="${pageNumber <= endPage}">
		                  <li class="page-item">
		                    <a class="page-link" href="view_orders?page=${pageNumber}">${pageNumber}</a>
		                  </li>
		                </c:if>
		              </c:otherwise>
		            </c:choose>
		          </c:forEach>
		          <c:if test="${index < endPage}">
		            <li class="page-item disabled">
		              <a class="page-link">...</a>
		            </li>
		          </c:if>
		        </c:when>
		      </c:choose>
		      <li class="page-item">
		        <c:choose>
		          <c:when test="${index < endPage}">
		            <a class="page-link" href="view_orders?page=${index+1}" aria-label="Next">
		              <span aria-hidden="true">&raquo;</span>
		              <span class="sr-only">Next</span>
		            </a>
		          </c:when>
		        </c:choose>
		      </li>
		    </ul>
		  </nav>
		</div>
	</div>
	</c:if>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>