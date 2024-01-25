<%@page import="mycart.helper.Helper"%>
<%@page import="mycart.entities.Category"%>
<%@page import="mycart.dao.CategoryDao"%>
<%@page import="mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="mycart.dao.ProductDao"%>
<%@page import="mycart.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ecart - Home</title>
<%@include file="components/bootstrap.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	<%@include file="components/message.jsp" %>
	
	<div class="container-fluid mt-2">
				<%
					ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
					CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
					List<Category> categories=cDao.getCategory();
					List<Product> pList=pDao.getAllProduct();
					String cat=request.getParameter("category");
					if(cat!=null && cat.trim().equals("all")){
						pList=pDao.getAllProduct();
					}else if(cat!=null){
							Integer id=Integer.parseInt(cat);
							pList=pDao.getProductById(id);
					}
				%>
		<div class="row">
			<div class="col-md-2">
				<div class="list-group mt-2">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"
						aria-current="true"> All Categories </a>
					<%
					for (Category category : categories) {
					%>
					<a href="index.jsp?category=<%=category.getId()%>" class="list-group-item list-group-item-action"><%=category.getName()%></a>
					<%
					}
					%>

				</div>
			</div>
			<div class="col-md-10">
				<div class="card-group">
					<div class="row">
						<%for(Product product:pList){ %>
							<div class="col-md-4 off-set-2">
								<div class="card m-1">
									<div class="container text-center">
										<img class="card-img-top p-1" alt="img"
											 style="max-height: 250px;max-width: 100%;width: auto;"
											src="images/products/<%=product.getImage()%>">
									</div>
									<div class="card-body">
										<h5 class="card-title"><%=Helper.get10Words(product.getName())%></h5>
										<p class="card-text"><%=Helper.get10Words(product.getDescription())%></p>
										<p class="card-text">₹ <%=product.getSellingPrice() %>/- 
										<small class="text-muted">
											<span class="discount-lbl"><%=product.getPrice() %></span>
										</small>
										<small class="text-success"><%=product.getDescount() %>% off</small>
										</p>
									<div class="card-footer">
										<button type="button" class="btn btn-warning w-100" onclick="addToCart(<%=product.getId() %>,'<%=product.getName()%>',<%=product.getSellingPrice() %>)" ><i class="fa-solid fa-cart-plus"></i>ADD TO CART</button>
										<button type="button" class="btn w-100 btn-buy mt-1" style="background-color: #fb641b;" onclick="addToCart(<%=product.getId() %>,'<%=product.getName()%>',<%=product.getSellingPrice() %>)" ><i class="fa-solid fa-bag-shopping"></i>BUY NOW</button>
									</div>
								</div>
								</div>
							</div>
							<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/commonModel.jsp" %>
	<%@include file="components/footer.jsp" %>
</body>
</html>