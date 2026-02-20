package gv.vendor.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import gv.beans.Vendor;

import gv.dao.VendorDao;


@WebServlet("/Vendor_Registration")
@MultipartConfig
public class Vendor_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Vendor_Registration() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String name=request.getParameter("name");
		 String phone=request.getParameter("phone");
		 String email=request.getParameter("email");
		 String pass=request.getParameter("password");
		 String city=request.getParameter("city");
		 String address=request.getParameter("address");
		  
		 System.out.println(name+phone+address+city+email+pass);
		 
		 //fetching uploaded file data
		 Part p=request.getPart("profilePic");
		 String fileName=p.getSubmittedFileName();
		 long size=p.getSize();//in bytes
		 
		 System.out.println("File name:- "+fileName+" and size:- "+size);
		 ServletContext sc= getServletContext();// sc will give refernce of existing context
		 String serverPath=sc.getRealPath("");//return the path were website is hosted on server
		 System.out.println("path is "+serverPath);
		 String folderName="vendorImages";
		 String fullPath=serverPath+folderName;
		 
		 
		 File f= new File(fullPath);
		 String picPath="";
		 String dbPath="";//stores the img path for database table
		 if(!f.exists()) {
			 f.mkdir();//for creating directory(folder) on the path
			 System.out.println("Directory created");
		 }
		 
			 picPath=fullPath+File.separator+fileName;
			 dbPath=folderName+File.separator+fileName;
			 p.write(picPath);
			 
			 //date convertion
			 java.util.Date d=new java.util.Date();
				System.out.println(d);//java date
				long dt=d.getTime();//
				java.sql.Date sqldate=new java.sql.Date(dt);//conversion of util date to sql date
				System.out.println("sql date:- "+sqldate);
				
				
			 //creating bean class object
			Vendor v = new Vendor(email, name, pass, phone, city, address, dbPath);
			 VendorDao dao=new VendorDao();//creating object of dao class
			 int status=dao.vendorRegistration(v);//method inside userdao class
			 System.out.println(status);
			 if(status>0);
			 {
				 response.sendRedirect("/GeoVendor/vendor/vendor_login.jsp");
			 }
	}

}
