<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="description" content="We're the official, un-official vee zhay tee aye blog. Fun is serious shizzle. Peace">
    <meta name="Keywords" content="college,chakhna,blog,vjti,fun,serious,shizzle,veermata,zizabai,jijabai,technological,pratibimb,technovanza,enthusia">
    <meta name="author" content="The College Chakhna Beareau">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Chakhna</title>
    
<!--    Nav styles    -->
    <link rel="stylesheet" type="text/css" href="assets/Nav/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="assets/Nav/css/icons.css" />
    <link rel="stylesheet" type="text/css" href="assets/Nav/css/style5.css" />
    
<!--    styles     -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/stylesheet.css">
    
<!--    Logo styles    -->
    <link rel="stylesheet" href="assets/logo/css/logo-style.css">
<!--     Google font League    -->
    <link href='http://fonts.googleapis.com/css?family=League+Script' rel='stylesheet' type='text/css'>
<!--    jQuery import    -->
    <script src="assets/js/jquery.min.js"></script>
<!--     Nav Dependant Script    -->
    <script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>
	<!--	Nav	-->
	<%@ include file="nav.jsp" %>
    <header>
         <!--    Logo    -->
         <div class="logo">
            <div class="logo-roundel">
                <span class="left-n">C</span>
                <span class="right-n">C</span>
          </div>
        </div>
        <div id="hero-title">
            <h1 class="logo-site-name">
                College Chakhna
                <br>
                <small class="league-script">
                    fun is serious shizzle
                </small>
            </h1>
            <br>
        </div>        
        
    </header>
    <div id="page">
        <div class="container">
            <div class="row">
                <div class="align-block">
                
<!--        posts        -->
<!--                      
					<a href="blog-post.html">
                         <h2>                        
                            <b>
                                Post 1: why is college chakhna so awesome.. csalkncas kljncksjanc kanckaj ncksjn ackjanck
                            </b>
                        </h2>
                   <br>
                        <p class="lead font-weight-300">
                            Studying to get into VJTI? Or you've already made it here? This article is the 1st of a series of 5 articles!
                        </p>
                        <small class="text-muted font-weight-300"><em>Published On: 12 Oct 2013</em></small>
                    </a>
                    <br><br>
                    
                    single line...
                    <a href="blog-post.html"><h2><b> title </b></h2><br><p class="lead font-weight-300"> sub title </p><small class="text-muted font-weight-300"><em>Published On: 12 Oct 2013</em></small></a><br><br> 
-->                    
<!--        post ends..            -->

                </div>
            </div>
        </div>
    </div> 
<!--     #page ends    -->

    <footer>
        <div class="container">
            <div class="row">
               
            </div>
        </div>
    </footer>

<%@include file="/googleAnalytics.jsp"%>
</body>

<!--     Scripts     -->
    <script src="assets/js/bootstrap.min.js"></script>

<!--    Nav Scripts     -->
    <script src="assets/Nav/js/classie.js"></script>
	<script src="assets/Nav/js/borderMenu.js"></script>
<!--	Page specific Scripts	-->
	<script>
			$(function() {
				$.ajax({
					type: 		"get",
					url: 		"/articles",
					data: 		{action:'getArticleList'},
					success: 	function(code)
					{
								$('.align-block').html(code);							
					}
				
				}).error(function(){ alert("error in getting articles"); })
				.complete(function(){});		
				
			}); /* document load function ends */
		</script>
	
	

</html>