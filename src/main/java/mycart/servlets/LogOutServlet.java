package mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import mycart.dao.UserDao;
import mycart.entities.User;
import mycart.helper.FactoryProvider;


public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session openSession = FactoryProvider.getFactory().openSession();
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		User dbUser = userDao.findUserByEmail(null);
		 request.getSession().setAttribute("loggedUser", dbUser);

		openSession.close();
		request.getSession().setAttribute("message", "Logout successfully");
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
