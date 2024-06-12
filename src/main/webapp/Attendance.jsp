<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.ConnectionPro"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Time SHeet</title>
</head>
<body  style="background-color: #09111e">
	<br />
	<br />
	<br />
	<div class="row">
<div class="col"></div>
<div class="col"><div class="row">
<div class="col-md-8"></div><div class="col-md-4"><a class="btn btn-primary" href="ViewEmployees.jsp">Home</a></div></div></div>
</div>
	<br />
	<br />
	<br />
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h1 style="text-align: center">Create New Time Sheet</h1>
					<br />
					<form action="CreateTimeSheet" method="post">
					
						<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>User ID</label> <select class="form-control " name="user">
									<%
									Connection con = ConnectionPro.getConnection();
									String sql = "select emp_id from employee";
									PreparedStatement pst;
									pst = con.prepareStatement(sql);
									ResultSet rst = pst.executeQuery();
									while (rst.next()) {
										int emp_id = rst.getInt("emp_id");
									%>
									<option value="<%=emp_id%>"><%=emp_id%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>In Time</label> <input class="form-control"
									placeholder="In Time" type="time" name="in" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Out Time</label> <input class="form-control"
									placeholder="Out Time" type="time" name="out" />
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Reason</label> <input class="form-control"
									placeholder="Reason" type="text" name="rsn" />
							</div>


						</div>
					</div>
					<br>
					<div class="row">
					<div class="col-md-5"></div>
						<div class="col-md-3">
						<input class="btn btn-primary" value="Save Time Sheet" type="submit"/>
						</div>
							<div class="col-md-3"></div>
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
					<br />
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
		<br /> <br />
	</div>
	<br />
	<br />
</body>
</html>