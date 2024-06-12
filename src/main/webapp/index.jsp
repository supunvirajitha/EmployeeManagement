
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <title>Login into Account</title>
  </head>
  <body style="background-color: #09111e">

    <br /><br /><br />
    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-3">
        <div class="card">
          <div class="card-body">
            <h1 style="text-align: center">LOGIN</h1>
            <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-4">
                <img
                  style="width: 200px; height: 200px"
                src="images/profilepic.png"  alt="circle user avatar Icon 4035892"
                  class="styles__Image-sc-2erpfv-1 eOQgUF"
                />
              </div>
              <div class="col-md-4"></div>
            </div>
            <form method="post" action="LoginServlet">
              <div class="form-group">
                <label>Email</label
                ><input class="form-control col-md-12" placeholder="Email" name="email" />
              </div>
              <div class="form-group">
                <label>Password</label
                ><input
                  type="password"
                  class="form-control col-md-12"
                  placeholder="Password"
                  name="password"
                />
              </div>
              <a href="/EmployeeManagement/Registration.jsp"
                >Don't you have an account</a
              >
              <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                  <br />
                  <input type="submit" class="btn btn-primary col-md-10" value="Login">
                </div>
                <div class="col-md-4"></div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-4"></div>
    </div>
  </body>
</html>
