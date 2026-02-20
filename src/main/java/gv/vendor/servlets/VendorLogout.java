package gv.vendor.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gv.utilities.CustomMessages;

/**
 * Servlet implementation class VendorLogout
 */
@WebServlet("/VendorLogout")
public class VendorLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);//it will give referece of existing session
		System.out.println("old session"+hs.getId());
		hs.removeAttribute("sessionEmail");
		hs.removeAttribute("role");
		hs.invalidate();//to destory session
		
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
		
		HttpSession newSession=request.getSession(true);
		newSession.setAttribute("logout_msg",CustomMessages.LOGOUT_MSG);
		response.sendRedirect("/GeoVendor/vendor/vendor_login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
