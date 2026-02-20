package gv.beans;

import java.sql.Date;

public class Vendor_feedback {
	private int id;
    private String name, emaill, rating, remark;
    private Date date;
    
    
	public Vendor_feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vendor_feedback(String name, String emaill, String rating, String remark, Date date) {
		super();
		this.name = name;
		this.emaill = emaill;
		this.rating = rating;
		this.remark = remark;
		this.date = date;
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
	public String getEmaill() {
		return emaill;
	}
	public void setEmaill(String emaill) {
		this.emaill = emaill;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

}
