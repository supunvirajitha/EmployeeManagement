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
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployeeServlet() {
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
		String emp_id=(String)request.getParameter("emp_id");
		String err="";
		try
		{
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
				
				Connection con=ConnectionPro.getConnection();
			     String query = "UPDATE `employee` SET `fname`='"+fname+"',`lname`='"+lname+"',`tp`="+tp+",`email`='"+email+"',`nic`='"+nic+"',`dob`='"+dob+"' WHERE emp_id="+emp_id+" ";
		         PreparedStatement pt =con.prepareStatement(query);
		         int i=pt.executeUpdate();
		         if(i==1)
		         {
		        	err=""; 
		         }
		         else
		         {
		        	 err="Error While Saving Data !!"; 
		         }
		         request.setAttribute("RegError", err);
				    request.getRequestDispatcher("EditEmployee.jsp?id="+emp_id).forward(request, response); 
		
			}
			
	            request.setAttribute("RegError", err);
			    request.getRequestDispatcher("EditEmployee.jsp?id="+emp_id).forward(request, response); 
		}
		catch(Exception ex)
		{
			System.out.println("Error:"+ex);
		}
		
	}

}
