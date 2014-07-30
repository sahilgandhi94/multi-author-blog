package com.collegechakhna.server.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegechakhna.Constants;

import com.collegechakhna.server.database.DBArticles;
import com.google.appengine.api.datastore.Text;

public class ArticlesServlet extends HttpServlet {

	DBArticles db = new DBArticles();

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		try {
			String action = req.getParameter("action");

			//			if(action.equals("add")){
			//				String title = req.getParameter("title");
			//				Text description = new Text(req.getParameter("description"));
			//				Text article = new Text(req.getParameter("article"));
			//				int userId = Integer.parseInt(req.getParameter("userId"));
			//				db.insert(title, description, article, userId);
			//			}
			//			else 
			if(action.equals("delete")){
				int articleId = Integer.parseInt(req.getParameter(Constants.ID));
				db.delete(articleId);
			}
			else if (action.equals("getArticleList")){
				String html = db.getArticleList();
				resp.setContentType("text/html");
				resp.getWriter().write(html);
			}
			else if (action.equals("getRecentArticleList")){
				String html = db.getRecentArticleList();
				resp.setContentType("text/html");
				resp.getWriter().write(html);
			}
			else if (action.equals("getArticle")){
				int articleId = Integer.parseInt(req.getParameter("articleId"));
				String html = db.getArticle(articleId);
				resp.setContentType("text/html");
				resp.getWriter().write(html);
			} 
			else if(action.equals("getComments")){
				int articleId = Integer.parseInt(req.getParameter("articleId"));
				String html = db.getComments(articleId);
				resp.setContentType("text/html");
				resp.getWriter().write(html);
			}


		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		try {
			String action = req.getParameter("action");

			if(action.equals("add")){
				String title = req.getParameter("title");
				Text description = new Text(req.getParameter("description"));
				Text article = new Text(req.getParameter("article"));
				//				int userId = Integer.parseInt(req.getParameter("userId"));
				db.insert(title, description, article, req.getSession());
			}
			//			else if(action.equals("delete")){
			//				int articleId = Integer.parseInt(req.getParameter(Constants.ID));
			//				db.delete(articleId);
			//			}
			//			else if (action.equals("getArticleList")){
			//				String html = db.getArticleList();
			//				resp.setContentType("text/html");
			//				resp.getWriter().write(html);
			//			}
			//			else if (action.equals("getArticle")){
			//				int articleId = Integer.parseInt(req.getParameter("articleId"));
			//				String html = db.getArticle(articleId);
			//				resp.setContentType("text/html");
			//				resp.getWriter().write(html);
			//			}
			//			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
