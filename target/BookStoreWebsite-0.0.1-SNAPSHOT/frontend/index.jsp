<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="DUT"/>
	</jsp:include>
<body>

<div class="container">
	<jsp:directive.include file="header.jsp"/>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row text-center">
		<div class="col"><h2><i class="fa-solid fa-book"></i>   New Books</h2></div>
	</div>
	
	<div>&nbsp;</div>
		
	<div class="row justify-content-center mb-3">
		<c:forEach items="${listNewBooks}" var="book">
			<jsp:directive.include file="sumary_homepage.jsp"/>
		</c:forEach>
	</div>
	
	<div class="row text-center">
		<div class="col"><h2><i class="fa-solid fa-trophy"></i>   Best-Selling-Books</h2></div>
	</div>
	<div>&nbsp;</div>
	
	<div class="row justify-content-center mb-3">
		<c:forEach items="${listBestSellingBooks}" var="book">
			<jsp:directive.include file="sumary_homepage.jsp"/>
		</c:forEach>
	</div>
	
	<div class="row text-center">
		<div class="col"><h2><i class="fa-solid fa-thumbs-up"></i>   Most-Favored Books</h2></div>
	</div>
	<div>&nbsp;</div>
	
		
	<div class="row justify-content-center mb-3">
		<c:forEach items="${listMostFavoredBooks}" var="book">
			<jsp:directive.include file="sumary_homepage.jsp"/>
		</c:forEach>
	</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>