<%
User currentUser = (User) session.getAttribute("loggedUser");

if (currentUser == null) {
	session.setAttribute("message", "You are not logged In! Please login first");
	response.sendRedirect("login.jsp");
	return;
}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eCart - CheckOut</title>
<%@include file="components/bootstrap.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp" %>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
				<div class="card-body">
					<div class="bg-info p-2"><h2 class="text-center">Your Cart Items</h2></div>
					<div class="cart-body"></div>
				</div>
				</div>
			
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="card-header p-2 mb-2">
							<h2 class="text-center">Your Address for Orders</h2>
						</div>
						<form class="row g-3">
							<div class="col-12">
								<label for="firstName" class="form-label">Your Name</label>
								<input type="text" 
									   class="form-control" 
									   id="firstName" 
									   name="firstName" 
									   placeholder="Enter First Name"
									   value="<%=user.getName() %>"
									   >
							</div>
							<div class="col-12">
								<label for="email" class="form-label">Email</label>
								<input type="email" 
									   class="form-control" 
									   id="email" 
									   name="email" 
									   placeholder="xyz@gmail.com"
									   value="<%=user.getEmail()%>">
							</div>
							<div class="col-12">
								<label for="mobNo" class="form-label">Mobile Number</label>
								<input type="number" 
									   class="form-control" 
									   id="mobNo" 
									   name="mobNo" 
									   placeholder="+91 7848393410"
									   value="<%=user.getMobileNo()%>">
							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Your Shipping Address</label> 
								<textarea class="form-control" 
										  rows="3" 
										  id="inputAddress"
										  name="inputAddress" 
										  placeholder="Enter Your address">
										  <%=user.getAddress() %>
								</textarea>
							</div>
							<div class="col-12">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="gridCheck">
									<label class="form-check-label" for="gridCheck"> Check me out </label>
								</div>
							</div>
							<div class="col-12 text-center">
								<button type="submit" class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="text-decoration-none"><button type="button" class="btn btn-success">Continue Shopping</button></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	<%@include file="components/commonModel.jsp" %>
<%@include file="components/footer.jsp" %>
</body>
</html>