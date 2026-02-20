package gv.dbutils;
import java.sql.*;
import java.util.*;
public class DbConnection {
	private static Connection con;
	private static ResourceBundle bundle;
	
	public static Connection openConnection()
	{
		try {
			bundle=ResourceBundle.getBundle("gv/dbutils/dbinfo");
			String userId=bundle.getString("db.userId");
			String userPass=bundle.getString("db.userPass");
			String url=bundle.getString("db.url");
			
//			System.out.println(url+userPass+userId);
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,userId,userPass);
			//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/geo_db","root","root");
		}
		catch(ClassNotFoundException|SQLException cse) {
			cse.printStackTrace();
			
		}
		return con;
	}
	/*
	 * public static void main(String[] args) { Connection c=openConnection();
	 * System.out.println(c); }
	 */
	 

}
