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

<!--    jQuery import    -->
<script src="assets/js/jquery.min.js"></script>
<!--     Nav Dependant Script    -->
<script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>
	<!--	Nav	-->
	<%@ include file="nav.jsp"%>
	<%
	if (u == null){
	%>
	<script>
		alert("Please login first");
		window.location="/login.jsp";
		</script>
	<%
		return;
		}
	%>

	<!--     align-block     -->
	<div class="align-block">
		<h1>
			<b><%= u.getUserName() %></b>
		</h1>
		<p class="lead font-weight-300">
			<%= u.getAboutUser() %>
		</p>
		<hr>
		<ul class="list-inline widgets">
			<li>
				<h2 class="font-weight-300">
					10 <small> Articles </small>
				</h2>
			</li>
			<li>
				<h2 class="font-weight-300">
					25 <small> Likes/Recommends </small>
				</h2>
			</li>
			<li>
				<h2 class="font-weight-300">
					30 <small> Shares/Followers </small>
				</h2>
			</li>
		</ul>
		<hr>

		<ul class="list-inline">
			<li><a href="new-post.jsp" class="btn btn-default btn-lg"
				role="button">New Post</a></li>
			<li>
				<a href="edit-profile.jsp" class="btn btn-default btn-lg" role="button">Edit Profile</a>
				<!-- <a href="#" class="btn btn-default btn-lg" role="button">edit Profile</a> -->
			</li>
		</ul>

	</div>
	<!--     align-block ends     -->
	<%@include file="/googleAnalytics.jsp"%>
</body>
<!--     Scripts     -->
<script src="assets/js/bootstrap.min.js"></script>

<!--    Nav Scripts     -->
<script src="assets/Nav/js/classie.js"></script>
<script src="assets/Nav/js/borderMenu.js"></script>

</html>