package com.collegechakhna.server.database;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public final class PMF {
	private static PersistenceManagerFactory pmfTempInstance = null;
	public synchronized static PersistenceManagerFactory getShortObj() {

		if(pmfTempInstance==null)
		{
			pmfTempInstance = JDOHelper.getPersistenceManagerFactory("eventual-reads-short-deadlines");
		}
		return pmfTempInstance;
	}

	private static PersistenceManagerFactory pmfInstance = null;

	private PMF() {}

	public synchronized static PersistenceManagerFactory get() {

		if(pmfInstance==null)
		{
			pmfInstance = JDOHelper.getPersistenceManagerFactory("transactions-optional");
		}
		return pmfInstance;
	}  
}
