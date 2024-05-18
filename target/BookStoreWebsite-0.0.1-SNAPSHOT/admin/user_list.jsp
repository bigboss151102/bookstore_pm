<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Users Management"/>
	</jsp:include>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>	
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>	
	
	<div class="row">&nbsp;</div>

	<div class="row">
		<div class="col text-center"><h2>Users Management</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">
		<div class="col text-center"><h4><a href="user_form.jsp"><i class="fas fa-plus"></i>   Create New User</a></h4></div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center"><h4 class="message">${message}</h4></div>
		</div>
	</c:if>
		
	<div align = "center">
		<table class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>Email</th>
					<th>Full Name</th>
					<th class="col-2">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach  var="user" items="${listUsers}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td>${user.email}</td>
					<td>${user.fullName}</td>
					<td>
						<a href="edit_user?id=${user.userId}">Edit   <i class="fas fa-edit"></i></a> &nbsp;
						&nbsp;
						&nbsp;
						<a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete   <i class="fas fa-trash"></i></a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
		  <nav aria-label="Page navigation example">
		    <ul class="pagination">
		      <li class="page-item">
		        <c:if test="${index > 1}">
		          <a class="page-link" href="list_users?page=${index-1}" aria-label="Previous">
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
		                  <a class="page-link" href="list_users?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:when>
		              <c:otherwise>
		                <li class="page-item">
		                  <a class="page-link" href="list_users?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:otherwise>
		            </c:choose>
		          </c:forEach>
		        </c:when>
		        <c:when test="${index > 2}">
		          <li class="page-item">
		            <a class="page-link" href="list_users?page=1">1</a>
		          </li>
	              <li class="page-item disabled">
	                  <a class="page-link">...</a>
	              </li>
		          <c:forEach begin="${index - 1}" end="${index + 1}" var="pageNumber">
		            <c:choose>
		              <c:when test="${pageNumber == index}">
		                <li class="page-item active">
		                  <a class="page-link" href="list_users?page=${pageNumber}">${pageNumber}</a>
		                </li>
		              </c:when>
		              <c:otherwise>
		                <c:if test="${pageNumber <= endPage}">
		                  <li class="page-item">
		                    <a class="page-link" href="list_users?page=${pageNumber}">${pageNumber}</a>
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
		            <a class="page-link" href="list_users?page=${index+1}" aria-label="Next">
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
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
	<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					userId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the user with ID ' +  userId + '?')) {
						window.location = 'delete_user?id=' + userId;
					}					
				});
			});
		});
	</script>
</div>
</body>
</html>