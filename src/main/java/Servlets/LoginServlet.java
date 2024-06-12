package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.ConnectionPro;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String email= (String)request.getParameter("email");;
		String password= (String)request.getParameter("password");
		String cat="";
		
		try
		{    Connection con=ConnectionPro.getConnection();
			 String query = "select * from users where email='" + email + "' and password='"+password+"'"; 
	         PreparedStatement pt = con.prepareStatement(query); 
	         ResultSet rs= pt.executeQuery();
	         if(rs.getRow()<0) 
		        {
		        	
		        String errorMessage = "Not Registered User !!";
				HttpSession regSession = request.getSession();
				regSession.setAttribute("RegError", errorMessage);
				response.sendRedirect("index.jsp");
				}
		        else
		        {
		        	   while(rs.next())
					   {
						   
						 cat=rs.getString("user_type"); 
					 
						 
					   }
		        	   
		        	 
						   
						 
						   request.getSession().setAttribute("Category", cat);
					   
					 
		        	   response.sendRedirect("ViewEmployees.jsp"); 
		        }
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
