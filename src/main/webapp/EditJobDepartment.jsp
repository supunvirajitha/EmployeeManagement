<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.ConnectionPro"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />

<title>Edit Job & Department</title>
</head>
<body style="background-color: #09111e">
<br><br>
<div class="row">
<div class="col"></div>
<div class="col"><div class="row">
<div class="col-md-8"></div><div class="col-md-4"><a class="btn btn-primary" href="ViewEmployees.jsp">Home</a></div></div></div>
</div>
 <br /><br /><br />
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h1 style="text-align: center">Edit Employee Department & Job Details</h1>
            <br />
           
            <br>
            <form method="post" action="EditJobDepartment">
             <div class="row">
            
              
               <%
            String job_title="";
            String department="";
            String date="";
            String user="";
         
        if (request.getParameter("id") != null) 
        {
           Connection con=ConnectionPro.getConnection();
           String id = request.getParameter("id");
           PreparedStatement ps;
           ps = con.prepareStatement("select * from emp_jobdepartment where job_id="+id+""); 
           ResultSet rs= ps.executeQuery();
            
            while (rs.next()) { 
            	
      	  job_title = rs.getString("job_title");
      	  department =rs.getString("department");
      	  date=rs.getString("appoint_date");
      	  user=rs.getString("emp_id");
      	
       %>
         <div class="col-md-6 form-group">
          <input value="<%= id%>" name="id" type="hidden"/>
                <label>User Id</label>
              <input  class="form-control" name="user" value="<%=user%>"/>
              </div>
              <div class="col-md-6">
                <label>Job Title</label
                ><input   name="title" class="form-control" value="<%= job_title %>" placeholder="Job Title" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>Department</label
                ><input
                   name="dep"
                  class="form-control"
                  type="text"
                  value="<%= department %>"
                  placeholder="Department"
                />
              </div>
             <div class="col-md-6">
                <label>Appointment Date</label
                ><input value="<%=date %>"  name="appoint" class="form-control" type="date" placeholder="Appointment Date" />
              </div>
              <%}} %>
            </div>
            
        
            <br>
            <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
            <button class="btn btn-primary col-md-12">Update Details</button>
            </div>
            <div class="col-md-4"></div>
            </div>
            </form>
           	    <%
				String message = (String) request.getAttribute("RegError");
				%>
				<%
				if (message == null) {
				%>
				<div class="besideemailbox" style="color: red"></div>
				<%
				} else if(message=="Successfully Updated Data !!")  {
				%>
				<div class="besideemailbox" style="color: green"><%=message %></div>
				<%
				} else{ 
				%>
				<div class="besideemailbox" style="color: red"><%=message %></div>
				<%} %>
				
          </div>
        </div>
      </div>
      <div class="col-md-3"></div>
      <br><br>
    </div>
     <br><br>
</body>
</html>