<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<div class="row">
	<a href="${pageContext.request.contextPath}/">
		<img src="images/Tin5.png" class="img-fluid"/>
	</a>
</div>
		
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="topNavbar">
		<form action="search" method ="get" class="form-inline">
			<input type="search" name="keyword" size="50" class="form-control mr-sm-2" placeholder="Search" />
			<input type="submit" value="Search" class="btn btn-outline-success my-2 my-sm-0"/>
		</form>
		<ul class="navbar-nav mr-auto">
			<c:if test="${loggedCustomer == null}">
				<li class="nav-item active">
					<a href="login" class="nav-link">Sign In</a>
				</li>
				
				<li class="nav-item active">
					<a href="register" class="nav-link">Sign Up</a>
				</li>

			</c:if>
			
			<c:if test="${loggedCustomer != null}">
				<li class="nav-item active">
					<a href="view_profile"  class="nav-link">Welcome ${loggedCustomer.fullname}</a>
				</li>
				<li class="nav-item active">
					<a href="view_orders"  class="nav-link">My orders</a> 
				</li>
				<li class="nav-item active">
					<a href="logout"  class="nav-link">Logout  <i class="fa-solid fa-right-from-bracket"></i></a> 
				</li>
			</c:if>
			<li class="nav-item active">
				<a href="view_cart"  class="nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
			</li> 
		</ul>
	</div>
</nav>
<div>&nbsp;</div>
<div class="row justify-content-center">
	<c:forEach var="category" items="${listCategory}" varStatus="status">
		<a href="view_category?id=${category.categoryId}">
			<font size="+1"><b> <c:out value="${category.name}"/> </b></font>
		</a>
		<c:if test="${not status.last}">
			&nbsp; | &nbsp; 
		</c:if>
	</c:forEach>
</div>

