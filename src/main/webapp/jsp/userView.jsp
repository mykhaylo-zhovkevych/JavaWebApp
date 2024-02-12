<%@ page import="javawebapplication.utitlity.ServletUtility" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Registration</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#datepicker").datepicker({
                dateFormat: 'mm/dd/yy',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</head>
<body>
<%@ include file="header.jsp"%>
<main class="login-form" style="margin-top: 55px">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header rainbow-text"> <!-- Added rainbow-text class -->
                        User Registration
                    </div>

          
				<h4 id="successMessage" style="color: green; margin-top: 10px; opacity: 0;">
 				   <%=ServletUtility.getSuccessMessage((jakarta.servlet.http.HttpServletRequest)request)%>
					</h4>

						<h4 id="errorMessage" style="color: red; margin-top: 10px; opacity: 0;">
  						  <%=ServletUtility.getErrorMessage((jakarta.servlet.http.HttpServletRequest)request)%>
							</h4>
							<jsp:useBean id="bean" class="javawebapplication.bean.UserBean" scope="request"></jsp:useBean>


		<div class="card-body">
  <form action="<%=JWAView.userctl%>" method="post">

    <div class="form-group row">
            <label for="first_name" class="col-md-4 col-form-label text-md-right">First Name</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Enter First Name" name="firstName" value="">
                <font color="red"></font>
            </div>
        </div>

    <div class="form-group row">
      <label for="last_name" class="col-md-4 col-form-label text-md-right">Last Name</label>
      <div class="col-md-6">
        <input type="text" class="form-control" placeholder="Enter Last Name" name="lastName" value="">
        <font color="red"></font>
      </div>
    </div>

    <div class="form-group row">
      <label for="user_name" class="col-md-4 col-form-label text-md-right">User Name<font color="red">*</font></label>
      <div class="col-md-6">
        <input type="text" id="email_address" class="form-control" placeholder="Enter Login Id" name="name" value="">
        <font color="red"></font>
      </div>
    </div>

    <div class="form-group row">
      <label for="password" class="col-md-4 col-form-label text-md-right">Password<font color="red">*</font></label>
      <div class="col-md-6">
        <input type="password" id="password" class="form-control" placeholder="Enter password" name="password" value="">
        <font color="red"></font>
      </div>
    </div>

    <div class="form-group row">
      <label for="dob" class="col-md-4 col-form-label text-md-right">Date Of Birth<font color="red">*</font></label>
      <div class="col-md-6">
        <input type="text" id="datepicker" class="form-control" placeholder="Enter Date Of Birth" name="dob" value="">
        <font color="red"></font>
      </div>
    </div>

    <div class="form-group row">
      <label for="mobile_no" class="col-md-4 col-form-label text-md-right">Mobile No.</label>
      <div class="col-md-6">
        <input type="text" id="mobile_no" class="form-control" placeholder="123-123-1234" name="mobileNo" value="">
        <font id="error_message" color="red"></font>
      </div>
    </div>
    <input type="hidden" name="id" value="<%=bean.getId() %>">
    

<script>
  var timeoutId;
  var isValid = true;

  document.getElementById("mobile_no").addEventListener("input", function () {
    clearTimeout(timeoutId);

    timeoutId = setTimeout(function () {
      var mobileNoInput = document.getElementById("mobile_no").value;
      var pattern = /[0-9]{3}-[0-9]{3}-[0-9]{4}/;
      var expectedLength = 12; // Length of the correct format: 123-123-1234

      if (!pattern.test(mobileNoInput) || mobileNoInput.length > expectedLength) {
        if (isValid) {
          isValid = false;
          var errorMessage = "Invalid mobile number format. Please use the format 123-123-1234.";
          document.getElementById("error_message").innerText = errorMessage.substring(0, expectedLength);
        }
      } else {
        isValid = true;
        document.getElementById("error_message").innerText = "";
      }
    }, 500); // Adjust the delay as needed (500 milliseconds in this example)
  });
</script>

<style>
    @keyframes fadeInOut {
        0%, 100% {
            opacity: 0;
            margin-top: 10px;
        }
        10%, 90% {
            opacity: 1;
            margin-top: 10px;
        }
    }

    @keyframes resetMargin {
        to {
            margin-top: 0;
        }
    }

    #successMessage, #errorMessage {
        animation: fadeInOut 4s ease-in-out, resetMargin 0.1s ease-in-out 4s forwards;
    }
</style>
    
    <%if(bean.getId()>0){ %>
		
      <div class="col-md-6 offset-md-4">
        <input type="submit" class="btn btn-primary" name="operation" value="Update">
      </div>
    <%}else{%>
    <div class="form-group row">
      <div class="col-md-6 offset-md-4">
        <input type="submit" class="btn btn-primary" name="operation" value="Register">
      </div>
    </div>
    <%}%>
  </form>
</div>

        </div>
      </div>
    </div>
  </div>
  </main>
  <div style="margin-top: 120px">
    <%@ include file="footer.jsp"%>
  </div>
</body>
</html>