<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Create New User"/>
	</jsp:include>
	<script type="text/javascript" src="../js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	
</head>
<body>
<div class = "container">
	<jsp:directive.include file="header.jsp"/>

	<div class="row">
		&nbsp;
	</div>
	
	<c:if test="${user != null}">
		<div class="row">
			<div class="col text-center"><h2>Edit User</h2></div>
		</div>
	</c:if>
	<c:if test="${user == null}">
		<div class="row">
			<div class="col text-center"><h2>Create New User</h2></div>
		</div>
	</c:if>

	<div class="row">&nbsp;</div>
	
	<div class="row justify-content-center">
		<c:if test="${user != null}">
			<div class="row">
				<form action="update_user" method="post" style = "min-width: 500px; margin: 0 auto;" id="userForm" >
					<input type="hidden" name="userId" value="${user.userId}">
						<div class="border-0">
				
							<div class="form-group row">
								<label class="col-sm-3 col-formp-label">Email:</label>
								<div class="col-sm-8">
									<input type="text" id="email" name="email" class="form-control" placeholder="Enter email" value= "${user.email}"  required="required" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3 col-formp-label">Full Name:</label>
								<div class="col-sm-8">
									<input type="text" id="fullname" name="fullname"  class="form-control" placeholder="Enter Fullname" value="${user.fullName}" required="required"  />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3 col-formp-label">Password:</label>
								<div class="col-sm-8">
									<input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" value="${user.password}"  required="required" />
								</div>
							</div>
							
							<div class="row">&nbsp;</div>

							<div class="row">
								<div class="col text-center">
									<button type="submit" class="btn btn-warning">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-secondary" onclick="history.go(-1);">Cancel</button>
								</div>
							</div>
						</div>
				</form>
			</div>
		</c:if>
		
		<c:if test="${user == null}">
			<div class="row">
				<form action="create_user" method="post"  style = "min-width: 500px; margin: 0 auto;" id="userForm">
					<div class="border-0">
			
						<div class="form-group row">
							<label class="col-sm-3 col-formp-label">Email:</label>
							<div class="col-sm-8">
								<input type="text" id="email" name="email" class="form-control" placeholder="Enter email" value= "${user.email}" required="required" />
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-3 col-formp-label">Full Name:</label>
							<div class="col-sm-8">
								<input type="text" id="fullname" name="fullname"  class="form-control" placeholder="Enter Fullname" value="${user.fullName}"  required="required" />
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-3 col-formp-label">Password:</label>
							<div class="col-sm-8">
								<input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" value="${user.password}"  required="required" />
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col text-center">
								<button type="submit" class="btn btn-warning">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary" onclick="history.go(-1);">Cancel</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</c:if>
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
<script type="text/javascript">
	$(document).ready(function(){		
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
	});
</script>
</html>