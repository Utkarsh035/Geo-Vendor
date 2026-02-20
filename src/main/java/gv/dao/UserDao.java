package gv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gv.beans.Business;
import gv.beans.Feedback;
import gv.beans.User;
import gv.beans.Vendor;
import gv.dbutils.DbConnection;

public class UserDao {
	private Connection con;
	
	//<--------method to check email------------------>
	public boolean checkEmail(String email) {
		String strsql="select emaill from feedback where emaill=?";
		con=DbConnection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1, email);
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return false;
	}
    //-------------------feedback----------------------
	public int addFeedback(Feedback fd) {
		con=DbConnection.openConnection();//connection established with geo_db
		int status=0;
		PreparedStatement ps=null;
		
		try {
			//check for email existence
			String query="";
			if(checkEmail(fd.getEmaill())==false) {
			query="insert into feedback( name, emaill, rating, remark, date)values(?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1,fd.getName());
			ps.setString(2, fd.getEmaill());
			ps.setString(3, fd.getRating());
			ps.setString(4, fd.getRemark());
			ps.setDate(5,fd.getDate());
			System.out.println(ps);
			status=ps.executeUpdate();
			System.out.println("qurey status is:- "+status);
			}
			else {
				
				query="update feedback set rating=?, remark=?, date=? where emaill=?";
				con=DbConnection.openConnection();
				ps=con.prepareStatement(query);
				ps.setString(1, fd.getRating());
				ps.setString(2, fd.getRemark());
				ps.setDate(3,fd.getDate());
				ps.setString(4,fd.getEmaill());
				
				System.out.println(ps);
				status=ps.executeUpdate();
				System.out.println("qurey status is:- "+status);
			}
			
			//String strInsert="insert into feedback( name, emaill, rating, remark, date)values(?,?,?,?,?)";
			
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return status;
	}
	//user registration
public int userRegistration(User u) {
	int status=0;
	con=DbConnection.openConnection();
	
	String strInsert="insert into user(email, password, name, phone, city, address, profile_pic, date)values(?,?,?,?,?,?,?,?)";
	PreparedStatement ps=null;
	try {
		ps=con.prepareStatement(strInsert);
		ps.setString(1,u.getEmail());
		ps.setString(2,u.getPassword());
		ps.setString(3,u.getName());
		ps.setString(4,u.getPhone());
		ps.setString(5,u.getCity());
		ps.setString(6,u.getAddress());
		ps.setString(7,u.getProfile_pic());
		ps.setDate(8,u.getDate());
		System.out.println(ps);
		status=ps.executeUpdate();
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	
	finally {
		try {
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	return status;
}
public boolean checkLogin(String email, String pass) {
    con=DbConnection.openConnection();
    PreparedStatement ps=null;
    ResultSet rs=null;
    String selectqurey="select *  from user where email=? and password=?";
    
    try {
    	ps=con.prepareStatement(selectqurey);
    	ps.setString(1, email);
    	ps.setString(2,pass);
    	System.out.println(ps);
    	rs=ps.executeQuery();
    	
    	if(rs.next()==true) //if shows that email and password exits
    	{
    		return true;
    	}
    	
    	
    }
    catch(SQLException se){
    	se.printStackTrace();
    	
    }
    finally {
		try {
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	return false;
}
//view profile method
public User userProfile(String emailId) {
	con=DbConnection.openConnection();
	String selectQuery="select * from user where email=?";
	PreparedStatement ps=null;
	ResultSet rs=null;
	User u=null;
	
	try {
		ps=con.prepareStatement(selectQuery);
		ps.setString(1,emailId);
		System.out.println(ps);
		rs=ps.executeQuery();
		rs.next();//place the cursor at that row
		//email, password, name, phone, city, address, profile_pic, date
		String uName=rs.getString("name");
		String uPhone=rs.getString("phone");
		String uCity=rs.getString("city");
		String uAddress=rs.getString("address");
		String uPic=rs.getString("profile_pic");
		String uPassword=rs.getString("password");
		u=new User();
		
		u.setEmail(emailId);
		u.setName(uName);
		u.setPhone(uPhone);
		u.setAddress(uAddress);
		u.setCity(uCity);
		u.setProfile_pic(uPic);
		u.setPassword(uPassword);
		
		
	}
	catch(SQLException se) {
		se.printStackTrace();
		
	}
	finally {
		try {
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	return u;
	
}
public int editProfile(User u, String email) {
	int status=0;
	 con=DbConnection.openConnection();
	 PreparedStatement ps=null;
	 try {
		 //email, password, name, phone, city, address, profile_pic, date
		 String updateQuery="update user set phone=?,name=?,city=?,address=?,profile_pic=? where email=? ";
		 ps=con.prepareStatement(updateQuery);
		 ps.setString(1,u.getPhone());
		 ps.setString(2,u.getName());
		 ps.setString(3,u.getCity());
		 ps.setString(4,u.getAddress());
		 ps.setString(5,u.getProfile_pic());
		 ps.setString(6,email);
		 System.out.println(ps);
		 
		 status=ps.executeUpdate();
		 
	 }
	 catch(SQLException se) {
		 se.printStackTrace();
	 }
	
	return status;
}
private ArrayList<Business> businessList;
public ArrayList<Business> viewAllBusiness()
{
	
	businessList=new ArrayList<Business>();
	String sql="select * from business";
	con=DbConnection.openConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	try {
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
			while(rs.next())
		{		
			Business b=null;
		  //email, business_category, business_name, description, location_lat, location_long, phone, address, gst_no, business_icon
			String bemail=rs.getString("email");
			String bname=rs.getString("business_name");
			String bcategory=rs.getString("business_category");
			String bdescription=rs.getString("description");
			String blong=rs.getString("location_long");
			String blat=rs.getString("location_lat");
			String bphone=rs.getString("phone");
			String baddress=rs.getString("address");
			String bgst=rs.getString("gst_no");
			String bicon=rs.getString("business_icon");
			String bphoto=rs.getString("business_photo");
			
			b=new Business(bemail, bcategory, bname, bdescription, blat, blong, bphone, baddress, bgst,bphoto);
			b.setBusiness_icon(bicon);
			businessList.add(b);
			
			//String name=rs.getString("name");
		}
		
	}
	catch(SQLException se)
	{
		se.printStackTrace();
	}
	return businessList;
	
}
public boolean checkUserEmail(String em) {
	con=DbConnection.openConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	
	String sql="select email from user where email=?";
	try {
		ps=con.prepareStatement(sql);
		ps.setString(1, em);
		rs=ps.executeQuery();
		if(rs.next()) {
			return true;
		}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	
	
	
	return false;
	
}
}

