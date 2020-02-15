<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<title>School Manager|404</title>
</head>
<body>
	<body>
		<div class="bg-info shadow-primary-bottom" id="navi">
			<div class="p-1">
				<div class="container">
					<h2 class="d-inline-flex text-light">404 Error</h2>
					<a href="./index.html"><small class="d-inline-flex text-light float-right">SchoolManager v1.0</small></a>
						<div class="spinner-border float-right" id="loader" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<h3 class="text-info" style="position: absolute; top: 20%; width:auto; margin-left:20%; ">Oops! <br> A 404 error happened <br> because the resource <br> could not be found.</h3>
			<h3 class="text-info"><a href="./index.html" style="position: absolute; top: 25%; left: -40%; width:auto; margin-left: 50%; ">HOME</a></h3>
		</div>
</body>
</html>