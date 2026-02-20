package gv.vendor.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gv.dao.UserDao;
import gv.dao.VendorDao;
import gv.utilities.CustomMessages;

/**
 * Servlet implementation class VendorLogin
 */
@WebServlet("/VendorLogin")
public class VendorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLogin() {
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
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		System.out.println(email+pass);
		
		 VendorDao dao = new VendorDao();
		boolean status =dao.checkLogin(email,pass);
		
		if(status==true) {
			HttpSession hs=request.getSession();//it will create session
			System.out.println("Session id"+hs.getId());//it will return session id
			hs.setAttribute("sessionEmail", email);//binding values in session scope
			hs.setAttribute("role","Vendor");
			
			response.sendRedirect("/GeoVendor/vendor/vendor_home.jsp");
		}
		else {
			request.setAttribute("message",CustomMessages.LOGIN_ERROR);
			RequestDispatcher rd=request.getRequestDispatcher("/vendor/vendor_login.jsp");
			rd.forward(request, response);

		}
	}

}
