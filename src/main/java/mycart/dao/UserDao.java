package mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart.entities.User;

public class UserDao {
		private SessionFactory factory;

		public UserDao(SessionFactory factory) {
			this.factory = factory;
		}
		
		@SuppressWarnings("deprecation")
		public User findUserByEmail(String email) {
			
			Session session = factory.openSession();
			Transaction txn = session.beginTransaction();
			String hql="from User where email=: e";
			User user=(User)session.createQuery(hql).setParameter("e", email).uniqueResult();
			txn.commit();
			session.close();
			return user;
		}
		public List<User> getAllUser(){
			Session session = this.factory.openSession();
			List<User> users=session.createQuery("from User").list();
			return users;
		}
}
