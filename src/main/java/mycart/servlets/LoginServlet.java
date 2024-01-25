package mycart.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import jakarta.persistence.Parameter;
import mycart.dao.UserDao;
import mycart.entities.User;
import mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response,request.getSession());
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		try {
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			
			 Session openSession = FactoryProvider.getFactory().openSession();
			 //fetching details from db
			 UserDao userDao = new UserDao(FactoryProvider.getFactory());
			 User dbUser = userDao.findUserByEmail(email);
			 
			 if(dbUser.getEmail().equals(email) && dbUser.getPassword().equals(pass)) {
				 session.setAttribute("loggedUser", dbUser);
				 openSession.close();
				 if(dbUser.isAdmin()) {
					 response.sendRedirect("admin.jsp");
					 return;
				 }
				 response.sendRedirect("index.jsp");
				 return;
			 }
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("login.jsp");
	}

}
