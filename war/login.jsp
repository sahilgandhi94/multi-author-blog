<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="description"
	content="We're the official, un-official vee zhay tee aye blog. Fun is serious shizzle. Peace">
<meta name="Keywords"
	content="college,chakhna,blog,vjti,fun,serious,shizzle,veermata,zizabai,jijabai,technological,pratibimb,technovanza,enthusia">
<meta name="author" content="The College Chakhna Beareau">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>College Chakhna - Log In</title>
<!--    Nav styles    -->
<link rel="stylesheet" type="text/css"
	href="assets/Nav/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/icons.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/style5.css" />

<!--    styles     -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="assets/css/stylesheet.css">

<!--    jQuery import    -->
<script src="./assets/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="assets/js/jquery-1.9.1.js"></script> -->
<!--     Nav Dependant Script    -->
<script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>
	<!--	Nav	-->
	<%@ include file="nav.jsp"%>

	<!--     align-block     -->
	<div class="align-block">
		<h1>
			<b>Sign In</b> <br>
		</h1>
		<p class="lead text-muted font-weight-300">
			Currently, we are a closed community. We will soon open College
			Chakhna to all you enthusiastic authors. Till then happy reading. <br>
			Cheers!
		</p>
		<hr>
		<div class="row">
			<form role="form">
				<div class="form-group col-md-6">
					<label for="email">
						<h3>Email &nbsp;</h3>
					</label> <input type="text" class="form-control" id="email"
						placeholder="Email Address" tabindex="1">
				</div>
				<div class="form-group col-md-6">
					<label for="password">
						<h3>Password &nbsp;</h3>
					</label> <input type="password" class="form-control" id="password"
						placeholder="Password" tabindex="2">
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="btn btn-default btn-lg" id="login" tabindex="3"
					style="margin-left: 15px;">Sign In</div>
			</form>
		</div>
	</div>
	<!--     align-block ends     -->
	<%@include file="/googleAnalytics.jsp"%>
</body>
<!--     Scripts     -->
<script src="assets/js/bootstrap.min.js"></script>

<!--    Nav Scripts     -->
<script src="assets/Nav/js/classie.js"></script>
<script src="assets/Nav/js/borderMenu.js"></script>

<script>
		$(function(){
			
			$('#login').click(function(){
				var email = $('#email').val();
				var password = $('#password').val();

					$.ajax({
						type: 		"get",
						url: 		"/users",
						data: 		{action:'login', userEmail: email, password: password},
						success: 	function(code)
						{
									if(code == "login-success") {									 									
									window.location = "dashboard.jsp"; 									
									} else if(code == "no-user") { 										
										alert("No user found - Try again.");
									} else if(code == "login-fail") {
										alert("Username or Password did not match - Please try again.");
									} else {
										alert("Something went wrong - Please try again.");
									}					
						}
					
					}).error(function(){ alert("error"); })
					.complete(function(){});
			});
		});
		
		$("input").keyup(function(event){
			if(event.keyCode == 13){
  				 $("#login").click();
    		 }
		});
	</script>

</html>