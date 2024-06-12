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
 * Servlet implementation class CreateJobDepartment
 */
@WebServlet("/CreateJobDepartment")
public class CreateJobDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateJobDepartment() {
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

		String dep=(String)request.getParameter("dep");
		String job=(String)request.getParameter("title");
		String appoint=(String)request.getParameter("appoint");
		String user=(String)request.getParameter("user");
		String err="";
		
		if(dep.equals(""))
		{
			err="Department Cannot be Empty !!!"; 
		}
		else if(job.equals(""))
		{
			err="Job Title Cannot be Empty !!!"; 
		}
		else if(appoint.equals(""))
		{
			err="Appointment Date Cannot be Empty !!!"; 
		}
		else if(user.equals(""))
		{
			err="User Cannot be Empty !!!"; 
		}
		else
		{
			try
			{
				
				Connection con=ConnectionPro.getConnection();
			     String query = "INSERT INTO `emp_jobdepartment`(`emp_id`, `job_title`, `department`, `appoint_date`) VALUES ("+user+",'"+job+"','"+dep+"','"+appoint+"')";
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
				    request.getRequestDispatcher("AddJobDepartment.jsp").forward(request, response); 
			}
			catch(Exception ex)
			{
				System.out.println("Error:"+ex);
			}
		}
		   request.setAttribute("RegError", err);
		    request.getRequestDispatcher("AddJobDepartment.jsp").forward(request, response); 
	}

}
