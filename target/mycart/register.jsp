<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eCart - Register</title>
<link rel="stylesheet" type="text/css" href="css/common_style.css">
<%@include file="components/bootstrap.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid row mt-5">
		<div class="col-md-4 offset-md-4 border border-primary">
			<%@include file="components/message.jsp" %>
			<div class="p-5 text-center bg-body-tertiary">
				<h3 data-mdb-ripple-init class="d-block bg-secondary py-2">Registration Form</h3>
			</div>
			<form action="RegisterServlet" method="post">
				<div class="col-md-12 mb-1">
					<label for="name" class="form-label">Username</label> 
					<input type="text" class="form-control" id="name" name="name" placeholder="Enter username">
				</div>
				<div class="col-md-12 mb-1">
					<label for="email" class="form-label">Email</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="Enter user email">
				</div>
				<div class="col-md-12 mb-1">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Enter password...">
				</div>
				<div class="col-md-12 mb-1">
					<label for="mobileNo" class="form-label">Mobile No</label> 
					<input type="number" class="form-control" id="mobileNo" name="mobileNo" placeholder="Enter phone number...">
				</div>
				<div class="col-md-12 mb-1">
					<label for="address" class="form-label">Address</label> 
					<input type="text" class="form-control" id="address" name="address" placeholder="Enter Address...">
				</div>
				<div class="dropdown-divider"></div>
				<p>Already register ?
					<a href="login.jsp" class="text-decoration-none">login here</a>
				</p>
				<div class="container text-end py-2">
				  <button type="reset" class="btn btn-danger me-2">Reset</button>
				  <button type="submit" class="btn btn-success">Submit</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>