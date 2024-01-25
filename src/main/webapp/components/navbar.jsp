
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="mycart.helper.FactoryProvider"%>
<%@page import="mycart.dao.UserDao"%>
<%@page import="mycart.entities.User"%>
<%
User user=(User)session.getAttribute("loggedUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">MyCart</a>
			<button class="navbar-toggler" 
					type="button"
					data-bs-toggle="collapse" 
					data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" 
					aria-expanded="false"
					aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" href="index.jsp"> Home </a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="about.jsp"> About </a>
					</li>
					<li class="nav-item dropdown">
							<a	class="nav-link dropdown-toggle" 
								href="#" id="navbarDropdown"
								role="button" 
								data-bs-toggle="dropdown" 
								aria-expanded="false">
									Category 
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else here</a></li>
							</ul>
					</li>

				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link"
							aria-current="page" 
							href="#"
							data-bs-toggle="modal" 
							data-bs-target="#cart"
							>
							<i class="fa-solid fa-cart-plus text-white" style="font-size: 20px;"></i><span class="cart-items">(0)</span>
						</a>
					</li>
					<%if(user!=null){%>
					<li class="nav-item">
						<a class="nav-link"
							aria-current="page"
							href="<%=user.isAdmin()?"admin.jsp":"index.jsp" %>" >
							<%=user.getName() %>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link"
						   aria-current="page"
						   href="LogOutServlet" 
						   >
						   Logout
						 </a>
					</li>
					
					<% }else{%>
					
					<li class="nav-item">
						<a class="nav-link"
							aria-current="page" 
							href="login.jsp">
							Login
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link"
						   aria-current="page" 
						   href="register.jsp">
						   SignUp
						 </a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
</nav>