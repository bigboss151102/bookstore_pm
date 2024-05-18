<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Management Books"/>
	</jsp:include>

	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="..//css/richtext.min.css">	
	<script type="text/javascript" src="../js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/jquery.richtext.min.js"></script>
	
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${book != null}">
		<div class="row">
			<div class="col text-center"><h2>Edit Book</h2></div>
		</div>
	</c:if>
	
	<c:if test="${book == null}">
		<div class="row">
			<div class="col text-center"><h2>Create New Book</h2></div>
		</div>
	</c:if>
	
	<div class="row">&nbsp;</div>
	
	<div class="row justify-content-center">
		<c:if test="${book != null}">
			<div class="row">
				<form action="update_book" method="post" id="bookForm"  enctype="multipart/form-data" style = "max-width: 800px; margin: 0 auto;border: 0 auto">
						<input type="hidden" name="bookId" value="${book.bookId}"/>
							<div class="border-0">
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Category:</b></label>
									
									<div class="col-sm-8">
										<select name="category" class="form-control">
								 			<c:forEach items="${listCategory}" var="category">
								 				<c:if test="${category.categoryId eq book.category.categoryId}">
								 					<option value="${category.categoryId}" selected="selected" >
								 				</c:if>
								 				<c:if test="${category.categoryId ne book.category.categoryId}">
								 					<option value="${category.categoryId}">
								 				</c:if>
								 					${category.name}
								 				</option>
								 				
								 			</c:forEach>
							 			</select>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Title:</b></label>
									<div class="col-sm-8">
										<input type="text" id="title" name="title" class="form-control" value= "${book.title}" required="required"/>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Author:</b></label>
									<div class="col-sm-8">
										<input type="text" id="author" name="author" class="form-control" value="${book.author}"required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>ISBN:</b></label>
									<div class="col-sm-8">
										<input type="text" id="isbn" name="isbn" class="form-control" value="${book.isbn}"required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Publish Date:</b></label>
									<div class="col-sm-8" >
										<input type="date" id="publishDate" name="publishDate" class="form-control" required="required"
											value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${book.publishDate}' />" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Book Image:</b></label>
									<div class="col-sm-8">
										<c:if test="${book == null}">
											<input type="file" id="bookImage" name="bookImage"class="form-control" required="required"/><br/>
										</c:if>
										
										<c:if test="${book != null}">
											<input type="file" id="bookImage" name="bookImage" class="form-control"/><br/>
										</c:if>
										
										<img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
											src="data:image/jpg;base64,${book.base64Image}"
										 />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Price:</b></label>
									<div class="col-sm-8">
										<input type="text" id="price" name="price" class="form-control" value="${book.price}" required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Description:</b></label>
									<div class="col-sm-8">
										<textarea rows="7" cols="70" class="form-control" name="description" id="description" required="required"> ${book.description} </textarea>
									</div>
								</div>
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col text-center">
										<button type="submit" class="btn btn-warning">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button id="buttonCancel" class="btn btn-secondary">Cancel</button>
									</div>
								</div>
							</div>
					</form>
				</div>
		</c:if>
		
		<c:if test="${book == null}">
			<div class="row">
				<form action="create_book" method="post" id="bookForm"  enctype="multipart/form-data" style = "max-width: 800px; margin: 0 auto;border: 0 auto">
						<input type="hidden" name="bookId" value="${book.bookId}"/>
							<div class="border-0">
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Category:</b></label>
									
									<div class="col-sm-8">
										<select name="category" class="form-control">
								 			<c:forEach items="${listCategory}" var="category">
								 				<c:if test="${category.categoryId eq book.category.categoryId}">
								 					<option value="${category.categoryId}" selected="selected" >
								 				</c:if>
								 				<c:if test="${category.categoryId ne book.category.categoryId}">
								 					<option value="${category.categoryId}">
								 				</c:if>
								 					${category.name}
								 				</option>
								 				
								 			</c:forEach>
							 			</select>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Title:</b></label>
									<div class="col-sm-8">
										<input type="text" id="title" name="title" class="form-control" value= "${book.title}" required="required"/>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Author:</b></label>
									<div class="col-sm-8">
										<input type="text" id="author" name="author" class="form-control" value="${book.author}"required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>ISBN:</b></label>
									<div class="col-sm-8">
										<input type="text" id="isbn" name="isbn" class="form-control" value="${book.isbn}"required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Publish Date:</b></label>
									<div class="col-sm-8" >
										<input type="date" id="publishDate" name="publishDate" class="form-control" required="required"
											value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${book.publishDate}' />" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Book Image:</b></label>
									<div class="col-sm-8">
										<c:if test="${book == null}">
											<input type="file" id="bookImage" name="bookImage"class="form-control" required="required"/><br/>
										</c:if>
										
										<c:if test="${book != null}">
											<input type="file" id="bookImage" name="bookImage" class="form-control"/><br/>
										</c:if>
										
										<img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
											src="data:image/jpg;base64,${book.base64Image}"
										 />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Price:</b></label>
									<div class="col-sm-8">
										<input type="text" id="price" name="price" class="form-control" value="${book.price}" required="required" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-3 col-formp-label"><b>Description:</b></label>
									<div class="col-sm-8">
										<textarea rows="7" cols="70" class="form-control" name="description" id="description" required="required"> ${book.description} </textarea>
									</div>
								</div>
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col text-center">
										<button type="submit" class="btn btn-warning">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button id="buttonCancel" class="btn btn-secondary">Cancel</button>
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
		//$('#description').richText();
		
	    //<script>
        //var html = '<div class="form-group row">' +
        //    '<label class="col-sm-3 col-formp-label"><b>Description:</b></label>' +
        //    '<div class="col-sm-8">' +
        //    '<textarea rows="7" cols="70" class="form-control" name="description" id="description" required="required">' + book.description + '</textarea>' +
        //    '</div>' +
        //   '</div>';

        //var textarea = document.getElementById("description");
        //textarea.innerHTML = html;
  		
	

		$('#bookImage').change(function() {
			showImageThumbnail(this);
		});
		
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		
		reader.readAsDataURL(file);
	}
</script>
</html>