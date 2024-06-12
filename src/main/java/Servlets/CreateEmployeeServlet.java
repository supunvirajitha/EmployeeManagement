package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionPro;

/**
 * Servlet implementation class CreateEmployeeServlet
 */
@WebServlet("/CreateEmployeeServlet")
public class CreateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEmployeeServlet() {
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
		String fname= (String)request.getParameter("fname");
		String lname= (String)request.getParameter("lname");
		String tp= (String)request.getParameter("tp");
		String email= (String)request.getParameter("email");
		String nic= (String)request.getParameter("nic");
		String dob= (String)request.getParameter("dob");
		String err="";
		if(fname.equals(""))
		{
			err="First Name Cannot be Empty !!!"; 
		}
		else if(lname.equals(""))
		{
			err="Last Name Cannot be Empty !!!"; 
		}
		else if(tp.equals(""))
		{
			err="Telephone Number Cannot be Empty !!!"; 
		}
		else if(email.equals(""))
		{
			err="Email Cannot be Empty !!!"; 
		}
		else if(nic.equals(""))
		{
			err="NIC Cannot be Empty !!!"; 
		}
		else if(dob.equals(""))
		{
			err="DOB Cannot be Empty !!!"; 
		}
		else
		{
			try
			{
				
				Connection con=ConnectionPro.getConnection();
			     String query = "INSERT INTO `employee`( `fname`, `lname`, `tp`, `email`, `nic`, `dob`) VALUES ('"+fname+"','"+lname+"',"+tp+",'"+email+"','"+nic+"','"+dob+"')";
		         PreparedStatement pt =con.prepareStatement(query);
		         int i=pt.executeUpdate();
		         if(i==1)
		         {
		        	err="Successfully Saved Data !!"; 
		         }
		         else
		         {
		        	 err="Error While Saving Data !!"; 
		         }
		            request.setAttribute("RegError", err);
				    request.getRequestDispatcher("AddEmployee.jsp").forward(request, response); 
			}
			catch(Exception ex)
			{
				System.out.println("Error:"+ex);
			}
		}
	
		 request.setAttribute("RegError", err);
		    request.getRequestDispatcher("AddEmployee.jsp").forward(request, response); 
		
	}

}
