<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.ConnectionPro"%>
<%@page import="java.sql.Connection"%>


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
<title>Edit Employee Details</title>
</head>
<body style="background-color: #09111e">
 <%  String emp_id="";
     String fn="";
     String ln="";
     String tp="";
     String em="";
     String nic="";
     
 if (request.getParameter("id") != null) 
 { Connection con =ConnectionPro.getConnection();
   String id = request.getParameter("id");
    PreparedStatement ps;
    ps = con.prepareStatement("select * from employee where emp_id="+id+""); 
    ResultSet rs= ps.executeQuery();
    
    while (rs.next()) { 
    	  emp_id = rs.getString("emp_id");
    	  fn =rs.getString("fname");
    	  ln =rs.getString("lname");
          tp =rs.getString("tp"); 
          em =rs.getString("email"); 
          nic =rs.getString("nic");
          
     %>
<br>
<br>
<div class="row">
<div class="col"></div>
<div class="col"><div class="row">
<div class="col-md-8"></div><div class="col-md-4"><a class="btn btn-primary" href="ViewEmployees.jsp">Home</a></div></div></div>
</div>
<br><br>
 <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h1 style="text-align: center">Edit Employee Account</h1>
            <br />
              <div class="row">
              <div class="col-md-4"></div>
              <div class="col-md-4">
                <img
                  style="width: 300px; height: 300px"
                src="images/profilepic.png"  alt="circle user avatar Icon 4035892"
                  class="styles__Image-sc-2erpfv-1 eOQgUF"
                />
              </div>
              <div class="col-md-4"></div>
            </div>
                <br>
            <form method="post" action="EditEmployeeServlet">
             <div class="row">
              <div class="col-md-6 form-group">
              <input value="<%=emp_id%>" type="hidden" name="emp_id"/>
                <label>First Name</label
                ><input name="fname" value="<%=fn %>" class="form-control" placeholder="First Name" />
              </div>
              <div class="col-md-6">
                <label>Last Name</label
                ><input name="lname"  value="<%=ln %>" class="form-control" placeholder="Last Name" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>Telephone</label
                ><input
                 value="<%=tp %>"
                 name="tp"
                  class="form-control"
                  type="number"
                  placeholder="Telephone"
                />
              </div>
              <div class="col-md-6">
                <label>Email</label
                ><input name="email" value="<%=em %>" class="form-control" placeholder="Email" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>NIC</label
                ><input
                value="<%=nic %>"
                name="nic"
                  class="form-control"
                  placeholder="National Identity Card"
                />
              </div>
              <div class="col-md-6">
                <label>DOB</label
                ><input name="dob" class="form-control" type="date" placeholder="Date" />
              </div>
            </div>
             <% }} %>
      
            <br>
            <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
            <input type="submit" class="btn btn-primary col-md-12" value="Edit Employee Account"/>
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
   
</body>
</html>