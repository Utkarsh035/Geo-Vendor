package gv.beans;

import java.sql.Date;

public class Contact {
	private int id;
	private String name,email,phone,qurey;
	private Date date;
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Contact( String name, String email, String phone, String qurey,Date date) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.qurey = qurey;
		this.date=date;	
		}
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQurey() {
		return qurey;
	}
	public void setQurey(String qurey) {
		this.qurey = qurey;
	}

}
