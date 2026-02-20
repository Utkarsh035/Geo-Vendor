package gv.vendor.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gv.beans.Business;
import gv.dao.VendorDao;

/**
 * Servlet implementation class Add_location
 */
@WebServlet("/Add_location")
public class Add_location extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_location() {
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
		String location_long=request.getParameter("long");
		String loaction_lat=request.getParameter("lat");
		
		System.out.println(loaction_lat+location_long);
		Business b=new Business();
		b.setLocation_lat(loaction_lat);
		b.setLocation_long(location_long);
		HttpSession hs=request.getSession(false);
		String email =(String)hs.getAttribute("sessionEmail");
		VendorDao dao=new VendorDao();
		int status=dao.addLoaction(b, email);
		
		if(status>0) {
			request.setAttribute("mess","Business Registered Scussefully!");
			RequestDispatcher rd=request.getRequestDispatcher("/vendor/add_location.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
