<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eCart - Login</title>
<link rel="stylesheet" type="text/css" href="css/common_style.css">
<%@include file="components/bootstrap.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid row mt-5">
		<div class="col-md-4 offset-md-4 border border-primary">
			<%@include file="components/message.jsp"%>
			<div class="p-5 text-center bg-body-tertiary">
				<h3 data-mdb-ripple-init class="d-block bg-primary py-2">Login Form</h3>
			</div>
			<form action="LoginServlet" method="post">
				<div class="col-md-12 mb-1">
					<label for="email" class="form-label">Email</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="Enter user email">
				</div>
				<div class="col-md-12 mb-1">
					<label for="password" class="form-label">Password</label> 
					<input type="password" class="form-control" id="password" name="password" placeholder="Enter user password">
				</div>
				<!-- 2 column grid layout for inline styling -->
				  <div class="row mb-4">
				    <div class="col d-flex justify-content-center">
				      <!-- Checkbox -->
				      <div class="form-check">
				        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
				        <label class="form-check-label" for="form2Example31"> Remember me </label>
				      </div>
				    </div>
				
				    <div class="col">
				      <!-- Simple link -->
				      <a class="text-decoration-none" href="#!">Forgot password?</a>
				    </div>
				  </div>
				<div class="container text-end py-2">
				  <button type="reset" class="btn btn-danger me-2">Reset</button>
				  <button type="submit" class="btn btn-success">Login</button>
				  <div class="text-center"><p>Not a member? <a class="text-decoration-none" href="register.jsp">Register</a></p></div>
				</div>
			</form>
		</div>

	</div>
</body>
</html>