package mycart.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {
			@Id
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private Integer id;
			private String name;
			private String email;
			private String password;
			private String mobileNo;
			private String address;
			private String image;
			private boolean isAdmin;
			
			public User() {
			}

			public User(Integer id, String name, String email, String password, String mobileNo, String address,
					String image,boolean isAdmin) {
				this.id = id;
				this.name = name;
				this.email = email;
				this.password = password;
				this.mobileNo = mobileNo;
				this.address = address;
				this.image = image;
				this.isAdmin=isAdmin;
			}

			public User(String name, String email, String password, String mobileNo, String address, String image,boolean isAdmin) {
				this.name = name;
				this.email = email;
				this.password = password;
				this.mobileNo = mobileNo;
				this.address = address;
				this.image = image;
				this.isAdmin=isAdmin;
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

			public String getEmail() {
				return email;
			}

			public void setEmail(String email) {
				this.email = email;
			}

			public String getPassword() {
				return password;
			}

			public void setPassword(String password) {
				this.password = password;
			}

			public String getMobileNo() {
				return mobileNo;
			}

			public void setMobileNo(String mobileNo) {
				this.mobileNo = mobileNo;
			}

			public String getAddress() {
				return address;
			}

			public void setAddress(String address) {
				this.address = address;
			}

			public String getImage() {
				return image;
			}

			public void setImage(String image) {
				this.image = image;
			}

			public boolean isAdmin() {
				return isAdmin;
			}

			public void setAdmin(boolean isAdmin) {
				this.isAdmin = isAdmin;
			}

}
