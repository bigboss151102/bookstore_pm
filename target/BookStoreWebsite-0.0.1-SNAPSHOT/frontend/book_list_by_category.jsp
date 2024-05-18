<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Book in ${category.name} - ITF BookStore"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	
	<div class ="row">
		<div class="col text-center"><h2>${category.name}</h2></div>
	</div>
	
	<div>&nbsp;</div>
	
	<div class="row justify-content-center">
		<c:forEach items="${listBooks}" var="book">
			<jsp:directive.include file="sumary_homepage.jsp"/>
		</c:forEach>
	</div>	
	<div class="d-flex justify-content-center">
	  <nav aria-label="Page navigation example">
	    <ul class="pagination">
	      <li class="page-item">
	        <c:if test="${index > 1}">
	          <a class="page-link" href="view_category?page=${index-1}&amp;id=${category.categoryId}" aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
	            <span class="sr-only">Previous</span>
	          </a>
	        </c:if>
	      </li>
	      <c:choose>
	        <c:when test="${index <= endPage}">
	          <c:forEach begin="1" end="${endPage}" var="pageNumber">
	            <c:choose>
	              <c:when test="${pageNumber == index}">
	                <li class="page-item active">
	                  <a class="page-link" href="view_category?page=${pageNumber}&amp;id=${category.categoryId}">${pageNumber}</a>
	                </li>
	              </c:when>
	              <c:otherwise>
	                <li class="page-item">
	                  <a class="page-link" href="view_category?page=${pageNumber}&amp;id=${category.categoryId}">${pageNumber}</a>
	                </li>
	              </c:otherwise>
	            </c:choose>
	          </c:forEach>
	        </c:when>
	      </c:choose>
	      <li class="page-item">
	        <c:choose>
	          <c:when test="${index < endPage}">
	            <a class="page-link" href="view_category?page=${index+1}&amp;id=${category.categoryId}" aria-label="Next">
	              <span aria-hidden="true">&raquo;</span>
	              <span class="sr-only">Next</span>
	            </a>
	          </c:when>
	        </c:choose>
	      </li>
	    </ul>
	  </nav>
	</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>