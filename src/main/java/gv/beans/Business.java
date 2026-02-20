package gv.beans;

public class Business {
	private String email, business_category, business_name, description, location_lat, location_long, phone, address, gst_no,business_photo;

	private  String business_icon;

	public String getBusiness_icon() {
		return business_icon;
	}

	public void setBusiness_icon(String business_icon) {
		this.business_icon = business_icon;
	}

	public Business() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Business(String email, String business_category, String business_name, String description,
			String location_lat, String location_long, String phone, String address, String gst_no,String business_photo) {
		super();
		this.email = email;
		this.business_category = business_category;
		this.business_name = business_name;
		this.description = description;
		this.location_lat = location_lat;
		this.location_long = location_long;
		this.phone = phone;
		this.address = address;
		this.gst_no = gst_no;
		this.business_photo=business_photo;
	}


	public Business(String email, String business_category, String business_name, String description,
			 String phone, String address, String gst_no) {
		super();
		this.email = email;
		this.business_category = business_category;
		this.business_name = business_name;
		this.description = description;
        this.phone = phone;
		this.address = address;
		this.gst_no = gst_no;
	}
	
	
	public String getBusiness_photo() {
		return business_photo;
	}

	public void setBusiness_photo(String business_photo) {
		this.business_photo = business_photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBusiness_category() {
		return business_category;
	}

	public void setBusiness_category(String business_category) {
		this.business_category = business_category;
	}

	public String getBusiness_name() {
		return business_name;
	}

	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation_lat() {
		return location_lat;
	}

	public void setLocation_lat(String location_lat) {
		this.location_lat = location_lat;
	}

	public String getLocation_long() {
		return location_long;
	}

	public void setLocation_long(String location_long) {
		this.location_long = location_long;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGst_no() {
		return gst_no;
	}

	public void setGst_no(String gst_no) {
		this.gst_no = gst_no;
	}
    
}
