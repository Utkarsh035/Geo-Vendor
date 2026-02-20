package gv.vendor.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gv.beans.Vendor;
import gv.dao.VendorDao;

/**
 * Servlet implementation class VendorEditProfile
 */
@WebServlet("/VendorEditProfile")
public class VendorEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorEditProfile() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phoneNo = request.getParameter("phone");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		//to get identify logged-in user
		
		HttpSession hs=request.getSession(false);
		String email =(String)hs.getAttribute("sessionEmail");
		
		Vendor v=new Vendor();
		v.setName(name);
		v.setPhone(phoneNo);
		v.setAddress(address);
		v.setCity(city);
		v.setEmail(email);
		
		VendorDao dao=new VendorDao();
int status=dao.editProfile(v,email);
		
		if(status>0) {
			response.sendRedirect("/GeoVendor/vendor/vendor_home.jsp");
		}
		
	}

}
