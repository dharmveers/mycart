package mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import mycart.dao.CategoryDao;
import mycart.dao.ProductDao;
import mycart.entities.Category;
import mycart.entities.Product;
import mycart.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			String op = request.getParameter("operation");
			if (op.equals("category")) {
				// save category
				String title = request.getParameter("catTitle");
				String desc = request.getParameter("catDesc");
				Category category = new Category(title, desc);
				SessionFactory factory = FactoryProvider.getFactory();
				new CategoryDao(factory).addCategory(category);
				session.setAttribute("message", "Category added successfully..");
				response.sendRedirect("admin.jsp");
			} else if (op.equalsIgnoreCase("product")) {
				// save product
				String name = request.getParameter("prodName");
				String desc = request.getParameter("Desc");
				double price = Double.parseDouble(request.getParameter("price"));
				Integer discount = Integer.parseInt(request.getParameter("discount"));
				Integer qty = Integer.parseInt(request.getParameter("quantity"));
				Integer cId = Integer.parseInt(request.getParameter("cId"));
				CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
				Category category = dao.getCategoryById(cId);
				String image = request.getPart("image").getSubmittedFileName();
				Product prod = new Product(name, desc, image, price, discount, qty, category);
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				productDao.addProduct(prod);
				// image uploads
				String realPath = request.getRealPath("images")+File.separator+"products"+File.separator+image;
				FileOutputStream fos=new FileOutputStream(realPath);
				InputStream is=request.getPart("image").getInputStream();
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				is.close();
				fos.close();
				
				session.setAttribute("message", "Product added successfully.");
				response.sendRedirect("admin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
