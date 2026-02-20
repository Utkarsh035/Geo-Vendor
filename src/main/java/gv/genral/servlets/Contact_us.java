package gv.genral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gv.beans.Contact;
import gv.dao.GuestDao;

/**
 * Servlet implementation class Contact_us
 */
@WebServlet("/Contact_us")
public class Contact_us extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Contact_us() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String qurey=request.getParameter("qurey");
		
		System.out.println(name+email+phone+qurey);
		
		java.util.Date d=new java.util.Date();
		System.out.println(d);//java date
		long dt=d.getTime();//
		java.sql.Date sqldate=new java.sql.Date(dt);//conversion of util date to sql date
		System.out.println("sql date:- "+sqldate);
		
		GuestDao dao=new GuestDao();
		
		
		Contact c= new Contact(name,email,phone,qurey,sqldate);//creating object of class contact
		
		   int status=dao.addConact(c);
		     
		
		if(status>0) {
		request.setAttribute("message", "Thank You for Contacting Us");
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/contact_us.jsp");
		rd.forward(request, response);
		}
		
		//servlets passes request to Doa class
		//small amount of data like id password no object requried but huge amount of data like registration details then we requried object
		
		
		
		
		//waiter->send data->chef->food cook use item->from inventory
		//return food to waiter->server it to customer
		
		//servlets->send data->doa class->process logic->database table->
		//provide response to servlets->show the response on wb
	}

}
