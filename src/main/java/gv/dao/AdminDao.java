package gv.dao;

import java.sql.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import gv.beans.Contact;
import gv.beans.Feedback;
import gv.beans.User;
import gv.beans.Vendor;
import gv.beans.Vendor_feedback;
import gv.dbutils.DbConnection;

public class AdminDao {
	
	//allcontact code here
private Connection con;


//MOnthly contct code

	public LinkedHashMap<String, Integer> getMonthlyContactCounts() {
	    LinkedHashMap<String, Integer> monthYearMap = new LinkedHashMap<>();
	    try (Connection con = DbConnection.openConnection()) {//try with resources
	        String query = "SELECT date_format(date, '%Y-%m') AS ym, COUNT(*) AS contact_count FROM contact GROUP BY ym ORDER BY ym;";
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            monthYearMap.put(rs.getString("ym"), rs.getInt("contact_count"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return monthYearMap;
	}
	/////////////////////////////////////////////////////////////////////////
public HashMap<String,Integer>count_rating()
	
	{

		HashMap<String,Integer>	count_map=new HashMap<String, Integer>();
try {
con=DbConnection.openConnection();
String query = "SELECT COUNT(CASE WHEN rating = 'fas fa-star,fas fa-star,fas fa-star,fas fa-star,fas fa-star' THEN 1 END) AS five_star,"
		+ "COUNT(CASE WHEN rating = 'fas fa-star,fas fa-star,fas fa-star,fas fa-star' THEN 1 END) AS four_star,"
		+ "COUNT(CASE WHEN rating = 'fas fa-star,fas fa-star,fas fa-star' THEN 1 END) AS three_star,"
		+ "COUNT(CASE WHEN rating = 'fas fa-star,fas fa-star' THEN 1 END) AS two_star,"
		+ "COUNT(CASE WHEN rating = 'fas fa-star' THEN 1 END) AS one_star from feedback";
	
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = ps.executeQuery();
if (rs.next()) {
    // Putting counts in the HashMap with appropriate keys
    count_map.put("five_star", rs.getInt("five_star"));
    count_map.put("four_star", rs.getInt("four_star"));
    count_map.put("three_star", rs.getInt("three_star"));
    count_map.put("two_star", rs.getInt("two_star"));
    count_map.put("one_star", rs.getInt("one_star"));
}

System.out.println(count_map);
con.close();
} catch (Exception e) {
e.printStackTrace();
}

return count_map;

	}



private ArrayList<Feedback> feedbacklist;
public 	ArrayList<Feedback>	viewAllFeedback()
{
	
	feedbacklist=new ArrayList<Feedback>();
	
	Feedback fb=null;;

	
	String sql="select * from feedback";
	con=DbConnection.openConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	try {
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
			while(rs.next())
		{
            //id, name, emaill, rating, remark, date
			String name=rs.getString("name");
			String email=rs.getString("emaill");
			String remark=rs.getString("remark");
			String rating=rs.getString("rating");
			Date d=rs.getDate("date");
			int id=rs.getInt("id");
			//name, emaill, rating, remark;
			fb=new Feedback(name, email, rating, remark, d);
			fb.setId(id);
			feedbacklist.add(fb);
		}
		
	}
	catch(SQLException se)
	{
		se.printStackTrace();
	}
	return feedbacklist;
	
}

//vendors feedback
private ArrayList<Vendor_feedback> vfeedbacklist;
public 	ArrayList<Vendor_feedback>viewvendorFeedback()
{
	
	vfeedbacklist=new ArrayList<Vendor_feedback>();
	
	Vendor_feedback vf=null;;

	
	String sql="select * from vendor_feedback";
	con=DbConnection.openConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	try {
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
			while(rs.next())
		{
            //id, name, emaill, rating, remark, date
			String name=rs.getString("name");
			String email=rs.getString("email");
			String remark=rs.getString("remark");
			String rating=rs.getString("rating");
			Date d=rs.getDate("date");
			int id=rs.getInt("id");
			//name, emaill, rating, remark;
			vf=new Vendor_feedback(name, email, rating, remark, d);
			vf.setId(id);
			vfeedbacklist.add(vf);
		}
		
	}
	catch(SQLException se)
	{
		se.printStackTrace();
	}
	return vfeedbacklist;
	
}


	
	private ArrayList<Contact> contactList;
	public 	ArrayList<Contact>	viewAllContacts()
	{
		
		contactList=new ArrayList<Contact>();
		
		Contact c=null;
	
		
		String sql="select * from contact";
		con=DbConnection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
				while(rs.next())
			{		
			  //id, name, email, phone, qurey, date		
				String name=rs.getString("name");
				String email=rs.getString("email");
				String question=rs.getString("qurey");
				String phone=rs.getString("phone");
				Date d=rs.getDate("date");
				int id=rs.getInt("id");
				c=new Contact(name, email, phone, question, d);
				c.setId(id);
				contactList.add(c);
				
				//String name=rs.getString("name");
			}
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return contactList;
		
	}
	//for user
	private ArrayList<User> userList;
	public 	ArrayList<User>	viewAllUser()
	{
		
		userList=new ArrayList<User>();
		String sql="select * from user";
		con=DbConnection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
				while(rs.next())
			{		
					User u=new User();
			  //email, password, name, phone, city, address, profile_pic, date-table feilds
				String email=rs.getString("email");
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String address=rs.getString("address");
				String pic=rs.getString("profile_pic");
				Date d=rs.getDate("date");
				u.setEmail(email);
				u.setName(name);
				u.setPhone(phone);
				u.setAddress(address);
				u.setProfile_pic(pic);
				u.setDate(d);
				userList.add(u);
				
				//String name=rs.getString("name");
			}
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return userList;
		
	}
	
	//for vendor
	private ArrayList<Vendor> vendorList;
	public 	ArrayList<Vendor>viewAllVendor()
	{
		
		vendorList=new ArrayList<Vendor>();
		String sql="select * from vendor";
		con=DbConnection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
				while(rs.next())
			{		
				Vendor v=new Vendor();
			  //email, name, password, phone, city, address, profile_pic
				String email=rs.getString("email");
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String address=rs.getString("address");
				String pic=rs.getString("profile_pic");
				v.setEmail(email);
				v.setName(name);
				v.setPhone(phone);
				v.setAddress(address);
				v.setProfile_pic(pic);
				
				vendorList.add(v);
				
				//String name=rs.getString("name");
			}
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return vendorList;
		
	}
	
	
	

	public boolean login(String email, String pass) 
	{ 
		if(email.equals("admin@gmail.com")&& pass.equals("admin"))
		return true;
		
		return false;
		
	}




	public int deleteContact(String[]idArray) {
	 int status=0;
	 con=DbConnection.openConnection();
	 PreparedStatement ps=null;
	 String delQuery="delete from contact where id=?";
	 try {
		 con.setAutoCommit(false);
		 ps=con.prepareStatement(delQuery);
		 for(int i=0;i<idArray.length;i++) {
			 ps.setInt(1, Integer.parseInt(idArray[i]));
			 ps.addBatch();
		 }
		 int flag=0;
		 int[] deleStatus=ps.executeBatch();
		 for(int i=0;i<deleStatus.length;i++) {
			 if(deleStatus[i]<0) {
				 flag=1;
				 break;
			 }
		 }
		 if(flag==0) {
			 status=1;
			 con.setAutoCommit(true);
			 return status;
			 
		 }
		 
	 }
	 catch(SQLException se)
		{
			se.printStackTrace();
		}
		return status;
	}

}
