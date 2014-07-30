package com.collegechakhna.server.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegechakhna.server.database.DBUsers;

public class UsersServlet extends HttpServlet {
	
	DBUsers db = new DBUsers();
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String action = req.getParameter("action");
		
		if (action.equals("add")){
			String userName = req.getParameter("userName");
			String userPenName = req.getParameter("userPenName");
			String userEmail = req.getParameter("userEmail");
			String password = req.getParameter("password");			
			String aboutUser = req.getParameter("aboutUser"); 
			String isadmin = req.getParameter("isadmin");
			Boolean isAdmin;
			if(isadmin.equals("true"))
				isAdmin = true;
			else
				isAdmin = false;
			
			db.insert(userName, password, userEmail, aboutUser, isAdmin);
		}
		else if(action.equals("setAdmin")){
			int userId = Integer.parseInt(req.getParameter("userId"));
			db.setAdmin(userId);
		}	
		else if(action.equals("update")){
			String userName = req.getParameter("userName");
//			String userPenName = req.getParameter("userPenName");
			String aboutUser = req.getParameter("aboutUser");
			db.updateUser(aboutUser, userName, req.getSession());
		}
		else if(action.equals("login")){
			String userEmail = req.getParameter("userEmail");
			String password = req.getParameter("password");
			String test = db.login(userEmail, password, req.getSession());
			resp.setContentType("text/html");
			resp.getWriter().write(test);
		}
		else if(action.equals("logout")){
			db.logout(req.getSession());
		}
	}

}
