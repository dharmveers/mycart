
<%@page import="mycart.dao.ProductDao"%>
<%@page import="mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="mycart.dao.CategoryDao"%>
<%
User currentUser = (User) session.getAttribute("loggedUser");
if (currentUser != null && !currentUser.isAdmin()) {
	session.setAttribute("message", "You aren't authorised for this page");
	response.sendRedirect("index.jsp");
	return;
} else if (currentUser == null) {
	session.setAttribute("message", "User not logged IN!!");
	response.sendRedirect("login.jsp");
	return;
}
%>
<%
CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = dao.getCategory();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>eCart - Admin</title>
<%@include file="components/bootstrap.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	<div class="container py-4 admin">
	<%@include file="components/message.jsp" %>
		<div class="row">
			<div class="col-md-4 ">
				<div class="card bg-success">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 130px" 
								 class="img-fluid rounded-circle shadow-4-strong bg-white" 
								 alt="user_icon"
								 src="images/users.png">
						</div>
						<%
							UserDao uDao=new UserDao(FactoryProvider.getFactory());
						%>
						<h4><%=uDao.getAllUser().size() %></h4>
						<h3 class="text-white">Users</h3>

					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card bg-info text-white">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 130px" 
								 class="img-fluid rounded-circle shadow-4-strong bg-white" 
								 alt="user_icon"
								 src="images/categories.png">
						</div>
						<h4><%=list.size() %></h4>
						<h3 class="text-muted">Category</h3>
					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card bg-secondary">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 130px" 
								 class="img-fluid rounded-circle shadow-4-strong bg-white" 
								 alt="user_icon"
								 src="images/product.png">
						</div>
						<%
						ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
						%>
						<h4><%=pdao.getAllProduct().size() %></h4>
						<h3 class="text-white">Products</h3>
					</div>
				</div>
			</div>
		</div>
			<div class="row py-3">
				<div class="col-md-6">
					<div class="card bg-dark" data-bs-toggle="modal" data-bs-target="#addCotegories">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width: 130px" 
									 class="img-fluid rounded-circle shadow-4-strong bg-white" 
									 alt="user_icon"
									 src="images/add-to-cart.png">
							</div>
							<h1 class="text-white my-5">
							  Add Categories
							</h1>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" style="background-color: #ff33cc" data-bs-toggle="modal" data-bs-target="#addProduct">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width: 130px" 
									 class="img-fluid rounded-circle shadow-4-strong bg-white" 
									 alt="user_icon"
									 src="images/add-product.png">
							</div>
							<h1 class="text-white my-5">
							  Add Product
							</h1>
						</div>
					</div>
				</div>
				<!-- Model Cotegory-->
				<div class="modal" id="addCotegories" tabindex="-1" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header  bg-primary">
					        <h5 class="modal-title">Add Cotegory</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form action="ProductOperationServlet" method="post">
					        	<input type="hidden" name="operation" value="category">
					        	<div class="form-group pt-1">
					        		<label for="catTitle" class="form-label">Title</label>
					        		<input type="text" class="form-control" name="catTitle" id="catTitle" placeholder="Enter Title..">
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="catDesc" class="form-label">Description</label>
					        		<input type="text" class="form-control" name="catDesc" id="catDesc" placeholder="Enter desc..">
					        	</div>
					        	<div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button type="submit" class="btn btn-primary">Save</button>
							    </div>
					        </form>
					      </div>
					    </div>
					  </div>
				</div>
				<!-- Model -->
				<!-- model product -->
				<div class="modal" id="addProduct" tabindex="-1" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header  bg-primary">
					        <h5 class="modal-title">Add Product</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
					        	<input type="hidden" name="operation" value="product">
					        	<div class="form-group pt-1">
					        		<label for="prodName" class="form-label">Product Name</label>
					        		<input type="text" class="form-control" name="prodName" id="prodName" placeholder="Enter product name..">
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="Desc" class="form-label">Description</label>
					        		<textarea class="form-control" id="Desc" name="Desc" rows="3" placeholder="Enter description.."></textarea>
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="price" class="form-label">Price</label>
					        		<input type="text" class="form-control" name="price" id="price" placeholder="Enter price..">
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="discount" class="form-label">Discount</label>
					        		<input type="text" class="form-control" name="discount" id="discount" placeholder="Enter price..">
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="quantity" class="form-label">Quantity</label>
					        		<input type="text" class="form-control" name="quantity" id="quantity" placeholder="Enter price..">
					        	</div>

					        	<div class="form-group pt-1">
					        		<label for="category" class="form-label">Categories</label>
					        		<select class="form-select" name="cId">
					        		  <%for(Category c:list){%>
									  <option value="<%=c.getId()%>"><%=c.getName()%></option>
									  <%}%>
									</select>
					        	</div>
					        	<div class="form-group pt-1">
					        		<label for="image" class="form-label">Image</label>
					        		<input type="file" class="form-control" name="image" id="image">
					        	</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</form>
					      </div>
					    </div>
					  </div>
				</div>
				<!-- model product -->
			</div>
		</div>
	<%@include file="components/commonModel.jsp" %>
	<%@include file="components/footer.jsp" %>
</body>
</html>