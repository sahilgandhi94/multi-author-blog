<%@page import = "com.collegechakhna.server.data.Users" %>	
	<%
		Users u = (Users)session.getAttribute("login");
		int userId;
		if (u != null){
			String aboutUser = u.getAboutUser();
			userId = u.getUserId();
		}
	%>
    