<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">	
			<jsp:param name="pageTitle" value="Category Management"/>
	</jsp:include>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	
	<c:if test="${category != null}">
		<div>
			<div class="col text-center"><h3>Edit Category</h3></div>
		</div>
	</c:if>
	<c:if test="${category == null}">
		<div>
			<div class="col text-center"><h3>Create New Category</h3></div>
		</div>
	</c:if>
	
	<div class="row">&nbsp;</div>
	
	
	<div class="row justify-content-center">
		<c:if test="${category != null}">
			<div class="row">
				<form action="update_category" method="post"  style = "min-width: 600px; margin: 0 auto;" id="categoryForm">
					<input type="hidden" name="categoryId" value="${category.categoryId}">
						<div class="border-0">
							
							<div class="form-group row">
								<label class="col-sm-3 col-formp-label">Name Category:</label>
								<div class="col-sm-8">
									<input type="text" id="name" name="name" class="form-control"  value="${category.name}" required="required" />
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
		
		<c:if test="${category == null}">
			<div class="row">
				<form action="create_category" method="post"  style = "min-width: 600px; margin: 0 auto;" id="categoryForm">
					<input type="hidden" name="categoryId" value="${category.categoryId}">
						<div class="border-0">
							<div class="form-group row">
								<label class="col-sm-3 col-formp-label">Name Category:</label>
								<div class="col-sm-8">
									<input type="text" id="name" name="name" class="form-control"  value="${category.name}" required="required" />
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