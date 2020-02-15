<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.login.LoginServlet" %>
<% String logintype = null; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--dependencies-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" 
href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> 
<link rel="stylesheet" href="./CSS/schoolmanagerstyles.css">

<!-- dependencies for this page -->
<script type="text/javascript" src="./JS/loginvalidation.js"></script>
<link rel="stylesheet" href="./CSS/loginstyles.css">

<title>School Manager|LOGIN</title>
</head>
<body>

	<div class="bg-info shadow-primary-bottom" id="navi">
		<div class="container">
			<div class="p-1">
				<h2 class="d-inline-flex text-light">Log in</h2>
				<a href="./index.html"><small class="d-inline-flex text-light float-right">SchoolManager v1.0</small></a>
					<div class="spinner-border float-right" id="loader" role="status">
					  <span class="sr-only">Loading...</span>
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<div class="container p-2">
		<p><i>Enter your login details into the system</i></p>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			
				<div class="col-sm-4 shadow-primary-bottom">
					<div class="p-4">
						<div class="text-center">
							<h4 class="text-center">LOGIN </h4>
							<div class="p-4">
								<form action="logger" method="post" id="loginform" onsubmit="return validateLogin(this);">
									<div  class="mb-4">
										<label class="float-left">You are a</label><br/>
										<select name="logintype" id="logintypeselect" class="form-control form-control-sm">
											<option value="">(select)</option>
											<option value="Student">Student</option>
											<option value="Academic">Academic</option>
											<option value="NonAcademic">NonAcademic</option>
										</select>
									</div>
										<label class="float-left">User ID</label><br/>
										<input type="text" class="text-dark" id="usernametxt" name="username"><br/>
										
										<label class="float-left">Password</label><br/>
										<input type="password" class="text-dark" id="passwordtxt" name="password"><br/><br/>
										
										<input type="submit" class="bg-info text-light" id="loginBtn" name="loginsubmit" value="OK">
								</form><div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
					
			<div class="col-sm-4 bg-light shadow-primary-bottom">
				<p class="text-info text-medium text-center mt-5 p-3" id="messageboxA"></p><br/>
				<p class="text-info text-medium text-center mt-5 p-3" id="messageboxB"></p><br/>
				<p class="text-info text-medium text-center mt-4 p-3" id="messageboxC"></p><br/>
				<p class="text-info text-medium text-center mt-1 p-3" id="messageboxD">${error}</p><br/>
			</div>
			
			<div class="col-sm-2"></div>
		</div>	
	</div>

<script type="text/javascript" src="./JS/loader.js"></script>
</body>
</html>