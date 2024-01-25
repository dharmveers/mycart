package mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart.entities.Category;

public class CategoryDao {
		private SessionFactory factory;

		public CategoryDao(SessionFactory factory) {
			this.factory = factory;
		}
		
		@SuppressWarnings("deprecation")
		public void addCategory(Category category) {
			try {
				Session session = factory.openSession();
				Transaction txn = session.beginTransaction();
				session.save(category);
				txn.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public List<Category> getCategory() {
			Session session = factory.openSession();
			List<Category> category=session.createQuery("from Category").list();
			session.close();
			return category;
		}

		public Category getCategoryById(Integer cId) {
			Session session = factory.openSession();
			Category category = session.get(Category.class, cId);
			return category;
		}
		
}
