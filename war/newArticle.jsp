<%@	page import="com.collegechakhna.server.database.DBArticles"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>College Chakhna</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Le styles -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/colors/blue.css" rel="stylesheet">
		<link href="assets/css/menu.css" rel="stylesheet">
		<link href="assets/css/font-awesome.css" rel="stylesheet">
		<link href="assets/css/linecons.css" rel="stylesheet">

		<style>
			textarea{
				width: 80%;
			}
			
		</style>
		
		<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="assets/js/autogrow.js"></script>


	</head>

	<body>
	<%@include file="dashboard-menu.jsp" %>
		
		<div class="container">
			<h4 class="text-left">Title:</h4>
			<textarea id="title" rows="2" cols="" ></textarea>
			<br />
			<h4 class="text-left">Description:</h4>
			<textarea id="description" rows="5" cols="" onkeyup="replaceWordChars(this.value, this.id)"></textarea>
			<br />
			<h4 class="text-left">Article:</h4>
			<textarea id="article" rows="40" cols="" onkeyup="replaceWordChars(this.value, this.id)"></textarea>
			<br />
		
			<div class="publish btn">Publish</div>
			<br />
			<br />
		</div>
		
	
	</body>

	<script>
		$(function(){
			$('textarea').autogrow(); 
			 
			$('.publish').click(function(){
				title = $('#title').val();
				description = $('#description').val();
				article = $('#article').val();
				
				$.ajax({
					type: 		"post",
					url: 		"/articles",
					data: 		{action:'add', title:title, description:description, article:article, userId:<%= userId%>},
					success: 	function(code)
					{
								alert("published");	
								window.location="dashboard.jsp";
					}
				
				}).error(function(){ alert("error"); })
				.complete(function(){ alert("complete"); });
								
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
