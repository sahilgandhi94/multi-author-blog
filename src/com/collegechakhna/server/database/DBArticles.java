package com.collegechakhna.server.database;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpSession;

import com.collegechakhna.server.data.Articles;
import com.collegechakhna.server.data.Users;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;

public class DBArticles extends DBFunctions{

	public void insert(String title, Text description, Text article, HttpSession session)
	{
		Users u = (Users)session.getAttribute("login");
		int userId = u.getUserId();
				
		//Generate a key
		int articleId = generatepk("select articleId from " + Articles.class.getName() , 1, "articleId");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		//Initializing object
		Articles a = new Articles();
		a.setArticleId(articleId);
		a.setTitle(title);
		a.setDescription(description);
		a.setArticle(article);
		a.setPublishedOn(new Date());
		a.setUserId(userId);
		Key key = KeyFactory.createKey(Articles.class.getSimpleName(), articleId);
		a.setKey(key);

		//Creating entry in database
		pm.makePersistent(a);
		pm.close();
	}	

	public void delete(int articleId)
	{
		//Delete Query
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Articles a  = pm.getObjectById(Articles.class,(articleId));
		pm.deletePersistent(a);
		pm.close();
	}

	public String getArticle(int articleId)
	{
		//Select Query

		String html = "",post = "", share = "", about = "", scriptForShare = "", disqus = "";	//initializing return String

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Articles a  = pm.getObjectById(Articles.class,(articleId));
		//		Author details..
		int userId = a.getUserId();		
		Query query = pm.newQuery("select from " + Users.class.getName() + " where userId==" + userId +"");
		List<Users> user = (List<Users>)query.execute();
		Users u = user.get(0);
		//		Simple date format..
		Long date = a.getPublishedOn().getTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMMM yyyy"); 
		String convertedDate = dateFormat.format(date);

		//		Return strings..
//		post = "<div class=\"span11 offset1 blog-post\"><h3 class=\"text-left\">" + a.getTitle() + "</h3><p class=\"date small muted text-left\">" + convertedDate + "</p><hr><pre style=\"margin-left: 20px; text-align: left;\">" + a.getArticle().getValue() + "</pre></div>";		
//		about = "<div class=\"span11 offset1 blog-post\"><h3 class=\"text-left\">About the Author</h3><p style=\"margin-left: 30px;\">" + u.getAboutUser() + "</p><hr></div>";
//		share = "<!-- SHARE --><div class=\"span11 offset1 blog-post\"><br /><p style=\"margin-left:-10px; margin-top: -20px;\"><tag>SHARE ON &nbsp;</tag><!-- TWITTER SHARE --><a href=\"https://twitter.com/share\"  data-via=\"CollegeChakhna\" data-lang=\"en\"><i class=\"icon-twitter\"></i></a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"https://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>	<!-- FACEBOOK SHARE --><a href=\"#\" onclick=\"window.open(\'https://www.facebook.com/sharer/sharer.php?u=\'+encodeURIComponent(location.href), \'facebook-share-dialog\', \'width=626,height=436\'); return false;\"><i class=\"icon-facebook\"></i></a></p><hr></div>";
		post = "<h2><b>" + a.getTitle() + "</b><br><small class=\"text-muted font-weight-300\"><em>" + convertedDate + "</em></small></h2><hr><pre class=\"lead font-weight-300\">" + (a.getDescription()).getValue() + "</pre><br><pre class=\"copy\">" + (a.getArticle()).getValue() + "</pre><br><br><hr>";
		share = "<ul class=\"list-inline\"><li><h4 class=\"font-weight-300 text-muted text-left\"> SPREAD THE WORD </h4></li><li><a href=\"https://twitter.com/share\"  data-via=\"CollegeChakhna\" data-lang=\"en\" class=\"bt-icon icon-twitter\"></a></li><li><a href=\"#\" onclick=\"window.open(\'https://www.facebook.com/sharer/sharer.php?u=\'+encodeURIComponent(location.href), \'facebook-share-dialog\', \'width=626,height=436\'); return false;\" class=\"bt-icon icon-facebook\"></a></li></ul><hr>";
//		scriptForShare = "<!--Twitter Share script--><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"https://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>";
		about = "<h4 class=\"font-weight-300 text-muted\">ABOUT THE AUTHOR</h4><p class=\"lead\">" + u.getAboutUser() + "</p><hr>";
		disqus = "<div class=\"well\"><h4 class=\"text-center font-weight-300\"><a href=\"#\">Comments?</a></h4></div>";
		html += post + share + scriptForShare + about;
		pm.close();
		return html;
	}
	
	public String getComments(int articleId)
	{
		//Select Query

		String disqus = "";	//initializing return String

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Articles a  = pm.getObjectById(Articles.class,(articleId));
		//		Author details..
		int userId = a.getUserId();		
		Query query = pm.newQuery("select from " + Users.class.getName() + " where userId==" + userId +"");
		List<Users> user = (List<Users>)query.execute();
		Users u = user.get(0);
		//		Simple date format..
		Long date = a.getPublishedOn().getTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMMM yyyy"); 
		String convertedDate = dateFormat.format(date);
		
		//		Return strings..		
		disqus = "<div id=\"disqus_thread\"></div><script type=\"text/javascript\">/* * * CONFIGURATION VARIABLES: THIS CODE IS ONLY AN EXAMPLE * * */var disqus_shortname = \'collegechakhna\'; disqus_identifier = \'articleId\';var disqus_title = \'" + a.getTitle() + "\';var disqus_url = \'http://www.college-chakhna.appspot.com/blog-post.jsp?articleId=" + articleId + " \' ; /* * * DON'T EDIT BELOW THIS LINE * * */(function() {var dsq = document.createElement(\'script\'); dsq.type = \'text/javascript\'; dsq.async = true;dsq.src = \'//\' + disqus_shortname + \'.disqus.com/embed.js\';(document.getElementsByTagName(\'head\')[0] || document.getElementsByTagName(\'body\')[0]).appendChild(dsq);})();</script>";
		
//		disqus = "<div class=\"well\"><h4 class=\"text-center font-weight-300\"><a href=\"#\">Returned disqus string</a></h4></div>";
		pm.close();
		return disqus;
	}
	
	
	//	public String select(int articleId)
	//	{
	//		//Select Query
	//
	//		String html="";	//initializing return String
	//		PersistenceManager pm = PMF.get().getPersistenceManager();
	//		Query query = pm.newQuery("select from " + Articles.class.getName() + "");
	//		List<Articles> articles = (List<Articles>)query.execute();
	//
	//		for(int i=0; i< articles.size(); i++)
	//		{
	//			//			Add select query here
	//			//			html += blah blah
	//		}
	//
	//		return html;
	//	}

	public String getArticleList()
	{
		//Select Query

		String html="";	//initializing return String
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery("select from " + Articles.class.getName() + "");
		//		query.setOrdering("publishedOn dsc");
		List<Articles> articles = (List<Articles>)query.execute();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMMM yyyy");
		for(int i=articles.size()-1; i>= 0; i--)
		{
			Articles a = articles.get(i);
			Long date = a.getPublishedOn().getTime();			 
			String convertedDate = dateFormat.format(date);
			//			html+= "<div class=\"row-fluid\"> <div class=\"span3 blog-date\"> <p> <b>Published</b><br/> " + convertedDate + " </p> </div> <div class=\"span9 blog-title\"> <h3 class=\"text-left\">" + a.getTitle() + "</h3> </div> </div> <div class=\"span10 offset2 whitezone-blog\"><p><pre>" + (a.getDescription()).getValue() + "</pre></p><p><a class=\"read-more\" href=\"blog-page.jsp?articleId=" + a.getArticleId() +" \">Read More...</a></p> <hr>	 </div> ";
//			html += "<div class=\"row-fluid\"><div class=\"span3 blog-date\"><p><b>Published</b><br/>" + convertedDate + "</p></div><div class=\"span9 blog-title\"><h2>" + a.getTitle() + "</h2></div></div><div class=\"span10 offset2 whitezone-blog\"><pre>" + (a.getDescription()).getValue() + "</pre><p><a href=\"blog-page.jsp?articleId=" + a.getArticleId() + " \">Read More...</a></p><div class=\"end-post\"></div></div>";
			html+="<a href=\"blog-post.jsp?articleId=" + a.getArticleId() +"\"><h2><b>" + a.getTitle() + "</b></h2><pre class=\"lead font-weight-300\">" + (a.getDescription()).getValue() + "</pre><small class=\"text-muted font-weight-300\"><em>" + convertedDate +"</em></small></a><br><br>";
		}



		pm.close();
		return html;
	}

	public String getRecentArticleList(){
		String html="<ul class=\"popular-posts\">";	//initializing return String
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery("select from " + Articles.class.getName() + "");
		List<Articles> articles = (List<Articles>)query.execute();
		//		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMMM yyyy");
		int j = 6;
		for(int i=articles.size()-1; i>= 0; i--)
		{				
			Articles a = articles.get(i);
			//			Long date = a.getPublishedOn().getTime();			 
			//		    String convertedDate = dateFormat.format(date);
			html += "<li><p>-<a href=\"blog-page.jsp?articleId=" + a.getArticleId() + " \">" + a.getTitle() + "</a></p></li>";			
			if(--j == 0){
				break;
			}
		}       	              
		html += "</ul>";
		pm.close();
		return html;
	}

}	//end class
