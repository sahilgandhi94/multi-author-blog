<!-- 	Check for session	 -->
<%@ include file = "check-session.jsp" %>

<!--     Nav    -->

    <nav id="bt-menu" class="bt-menu">
            <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
            <ul>
                <li><a href="blog.jsp">Home</a></li>
                
                <%
                	if(u != null){
                %>
                <li><a href="dashboard.jsp"><%= u.getUserName() %></a></li>
                <%
                	} else {
                %>
                <li><a href="login.jsp">Author</a></li>
                <%
                	}
                %>
                <li><a href="about.jsp">About us</a></li>                
                <li><a href="story.jsp">Story</a></li>                
                <li><a href="contact.jsp">Contact</a></li>
                <%
                	if(u != null){
                %>
                <li><a href="javascript:void(0)" id="logout">Log Out</a></li>
                <%
                	}
                %>
            </ul>
            <ul>
                <li><a href="http://www.twitter.com/CollegeChakhna" class="bt-icon icon-twitter">Twitter</a></li>
<!--                <li><a href="https://plus.google.com/101095823814290637419" class="bt-icon icon-gplus">Google+</a></li>-->
                <li><a href="http://www.facebook.com/collegedachakhna" class="bt-icon icon-facebook">Facebook</a></li>
<!--                <li><a href="https://github.com/codrops" class="bt-icon icon-github">icon-github</a></li>-->
            </ul>
    </nav>
<!--     Nav ends    -->

<script>
	$('#logout').click(function(){
		$.ajax({
			type:		"get",
			url: 		"/users",
			data: 		{
							action: 'logout',				
						},
			success: 	function(code) {
							window.location= "/";
						}
			
		}).error(function(){
			
		}).complete(function(){
			
		});
		
	});
</script>