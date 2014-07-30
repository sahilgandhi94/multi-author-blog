package com.collegechakhna.server.database;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpSession;

import com.collegechakhna.server.data.Users;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class DBUsers extends DBFunctions {
	
	public void insert(String userName, String password, String userEmail, String aboutUser, Boolean isAdmin){
		int userId = generatepk("select userId from " + Users.class.getName() , 1, "userId");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Users u = new Users();
		u.setUserId(userId);
		u.setUserName(userName);
		u.setUserEmail(userEmail);
		u.setPassword(password);
		u.setAboutUser(aboutUser);
		u.setAdmin(isAdmin);
		Key key = KeyFactory.createKey(Users.class.getSimpleName(), userId);
		pm.makePersistent(u);
		pm.close();
	}
	
	public void setAdmin(int userId){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Users u = pm.getObjectById(Users.class,(userId));
		u.setAdmin(true);
		pm.makePersistent(u);
		pm.close();
	}
	
	public void updateUser(String aboutUser, String userName, HttpSession session){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Users ui = (Users)session.getAttribute("login");
		int userId = ui.getUserId();
		Query query = pm.newQuery("select from " + Users.class.getName() + " where userId==" + userId );
		List<Users> userList = (List<Users>) query.execute();
		if(!userList.isEmpty()){
//			Users u = pm.getObjectById(Users.class,(userId));
			Users u = userList.get(0);
			u.setUserName(userName);
//			u.setUserPenName(userPenName);
			u.setAboutUser(aboutUser);
			pm.makePersistent(u);
		}		
		pm.close();
	}
	
	
	//	SESSION - LOG IN - LOG OUT
	
	public HttpSession setSession(HttpSession session, Users users){
		session.setMaxInactiveInterval(60*60);
		session.setAttribute("login", users);
		return session;
	}
	
	public String login(String userEmail, String password, HttpSession session){
		String test = "";
		try {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Query query = pm.newQuery("select from " + Users.class.getName() + " where userEmail=='" + userEmail.toLowerCase() + "'");
			List<Users> userList = (List<Users>) query.execute();
			if(userList.size()>0){
				Users users = (Users) userList.get(0);
				if (users.getUserEmail().equalsIgnoreCase(userEmail))
				{
					if (password.equals(users.getPassword()))
					{
						test = "login-success";
						setSession(session, users);
						return test;
					}
					else{
						return "login-fail";
					}
				}
			}else{
				test = "no-user";
				return test;
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			test = "login-fail";
			return test;
		}
		
		return test;
	}

	public void logout(HttpSession session){
		session.invalidate();
	}
	
}	// end class
