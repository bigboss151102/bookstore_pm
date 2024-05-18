
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Email:</label>
		<div class="col-sm-8">
			<input type="text" id="email" name="email" class="form-control" value= "${customer.email}" required="required"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">First Name:</label>
		<div class="col-sm-8">
			<input type="text" id="firstname" name="firstname" class="form-control" value="${customer.firstname}" required="required" />
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Last Name:</label>
		<div class="col-sm-8">
			<input type="text" id="lastname" name="lastname" class="form-control" value="${customer.lastname}"  required="required"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Password:</label>
		<div class="col-sm-8">
			<input type="password" id="password" name="password" class="form-control" value="${customer.password}" required="required" />
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Confirm Password:</label>
		<div class="col-sm-8">
			<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" value="${customer.password}" required="required" />
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Phone Number:</label>
		<div class="col-sm-8">
			<input type="text" id="phone" name="phone" class="form-control" value="${customer.phone}"  required="required"/>
		</div>

	</div>		
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Address Line1:</label>
		<div class="col-sm-8">
			<input type="text" id="address1" name="address1" class="form-control" value="${customer.addressLine1}" required="required" />
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Address Line2:</label>
		<div class="col-sm-8">
			<input type="text" id="address2" name="address2" class="form-control" value="${customer.addressLine2}"  required="required"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">City:</label>
		<div class="col-sm-8">
			<input type="text" id="city" name="city" class="form-control" value="${customer.city}"  required="required"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">State:</label>
		<div class="col-sm-8">
			<input type="text" id="state" name="state" class="form-control" value="${customer.state}"  required="required"/>
		</div>
	</div>
		
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Zip Code:</label>
		<div class="col-sm-8">
			<input type="text" id="zipcode" name="zipcode" class="form-control" value="${customer.zipcode}"  required="required"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-3 col-formp-label">Country:</label>
		<div class="col-sm-8">
			<select name="country" id="country" required="required" class="form-control">
			<c:forEach items="${mapCountries}" var="country">
				<option value="${country.value}" <c:if test='${customer.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
			</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="row">
		<div>&nbsp;</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<button type="submit" class="btn btn-warning mr-3">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value="Cancel" class="btn btn-secondary" onclick="history.go(-1);"/>
		</div>
	</div>

