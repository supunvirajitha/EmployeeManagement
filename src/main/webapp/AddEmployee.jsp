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
<title>Add Employee</title>
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
            <h1 style="text-align: center">Register New Employee</h1>
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
            <form method="post" action="CreateEmployeeServlet">
             <div class="row">
              <div class="col-md-6 form-group">
                <label>First Name</label
                ><input name="fname" class="form-control" placeholder="First Name" />
              </div>
              <div class="col-md-6">
                <label>Last Name</label
                ><input  name="lname" class="form-control" placeholder="Last Name" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>Telephone</label
                ><input
                   name="tp"
                  class="form-control"
                  type="number"
                  placeholder="Telephone"
                />
              </div>
              <div class="col-md-6">
                <label>Email</label
                ><input  name="email" class="form-control" placeholder="Email" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>NIC</label
                ><input  name="nic"
                  class="form-control"
                  placeholder="National Identity Card"
                />
              </div>
              <div class="col-md-6">
                <label>DOB</label
                ><input  name="dob" class="form-control" type="date" placeholder="Date" />
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