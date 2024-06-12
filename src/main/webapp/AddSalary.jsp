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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee Salary Details </title>
</head>
<body style="background-color: #09111e">
  <br><br>
<div class="row">
<div class="col"></div>
<div class="col"><div class="row">
<div class="col-md-8"></div><div class="col-md-4"><a class="btn btn-primary" href="ViewSalary.jsp">Home</a></div></div></div>
</div>
 <br /><br /><br />
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h1 style="text-align: center">Add Employee Salary Information</h1>
            <br />
         
                <br>
            <form method="post" action="CreateSalary">
             <div class="row">
               <div class="col-md-6 form-group">
                <label>User Id</label>
                <select name="user" class="form-control">
                 <% 
                  Connection con = ConnectionPro.getConnection(); 
                  String sql ="select emp_id from employee"; 
                  PreparedStatement pst; 
                  pst =con.prepareStatement(sql); 
                  ResultSet rst = pst.executeQuery();
                  while (rst.next()) { 
                	int emp_id=rst.getInt("emp_id");
                  %>
                  <option value="<%=emp_id%>"><%=emp_id %></option>
                  <%} %>
                </select>
                
              
              </div>
              <div class="col-md-6">
                <label>Basic Salary</label
                ><input  name="basic" type="number" class="form-control" placeholder="Basic Salary" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>Allowance</label
                ><input
                   name="all"
                   class="form-control"
                   type="number"
                   placeholder="Allowance"
                />
              </div>
              <div class="col-md-6">
                <label>EPF / ETF</label
                ><input  name="epf" class="form-control" placeholder="EPF / ETF" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label>OT Per Hour</label
                ><input  name="ot"
                  class="form-control"
                  placeholder="OT Per Hour"
                />
              </div>
            
            </div>
        
            <br>
            <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
            <button class="btn btn-primary col-md-12">Create Account</button>
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
				} else if(message=="Successfully Saved Data !!")  {
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