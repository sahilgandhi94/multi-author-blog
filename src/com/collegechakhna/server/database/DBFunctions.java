package com.collegechakhna.server.database;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

public class DBFunctions {

	public MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();
	PersistenceManager pm =null;

	public void createEntity(Object object)
	{
		pm = PMF.get().getPersistenceManager();
		pm.makePersistent(object);
		if(!pm.isClosed()){
			pm.close();
		}
	}

		public Object selection(String query)
		{
			pm = PMF.get().getPersistenceManager();
			Object object = pm.newQuery(query).execute();
	
			return object;
		}
	
		public Object selection(String query, PersistenceManager pm)
		{
	
			Object object = pm.newQuery(query).execute();
	
			return object;
		}

	
	//generatepk("select id from " +Events.class.getName() , id, "id");
	public synchronized Integer generatepk(String queryString, int idToStart, String coloumnName)
	{
		Integer id= (Integer)syncCache.get(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC");

		if(id==null){
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try
			{

				Query query = pm.newQuery(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC");
				query.setRange(0, 2);

				List<Integer> user1 = (List<Integer>) query.execute();
				if (user1.size() >= 1)
				{
					pm.close();
					syncCache.put(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC",(user1.get(0) + 1));
					return user1.get(0) + 1;
				}

				else
				{
					pm.close();
					syncCache.put(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC",idToStart);
					return idToStart;
				}
			}
			catch (Exception e)
			{
				pm.close();
				syncCache.put(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC",idToStart);
				return idToStart;
			}
		}else{
			syncCache.put(queryString +" where "+coloumnName+" != null ORDER BY "+coloumnName+" DESC",(id+1));
			return id + 1;
		}
	}

}   


