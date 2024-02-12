<style>
.containerLF {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #0056b3;
    border: 1px solid #007bff;
    border-radius: 10px;
    padding: 3px 8px;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

.containerLF:hover {
    background-color: lightblue;
    border-color: #0056b3;
}

.link {
    display: relative;
    color: black;
    background-color: #0056b3;
    padding: 2px 4px;
    border-radius: 10px;
    transition: background-color 0.3s ease;
}

.link:hover {
    background-color: lightblue;
    border-color: #0056b3;
}

#error-message {
    position: relative;
    font-size: 25px;
    animation: fadeInOutAndFadeOut 5s ease-in-out, resetMargin 5s ease-in-out 5s forwards;
}

#success-message {
    position: relative;
    font-size: 25px;
    animation: fadeInOutAndFadeOut 5s ease-in-out, resetMargin 5s ease-in-out 5s forwards;
}

@keyframes fadeInOutAndFadeOut {
    0% {
        opacity: 1;
        margin-top: 10px;
    }
    90%, 100% {
        opacity: 0;
        margin-top: 10px;
    }
}

@keyframes resetMargin {
    to {
        margin-top: 0;
    }
}

</style>


<%@page import="javawebapplication.utitlity.ServletUtility" %>
<script src="javascript\loginerror_script.js"></script>
<script src="javascript\succesLogin"></script>
<body>
  <%@ include file="header.jsp"%>
  <main class="login-form" style="margin-top: 55px">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header">
              Login 
              <h6 style="color: green;"></h6>
            </div>
            <div class="card-body">
            
              <form action="<%=JWAView.loginctl%>" method="post">
              <h2 style="color: red" id="error-message"> <%=javawebapplication.utitlity.ServletUtility.getErrorMessage((jakarta.servlet.http.HttpServletRequest)request) %></h2>
                 <h2 style="color: green" id="success-message"> <%=javawebapplication.utitlity.ServletUtility.getSuccessMessage((jakarta.servlet.http.HttpServletRequest)request) %></h2>
                <div class="form-group row">
                  <label for="email_address" class="col-md-4 col-form-label text-md-right">User Name<font color="red">*</font></label>
                  <div class="col-md-6">
                    <input type="text" id="login"  class="form-control" placeholder="Enter Login Id" name="name" value="">
                    <font color="red"></font>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="password" class="col-md-4 col-form-label text-md-right">Password<font color="red">*</font></label>
                  <div class="col-md-6">
                    <input type="password" id="password" class="form-control" placeholder="Enter Password" name="password" value="">
                    <font color="red"></font>
                  </div>
                </div>
                <div class="col-md-6 offset-md-4">
                  <input type="submit" class="containerLF" name="operation" value="Login">
                </div>
              </form>
              <!--  <div class="col-md-6 offset-md-4">
                  <input style="margin-top: 10px;" type="submit" class="containerLF" name="operation" value="Login Root">
                </div>  
                 --> 
              <div class="col-md-6 offset-md-4" style="margin-top: 10px;">
                <a href="" class="link">Forgot Your Password?</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <div style="margin-top: 170px">
    <%@ include file="footer.jsp"%>
  </div>
</body>




