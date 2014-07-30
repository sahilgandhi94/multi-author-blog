<%@page import = "com.collegechakhna.server.data.Users" %>	
	<%
		Users u = (Users)session.getAttribute("login");
		if (u == null){
	%>
		<script>
		alert("Please login first");
		window.location="/login.jsp";
		</script>
	<%
		return;
		}
		
		String aboutUser = u.getAboutUser();
		int userId = u.getUserId();
	%>
    
    <!-- === MENU === -->
    <div class="navbar">
    	<div class="navbar-inner">    		
    			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    			</a>
    			
    			<a id="logo" href="blog.jsp" class="brand loveloblack"><img src="assets/img/cc/cc-logo.png" alt="" style="height: 30px; width: 30px;" > &nbsp; COLLEGE CHAKHNA | Authors</a>
    			
    			<div class="nav-collapse collapse"  id="in-nav" style="height: 0px;">
					<ul class="nav pull-right">		
						<!-- <li> <a href="story">Story</a></li>              
		              	<li><a href="register">Sign Up</a></li> -->
		              	<li><a href="#" onclick="return false;" id="logout">Log Out</a></li>
		            </ul>
				</div>
    	</div>
    </div>
    
