<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.ConnectionPro"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <%  if (request.getParameter("id") != null) {
    	Connection con = ConnectionPro.getConnection();
    	String id = request.getParameter("id");
        PreparedStatement ps;
        ps = con.prepareStatement("delete from emp_jobdepartment where job_id="+id+""); ps.executeUpdate(); } %> 
        
         
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job & Department</title>
</head>
<body style="background-color: #09111e">
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
      <a class="navbar-brand text-white">Employee Management System</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item ">
            <a class="nav-link text-white" href="ViewEmployees.jsp"
              >Employees </a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link active text-warning" href="ViewJobDepartment.jsp">Job & Department <span class="sr-only">(current)</span></a>
          </li>
        
          <li class="nav-item">
            <a class="nav-link text-white" href="ViewSalary.jsp">Salary</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="ViewAttendance.jsp">Attendance</a>
          </li>
        </ul>
      </div>
    </nav>
     <br /><br /><br />
 <% 
    String usertype=(String)request.getSession().getAttribute("Category");
  if(usertype.equals(null))
  {
	  usertype="Admin";
  }
    if(!usertype.equals("User")) {%>
     &nbsp; &nbsp; &nbsp;
    <a class="btn btn-success" href="AddJobDepartment.jsp">Add Job & Department Details</a>

    <% } %>
      <br /><br /><br />
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-10">
        <div class="card">
          <div class="card-body">
            <h1 style="text-align: center">View Job & Department</h1>
            <br />
            <div class="row">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Employee ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Department</th>
                    <th scope="col">Title</th>
                    <th scope="col">Appoint Date</th>
                 
                    <% if(!usertype.equals("User")) {%>
                    <th scope="col">Actions</th>
                    <%} %>
                  </tr>
                </thead>
                <tbody>
                  <% Connection con = ConnectionPro.getConnection(); 
                  String sql ="select employee.emp_id,employee.fname,employee.lname,emp_jobdepartment.department,emp_jobdepartment.job_title,emp_jobdepartment.appoint_date,emp_jobdepartment.job_id from employee INNER JOIN emp_jobdepartment ON employee.emp_id=emp_jobdepartment.emp_id"; 
                  PreparedStatement pst; pst =con.prepareStatement(sql); 
                  ResultSet rst = pst.executeQuery();
                  while (rst.next()) { 
                	int job_id=rst.getInt("job_id");  
                  int id = rst.getInt("emp_id"); 
                  String fn =rst.getString("fname");
                  String ln =rst.getString("lname");
                  String dep =rst.getString("department");
                  String title =rst.getString("job_title"); 
                  String date =rst.getString("appoint_date");
                 
                  %>

                  <tr>
                    <td><%=id%></td>
                    <td><%=fn%></td>
                    <td><%=ln%></td>
                    <td><%=dep%></td>
                    <td><%=title%></td>
                    <td><%=date%></td>
                   
                    <% if(!usertype.equals("User")) { %>
                    <td>
                      <a class="btn btn-primary"  href="EditJobDepartment.jsp?id=<%=job_id%>">Edit</a>&nbsp;
                      <a
                        class="btn btn-danger"
                        href="ViewJobDepartment.jsp?id=<%=job_id%>"
                      >
                        Delete
                      </a>
                    </td>
                    <%} %>
                  </tr>
                  <%}%>
                </tbody>
              </table>
            </div>
            <br />
          </div>
        </div>
      </div>
      <div class="col-md-1"></div>
      <br /><br />
    </div>
    <br /><br />
    <br /><br />
</body>
</html>