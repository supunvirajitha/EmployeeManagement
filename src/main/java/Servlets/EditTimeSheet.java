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
 * Servlet implementation class EditTimeSheet
 */
@WebServlet("/EditTimeSheet")
public class EditTimeSheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTimeSheet() {
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
		String sheet_id=request.getParameter("sheet_id");
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
			     String query = "UPDATE `time_sheet` SET  `intime`='"+in+"',`outtime`='"+out+"',`reason`='"+reason+"' WHERE sheet_id="+sheet_id+"";
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
				    request.getRequestDispatcher("EditAttendance.jsp?id="+sheet_id).forward(request, response); 
			}
			catch(Exception ex)
			{
				System.out.println("Error:"+ex);
			}
		}
		 request.setAttribute("RegError", err);
		 request.getRequestDispatcher("EditAttendance.jsp?id="+sheet_id).forward(request, response); 
		
	}

}
