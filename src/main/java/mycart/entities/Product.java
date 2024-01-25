package mycart.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
public class Product {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer id;
		private String name;
		private String description;
		private String image;
		private double price;
		private Integer descount;
		private Integer qty;
		@ManyToOne
		private Category category;
		public Product() {
			super();
		}

		public Product(Integer id, String name, String description, String image, double price, Integer descount,
				Integer qty,Category category) {
			this.id = id;
			this.name = name;
			this.description = description;
			this.image = image;
			this.price = price;
			this.descount = descount;
			this.qty = qty;
			this.category=category;
		}
		
		public Product(String name, String description, String image, double price, Integer descount,
				Integer qty,Category category) {
			this.name = name;
			this.description = description;
			this.image = image;
			this.price = price;
			this.descount = descount;
			this.qty = qty;
			this.category=category;
		}

		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public Integer getDescount() {
			return descount;
		}
		public void setDescount(Integer descount) {
			this.descount = descount;
		}
		public Integer getQty() {
			return qty;
		}
		public void setQty(Integer qty) {
			this.qty = qty;
		}
		public Category getCategory() {
			return category;
		}
		public void setCategory(Category category) {
			this.category = category;
		}
		
		public double getSellingPrice() {
			double off=(this.getDescount()/100.0)*(this.getPrice());
			return this.price-off;
		}
}
