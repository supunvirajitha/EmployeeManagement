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
 * Servlet implementation class EditSalary
 */
@WebServlet("/EditSalary")
public class EditSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSalary() {
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
		String user= (String)request.getParameter("user");
		String basic= (String)request.getParameter("basic");
		String all= (String)request.getParameter("all");
		String epf= (String)request.getParameter("epf");
		String ot= (String)request.getParameter("ot");
		String id= (String)request.getParameter("id");
		
		String err="";
		if(user.equals(""))
		{
			err="User Cannot be Empty !!!"; 
		}
		else if(basic.equals(""))
		{
			err="Basic Salary Cannot be Empty !!!"; 
		}
		else if(all.equals(""))
		{
			err="Allowancer Cannot be Empty !!!"; 
		}
		else if(epf.equals(""))
		{
			err="EPF / ETF Cannot be Empty !!!"; 
		}
		else if(ot.equals(""))
		{
			err="OT Cannot be Empty !!!"; 
		}
		else
		{
			try
			{
				
				Connection con=ConnectionPro.getConnection();
			     String query = "UPDATE `salary` SET `basic_salary`="+basic+",`epf_etf`="+epf+",`allowance`="+all+",`ot_per_hour`="+ot+" WHERE emp_id="+user+"";
		         PreparedStatement pt =con.prepareStatement(query);
		         int i=pt.executeUpdate();
		         if(i==1)
		         {
		        	err="Successfully Updated Data !!"; 
		         }
		         else
		         {
		        	 err="Error While Saving Data !!"; 
		         }
		            request.setAttribute("RegError", err);
				    request.getRequestDispatcher("EditSalary.jsp?id="+id).forward(request, response); 
			}
			catch(Exception ex)
			{
				System.out.println("Error:"+ex);
			}
		}
	
		 request.setAttribute("RegError", err);
		    request.getRequestDispatcher("EditSalary.jsp?id="+id).forward(request, response); 
	}
	

}
