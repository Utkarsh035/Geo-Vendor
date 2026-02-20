package gv.user.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gv.beans.Business;
import gv.beans.Vendor;
import gv.dao.UserDao;

/**
 * Servlet implementation class ViewMap
 */
@WebServlet("/ViewMap")
public class ViewMap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		UserDao dao=new UserDao();
		
		ArrayList<Business>businessList=dao.viewAllBusiness();
		for(Business b:businessList)
		{
			
			System.out.println(b.getBusiness_name());
			System.out.println(b.getLocation_lat());
			
		}
		
		request.setAttribute("bData", businessList);
		RequestDispatcher rd=request.getRequestDispatcher("/user/view_map.jsp");
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
