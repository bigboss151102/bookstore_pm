<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Edit My Profile"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
			<div class="col text-center"><h2>Edit My Profile</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	 <form action="update_profile" method="post" id="customerForm"  style="max-width: 800px; margin: 0 auto" >
		 <div>
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Email:</label>
				<div class="col-sm-8">
					<b>${loggedCustomer.email}</b>
				</div>
			</div>

			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">First Name:</label>
				<div class="col-sm-8">
					<input type="text" id="firstname" name="firstname" size="45" value="${loggedCustomer.firstname}" class="form-control" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Last Name:</label>
				<div class="col-sm-8">
					<input type="text" id="lastname" name="lastname" size="45" value="${loggedCustomer.lastname}" class="form-control"  required="required" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Phone Number:</label>
				<div class="col-sm-8">
					<input type="text" id="phone" name="phone" size="20" value="${loggedCustomer.phone}" class="form-control"  required="required"/>
				</div>

			</div>		
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Address Line1:</label>
				<div class="col-sm-8">
					<input type="text" id="address1" name="address1" size="45" value="${loggedCustomer.addressLine1}" class="form-control"  required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Address Line2:</label>
				<div class="col-sm-8">
					<input type="text" id="address2" name="address2" size="45" value="${loggedCustomer.addressLine2}" class="form-control"  required="required"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">City:</label>
				<div class="col-sm-8">
					<input type="text" id="city" name="city" size="45" value="${loggedCustomer.city}" class="form-control"  required="required"/>
				</div>
			</div>	
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">State:</label>
				<div class="col-sm-8">
					<input type="text" id="state" name="state" size="45" value="${loggedCustomer.state}" class="form-control"  required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Zip Code:</label>
				<div class="col-sm-8">
					<input type="text" id="zipcode" name="zipcode" size="20" value="${loggedCustomer.zipcode}" class="form-control"  required="required"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Country:</label>
				<div class="col-sm-8">
					<select name="country" id="country" class="form-control"  required="required">
						<c:forEach items="${mapCountries}" var="country">
							<option value="${country.value}" <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Password:</label>
				<div class="col-sm-8">
					<input type="password" id="password" name="password" size="45" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Confirm Password:</label>
				<div class="col-sm-8">
					<input type="password" id="confirmPassword" name="confirmPassword" size="45" class="form-control"/>
				</div>
			</div>
			<div class="row">&nbsp;</div>
			<div class="form-group row">
				<div class="col text-center">
					<button type="submit" class="btn btn-warning">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel" class="btn btn-secondary" >Cancel</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>