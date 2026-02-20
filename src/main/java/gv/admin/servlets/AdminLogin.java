package gv.admin.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gv.dao.AdminDao;
import gv.utilities.CustomMessages;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
	String pass =request.getParameter("password");
	
	AdminDao ad= new AdminDao();
	 boolean status=ad.login(email,pass);
	 
	 if(status==true) {
			HttpSession hs=request.getSession();//it will create session
			System.out.println("Session id"+hs.getId());//it will return session id
			hs.setAttribute("sessionEmail", email);//binding values in session scope
			hs.setAttribute("role","admin");
			
			response.sendRedirect("/GeoVendor/admin/admin_home.jsp");
		}
		else {
			request.setAttribute("message",CustomMessages.LOGIN_ERROR);
			RequestDispatcher rd=request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);

		}
	 }
	}


