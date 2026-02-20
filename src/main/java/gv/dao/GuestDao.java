package gv.dao;

import gv.beans.Contact;
import gv.beans.Feedback;
import gv.beans.User;
import gv.dbutils.DbConnection;
import java.sql.*;
import java.util.ArrayList;

public class GuestDao {
	private Connection con;//it will hold the refernce of connected database
	//------method------
	
	public ArrayList<User> allFeedbacks(){
		con=DbConnection.openConnection();
		//id, name, emaill, rating, remark, date
		//email, password, name, phone, city, address, profile_pic, date
		String sql = "SELECT f.name, f.rating, f.remark, u.profile_pic FROM feedback f, user u WHERE u.email = f.emaill AND f.rating = 'fas fa-star,fas fa-star,fas fa-star,fas fa-star,fas fa-star' ORDER BY f.date DESC LIMIT 5";

		//
		 User u=null;
		 Feedback feed=null;
		 
		 PreparedStatement ps=null;
		 ResultSet rs=null;
		 ArrayList<User>userList=new ArrayList<>();
		 try {
			 ps=con.prepareStatement(sql);
			 rs=ps.executeQuery();
			 while(rs.next()) 
			 {
				String uName=rs.getString("name");
				String uRating=rs.getString("rating");
				String uRemark=rs.getString("remark");
				String uPic=rs.getString("profile_pic");
				//creating object of feedback beans
				feed=new Feedback();
				feed.setName(uName);
				feed.setRating(uRating);
				feed.setRemark(uRemark);
				//creating object of user beans
				u=new User();
				u.setProfile_pic(uPic);
				u.setFd(feed);//HAS-A Realtionship concept
				//adding user class object in arraylist
				userList.add(u);
			 }
			 
		 }
		 catch(SQLException se) {
			 se.printStackTrace();
			 //finally{}
		 }
		 return userList;
	}

	public int addConact(Contact c) {
		
		con=DbConnection.openConnection();//connection established with geo_db
		int status=0;
		PreparedStatement ps=null;
		
		try {
			String strInsert="insert into contact(name, email, phone, qurey, date)values(?,?,?,?,?)";
			
			ps=con.prepareStatement(strInsert);
			ps.setString(1,c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getQurey());
			ps.setDate(5,c.getDate());
			
			System.out.println(ps);
			status=ps.executeUpdate();
			System.out.println("qurey status is:- "+status);
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
    
}
