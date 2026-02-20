package gv.beans;

public class Vendor {
	 private String email, name, password, phone, city, address, profile_pic;
	 private Vendor_feedback vf;

	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vendor(String email, String name, String password, String phone, String city, String address,
			String profile_pic) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.profile_pic = profile_pic;
	}
	

	public Vendor_feedback getVf() {
		return vf;
	}

	public void setVf(Vendor_feedback vf) {
		this.vf = vf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}
	 

}
