<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Customer Login"/>
	</jsp:include>
<body style="background-color: #f8f9fa;">
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	<div class="row">
		<div class="col text-center"><h2>Customer Login</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center"><h4 class="message">${message}</h4></div>
		</div>
	</c:if>

				
		<form id= "formLogin" action="login" method="post" style="max-width: 400px; margin: 0 auto">
			<div class="border border-secondary rounded p-3">
				<div class="form-group row">
					<label class="col-sm-3 col-formp-label">Email:</label>
					<div class="col-sm-8">
						<input type="text" name="email"  class="form-control" placeholder="Enter email" required="required">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-formp-label">Password:</label>
					<div class="col-sm-8">
						<input type="password" name="password"  class="form-control" placeholder="Enter Password"  required="required">
					</div>
				</div>
				<div class="row">
					<div class="col text-center" >
						<button type="submit" class="btn btn-warning">Login</button>
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
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
	
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#formLogin").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				password: "required", 
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter an valid email address"
				},
				password: "Please enter password"
			},
		});
	});
</script>
</body>
</html>