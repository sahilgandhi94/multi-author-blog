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
		
		<div class="container">
			<h4 class="text-left">Title:</h4>
			<textarea id="title" rows="2" cols=""></textarea>
			<br />
			<h4 class="text-left">Description:</h4>
			<textarea id="description" rows="5" cols="" onkeyup="replaceWordChars(this.value)" ></textarea>
			
		
			<div class="btn1 btn">Submit</div>
			<br />
			<br />
			
			<div id="final">
			
			</div>
		</div>
		
	
	</body>

	<script>
		$(function(){
			$('textarea').autogrow(); 
			 
			$('.btn1').click(function(){
				title = $('#title').val();
				description = $('#description').val();
				var final = "<pre>" + description + "</pre>";
				document.getElementById("final").html = final;
			});
			
			
		 
		});
		
		function replaceWordChars(text) {
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
		    document.getElementById("description").value = s;
		}
	</script>
</html>
