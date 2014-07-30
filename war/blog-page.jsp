<!-- backward compatibility -->
<% 
Integer articleId = Integer.parseInt(request.getParameter("articleId")); 
%>

<script>
	
	window.location = "/blog-post.jsp?articleId=<%= articleId%>";
	
</script>