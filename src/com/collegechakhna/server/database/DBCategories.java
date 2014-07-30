package com.collegechakhna.server.database;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.collegechakhna.server.data.Articles;
import com.collegechakhna.server.data.Categories;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class DBCategories extends DBFunctions {
		
	public void insert(String category){
		//Insert Query

		//Generate a key
		int categoryId = generatepk("select categoryId from " + Categories.class.getName() , 1, "categoryId");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		//Initializing object
		Categories c = new Categories();
		c.setCatrgoryId(categoryId);
		c.setCategory(category);
		Key key = KeyFactory.createKey(Articles.class.getSimpleName(), categoryId);
		c.setKey(key);

		//Creating entry in database
		pm.makePersistent(c);
		pm.close();
	}
	
	public void delete(int categoryId)
	{
		//Delete Query
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Categories c  = pm.getObjectById(Categories.class,(categoryId));
		pm.deletePersistent(c);
		pm.close();
	}
	
	public String getCategoryList()
	{
		//Select Query

		String html="";	//initializing return String
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery("select from " + Categories.class.getName() + "");
		List<Categories> categories = (List<Categories>)query.execute();
		
		for(int i=0; i< categories.size(); i++)
		{
			Categories c = categories.get(i);
			html+="";					
		}
		pm.close();
		return html;
	}
	
}
