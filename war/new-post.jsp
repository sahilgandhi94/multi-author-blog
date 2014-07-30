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
<title>College Chakhna - New Post</title>
<!--    Nav styles    -->
<link rel="stylesheet" type="text/css"
	href="assets/Nav/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/icons.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/style5.css" />

<!--    styles     -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="assets/css/stylesheet.css">

<!--    Editor Style     -->
<link rel="stylesheet"
	href="assets/editor/dist/bootstrap3-wysihtml5.min.css">

<!--    jQuery import    -->
<script src="assets/js/jquery.min.js"></script>
<!--     Nav Dependant Script    -->
<script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>
	<!--	Nav	-->
	<%@ include file="nav.jsp"%>
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
			<b>New Story</b>
		</h1>
		<hr>
		<h3>
			Title &nbsp; <small>Displayed at the top of your article</small>
		</h3>
		<textarea rows="1" id="title" placeholder="Title" class="title"></textarea>
		<h3>
			Subtitle &nbsp; <small>Two sentences to summarize your
				article</small>
		</h3>
		<textarea rows="3" id="subtitle" placeholder="Subtitle"
			class="subtitle"></textarea>

		<h3>Story &nbsp;</h3>

		<textarea id="article" rows="15" placeholder="Enter your story ..."
			class="article"></textarea>

		<br> <br> <a href="#review"
			class="btn btn-lg btn-default review"> Review </a>
		<hr>
		<br> <br>
		<div id="review"></div>

		<div class="hidden publish">
			<br>
			<hr>
			<button class="btn btn-lg btn-default" id="publish">Publish</button>
			<br> <small>If you are happy with your article, click
				publish. To make changes in your article, scroll to the top of the
				page.</small><br>
			<hr>
			<br> <br>
		</div>

	</div>
	<!--     align-block ends     -->
	<%@include file="/googleAnalytics.jsp"%>
</body>
<!--     Scripts     -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/autogrow.js"></script>

<!--    Nav Scripts     -->
<script src="assets/Nav/js/classie.js"></script>
<script src="assets/Nav/js/borderMenu.js"></script>

<!--    Editor Scripts	-->
<script src="assets/editor/wysihtml5-master/dist/wysihtml5-0.3.0.min.js"></script>
<script src="assets/editor/dist/handlebars.runtime.min.js"></script>
<script src="assets/editor/dist/bootstrap3-wysihtml5.min.js"></script>
<script>
	$(function() {

		$('textarea').autogrow();

		$('#article').wysihtml5({
			/* "image" : false, */
			"html" 	: true
		});

		$('.review')
				.click(
						function() {
							$('.publish').removeClass("hidden").addClass("");
							var title = $('#title').val()
							var subtitle = $('#subtitle').val()
							var article = $('#article').val();
							var review = "<h1><b>Review Post <br> <small class=\"font-weight-300\">Your article will look like this</small></b></h1><br><p>If You have any changes then scroll up to the top of the page and hit the review button to see the changed version of the post.</p><hr><br><br>";
							var html = review
									+ "<h2><b>"
									+ title
									+ "</b></h2><hr><p class=\"lead font-weight-300\">"
									+ subtitle + "</p><br><div class=\"copy\">"
									+ article + "</div>";
							$('#review').html(html);
						});

		$('#publish').click(function() {
			var title = $('#title').val();
			var description = $('#subtitle').val();
			var article = $('#article').val();

			$.ajax({
				type : "post",
				url : "/articles",
				data : {
					action : 'add',
					title : title,
					description : description,
					article : article
				},
				success : function(code) {
					alert("published");
					window.location = "dashboard.jsp";
				}

			}).error(function() {
				alert("error");
			}).complete(function() {
				alert("complete");
			});

		});

	});
</script>
</html>
