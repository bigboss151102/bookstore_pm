<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Customer Profile - ITF Bookstore"/>
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp"/>
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
			<div class="col text-center"><h2><i class="fa-solid fa-person"></i>   Welcome ${loggedCustomer.fullname}</h2></div>
	</div>
	<div class="row">&nbsp;</div>
	<form style="max-width: 600px; margin: 0 auto" >
		<div class="border border-secondary rounded p-3">
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">E-mail Address:</label>
				<div class="col-sm-8">
					<b>${loggedCustomer.email}</b>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">First Name:</label>
				<div class="col-sm-8">
					${loggedCustomer.firstname}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Last Name:</label>
				<div class="col-sm-8">
					${loggedCustomer.lastname}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Phone Number:</label>
				<div class="col-sm-8">
					${loggedCustomer.phone}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Address Line 1:</label>
				<div class="col-sm-8">
					${loggedCustomer.addressLine1}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Address Line 2:</label>
				<div class="col-sm-8">
					${loggedCustomer.addressLine2}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">City:</label>
				<div class="col-sm-8">
					${loggedCustomer.city}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">State:</label>
				<div class="col-sm-8">
					${loggedCustomer.state}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Zip Code:</label>
				<div class="col-sm-8">
					${loggedCustomer.zipcode}
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-formp-label">Country:</label>
				<div class="col-sm-8">
					${loggedCustomer.countryName}
				</div>
			</div>
			
		</div>
	</form>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class = "col text-center"><b><a href="edit_profile">Edit My Profile   <i class="fa-solid fa-pen-to-square"></i></a></b></div>

	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<div class="row">&nbsp;</div>
	<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>