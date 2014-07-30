<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>College Chakhna - Login</title>
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
    <!-- <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style> -->
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    
	<script type="text/javascript" src="assets/js/modernizr.custom.js"></script>
  </head>

  <body>
	<%@include file="dashboard-menu.jsp" %>
	    
 	<div class="container">
		<div class="row">
	    	<div class="span6">
	    		<a class="btn btn-large" href="newArticle.jsp">New Article</a>
	    		<a class="btn btn-large" href="aboutAuthor.jsp">Edit About Author</a>
	    	</div>
	    	<div class="span6">
	    	
	    	</div>
		</div>
	</div>		
	
  </body>
   	
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/toucheffects.js"></script>

	<script>
		$(function(){
			
			$('#logout').click(function(){

					$.ajax({
						type: 		"get",
						url: 		"/users",
						data: 		{action:'logout'},
						success: 	function(code)
						{
									alert("Logged out!");
									window.location = "blog.jsp";
						}
					
					}).error(function(){ alert("error"); })
					.complete(function(){});
			});
		});
	</script>

</html>
    