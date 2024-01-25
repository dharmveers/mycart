package mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mycart.entities.Product;

public class ProductDao {
		private SessionFactory factory;

		public ProductDao(SessionFactory factory) {
			this.factory = factory;
		}
		
		public void addProduct(Product product) {
			try {
				Session session = factory.openSession();
				Transaction txn = session.beginTransaction();
				session.save(product);
				txn.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public List<Product> getAllProduct(){
			Session session = this.factory.openSession();
			List<Product> products=session.createQuery("from Product").list();
			return products;
		}
		
		public List<Product> getProductById(Integer id){
			Session session = this.factory.openSession();
			List<Product> products=session.createQuery("from Product as p where p.category.id=:pId").setParameter("pId", id).list();
			return products;
		}
}
