package mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart.dao.UserDao;
import mycart.entities.User;
import mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("User saved successfully..");
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobileNo = request.getParameter("mobileNo");
			String address = request.getParameter("address");

			User user = new User(name, email, password, mobileNo, address, "default.jpg",false);

			SessionFactory factory = FactoryProvider.getFactory();
			
			//checking user details before submitting
			UserDao userDao = new UserDao(factory);
			User userByEmail = userDao.findUserByEmail(email);
			if(userByEmail.getEmail()!=null) {
				Session session = factory.openSession();
				Transaction txn = session.beginTransaction();
				session.save(user);
				txn.commit();
				session.close();
				request.getSession().setAttribute("message", "User save successfully..");
			}else {
				request.getSession().setAttribute("error", "User already exists!!");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		response.sendRedirect("register.jsp");
	}

}
