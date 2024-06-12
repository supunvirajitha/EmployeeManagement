package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionPro;

/**
 * Servlet implementation class CreateTimeSheet
 */
@WebServlet("/CreateTimeSheet")
public class CreateTimeSheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTimeSheet() {
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
		String user_id=request.getParameter("user");
		String in=request.getParameter("in");
		String out=request.getParameter("out");
		String reason=request.getParameter("rsn");
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String d=format.format(date);
		String err="";
		
		if(user_id.equals(""))
		{
			err="Please Select User Id !! ";
		}
		else if(in.equals(""))
		{
			err="Please Enter In time !! ";
		}
		else if(out.equals(""))
		{
			err="Please Enter Out time !! ";
		}
		else
		{
			try
			{
				
				Connection con=ConnectionPro.getConnection();
			     String query = "INSERT INTO `time_sheet`( `emp_id`, `intime`, `outtime`, `reason`, `date`) VALUES ("+user_id+",'"+in+"','"+out+"','"+reason+"','"+d+"')";
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
				    request.getRequestDispatcher("Attendance.jsp").forward(request, response); 
			}
			catch(Exception ex)
			{
				System.out.println("Error:"+ex);
			}
		}
		 request.setAttribute("RegError", err);
		 request.getRequestDispatcher("Attendance.jsp").forward(request, response); 
	}

}
