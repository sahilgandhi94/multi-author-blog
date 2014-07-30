<!doctype html>
<%@page import="com.collegechakhna.server.data.Articles"%>
<%@page import="com.collegechakhna.server.database.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<html lang="en">
<head>
<% 
	/* To retrieve the article */
	Integer articleId = Integer.parseInt(request.getParameter("articleId")); 
	/* Variables for Discuss comments */
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Articles a = pm.getObjectById(Articles.class,(articleId));
	String title = a.getTitle();
	%>
<title><%= title %></title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="description" content= <%= a.getDescription().getValue()%> >
<meta name="Keywords" content="college,chakhna,blog,vjti,fun,serious,shizzle,veermata,zizabai,jijabai,technological,pratibimb,technovanza,enthusia">
<meta name="author" content="The College Chakhna Beareau">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--    Nav styles    -->
<link rel="stylesheet" type="text/css" href="assets/Nav/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/icons.css" />
<link rel="stylesheet" type="text/css" href="assets/Nav/css/style5.css" />

<!--    styles     -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="assets/css/stylesheet.css">

<!--    jQuery import    -->
<script src="assets/js/jquery.min.js"></script>
<!--     Nav Dependent Script    -->
<script src="assets/Nav/js/modernizr.custom.js"></script>
</head>
<body>

	<%-- <% 
	/* To retrieve the article */
	Integer articleId = Integer.parseInt(request.getParameter("articleId")); 
	/* Variables for Discuss comments */
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Articles a = pm.getObjectById(Articles.class,(articleId));
	title = a.getTitle();
	%> --%>

	<!--	Nav	-->
	<%@ include file="nav.jsp"%>

	<div id="page">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="align-block content">
					<!--        posts       
                     <h2>                        
                        <b>
                            title
                        </b>
                        <small class="text-muted font-weight-300"><em>Published On: 12 Oct 2013</em></small>
                    </h2>
                    <hr>
                    <p class="lead font-weight-300">
                            Sub title
                    </p>
                    <br>
                    <p class="copy">
                        article
                    </p>
                    <br><br>                    
                    <hr>
       post ends..           
                
       share implementation       
                                
                <ul class="list-inline">
                        <li>
                            <h4 class="font-weight-300 text-muted text-left">
                                SPREAD THE WORD                    
                            </h4>                            
                        </li>
                        <li><a href="http://www.twitter.com/CollegeChakhna" class="bt-icon icon-twitter"></a></li>
                        <li><a href="https://plus.google.com/101095823814290637419" class="bt-icon icon-gplus"></a></li>
                        <li><a href="http://www.facebook.com/pages/collegedachakhna" class="bt-icon icon-facebook"></a></li>
                </ul>
                
       share implementation ends       
                <hr>
       About the Author       
                <h4 class="font-weight-300 text-muted">ABOUT THE AUTHOR</h4>
                <p class="lead">
                    about author
                </p>
       About the Author ends                       
                <hr>
       disqus comment button       

                <div class="well">
                    <h4 class="text-center font-weight-300"><a href="#">There are 9 comments so far. Want to add yours?</a></h4>
                </div>    

       disqus button ends        -->

				</div>
				<!--        align block ends        -->
				<!-- 	disqus comments	 -->
				<div class="align-block disqus" style="margin-top: 0px;">
					<div class="well">
                    	<h4 class="text-center font-weight-300"><a href="javascript:void(0);" id="disqus">Comments?</a></h4>
                	</div>    
				</div>
				<!--        disqus align block ends        -->
			</div>
		</div>
	</div>
	<!--     #page ends    -->

	<footer>
		<div class="container">
			<div class="row"></div>
		</div>
	</footer>
	<%@include file="/googleAnalytics.jsp"%>
</body>

<!--     Scripts     -->
<script src="assets/js/bootstrap.min.js"></script>

<!--    Nav Scripts     -->
<script src="assets/Nav/js/classie.js"></script>
<script src="assets/Nav/js/borderMenu.js"></script>

<!-- 	Page Specific Scripts	 -->
<script>
	$(function() {
		$.ajax({
			type: 		"get",
			url: 		"/articles",
			data: 		{
							action:'getArticle', 
							articleId:'<%=articleId %>'
						},
			success: 	function(code)
			{
						$('.content').html(code);							
			}
		
		}).error(function(){ alert("error in getting articles"); })
		.complete(function(){});
		
		$('#disqus').click(function(){
			$.ajax({
				type: 		"get",
				url: 		"/articles",
				data: 		{
								action:'getComments', 
								articleId:'<%=articleId %>'
							},
				success: 	function(code)
				{
							$('.disqus').html(code);							
				}
			
			}).error(function(){ })
			.complete(function(){ });
			
		});
		
	}); /* document load function ends */
</script>

</html>