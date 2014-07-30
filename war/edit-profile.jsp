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
<title>College Chakhna - Dashboard</title>
<!--    Nav styles    -->
<link rel="stylesheet" type="text/css"
	href="assets/Nav/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/icons.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/style5.css" />

<!--    styles     -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="assets/css/stylesheet.css">

<!--    Logo styles    -->
<link rel="stylesheet" href="assets/logo/css/logo-style.css">
<!--     Google font League    -->
<link href='http://fonts.googleapis.com/css?family=League+Script'
	rel='stylesheet' type='text/css'>
<!--    jQuery import    -->
<script src="assets/js/jquery.min.js"></script>
<!--     Nav Dependant Script    -->
<script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>
	<!--	Nav	-->
	<%@ include file="/nav.jsp"%>
	<%
		if (u == null) {
	%>
	<script>
		alert("Please login first");
		window.location = "/login.jsp";
	</script>
	<%
		return;
		}
	%>

	<!--     align-block     -->
	<div class="align-block">
		<h1>
			<b>Edit Profile</b>
		</h1>
		<hr>

		<form role="form">
			<div class="form-group">
				<label for="name">
					<h3>
						Full Name &nbsp; <small>Not displayed under your articles.</small>
					</h3>
				</label> 
				<textarea rows="1" type="text" class="form-control" id="edit-name" placeholder="Full Name"><%=u.getUserName()%></textarea>
			</div>
			<div class="form-group">
				<label for="about">
					<h3>
						About you &nbsp; <small>Displayed under your articles.</small>
					</h3>
				</label>
				<textarea class="form-control" rows="3" id="edit-about"
					placeholder="About you"
					onkeyup="replaceWordChars(this.value, this.id)"><%=u.getAboutUser()%></textarea>
			</div>
			<div id="submit" class="btn btn-default">Submit</div>
		</form>

	</div>
	<!--     align-block ends     -->
	<%@include file="/googleAnalytics.jsp"%>
</body>
<!--     Scripts     -->
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/autogrow.js"></script>

<!--    Nav Scripts     -->
<script src="assets/Nav/js/classie.js"></script>
<script src="assets/Nav/js/borderMenu.js"></script>

<!-- 	Page Specific Scripts	 -->
<script>
	$(function() {
		$('textarea').autogrow();

		$('#submit').click(function() {
			var name = $('#edit-name').val();
			var about = $('#edit-about').val();
			
			if(name != "" && about != ""){
				$.ajax({
						type : "get",
						url : "/users",
						data : {
							action : 'update',
							userName : name,
							aboutUser : about
						},
						success : function(code) {
							alert("hooray!");
							window.location = "dashboard.jsp";
						}
	
					}).error(function() {
						alert("error");
					}).complete(function() {
						alert("complete");
					});
			} else {
				alert("All inputs are mandatory! You can't leave any of them empty.")
			}
			
			

		});

	});

	function replaceWordChars(text, eleId) {
		var s = text;
		// smart single quotes and apostrophe
		s = s.replace(/[\u2018|\u2019|\u201A]/g, "\'");
		// smart double quotes
		s = s.replace(/[\u201C|\u201D|\u201E]/g, "\"");
		// ellipsis
		s = s.replace(/\u2026/g, "...");
		// dashes
		s = s.replace(/[\u2013|\u2014]/g, "-");
		// circumflex
		s = s.replace(/\u02C6/g, "^");
		// open angle bracket
		s = s.replace(/\u2039/g, "<");
		// close angle bracket
		s = s.replace(/\u203A/g, ">");
		// spaces
		s = s.replace(/[\u02DC|\u00A0]/g, " ");
		document.getElementById(eleId).value = s;
		/* alert(document.getElementById(eleId).value); */
	}
</script>

</html>