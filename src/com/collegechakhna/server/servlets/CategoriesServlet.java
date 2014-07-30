package com.collegechakhna.server.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegechakhna.server.database.DBCategories;

public class CategoriesServlet extends HttpServlet {

	DBCategories db = new DBCategories();
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String action = req.getParameter("action");
		
		if(action.equals("add")){
			String category = req.getParameter("category");
			db.insert(category);
		}
		else if(action.equals("getCategoryList")){
			String html = db.getCategoryList();
			resp.setContentType("text/html");
			resp.getWriter().write(html);
		}
		
	}
	
}
