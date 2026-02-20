package gv.user.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import gv.beans.User;
import gv.dao.UserDao;

/**
 * Servlet implementation class UserEditProfile
 */
@WebServlet("/UserEditProfile")
@MultipartConfig
public class UserEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//
		 Part p=request.getPart("profile_pic");
		 String fileName=p.getSubmittedFileName();
		 long size=p.getSize();//in bytes
		 
		 System.out.println("File name:- "+fileName+" and size:- "+size);
		 ServletContext sc= getServletContext();// sc will give refernce of existing context
		 String serverPath=sc.getRealPath("");//return the path were website is hosted on server
		 System.out.println("path is "+serverPath);
		 String folderName="profileImages";
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
			 
			 
		
		String name = request.getParameter("name");
		String phoneNo = request.getParameter("phone");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		//to get identify logged-in user
		
		HttpSession hs=request.getSession(false);
		String email =(String)hs.getAttribute("sessionEmail");
		
		User u=new User();//creating bean class object
		u.setName(name);
		u.setPhone(phoneNo);
		u.setCity(city);
		u.setAddress(address);
		u.setEmail(email);
		u.setProfile_pic(dbPath);
		
		UserDao dao=new UserDao();
		int status=dao.editProfile(u,email);
		
		if(status>0) {
			response.sendRedirect("/GeoVendor/user/user_home.jsp");
		}
		
		
	}

}
