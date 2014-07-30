package com.collegechakhna.server.data;

import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable
public class Categories implements Serializable {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
    public Key getKey() {
        return key;
    }
    
    public void setKey(Key key) {
        this.key = key;
    }
    
    @Persistent
    private int catrgoryId;

	public int getCatrgoryId() {
		return catrgoryId;
	}

	public void setCatrgoryId(int catrgoryId) {
		this.catrgoryId = catrgoryId;
	}

	@Persistent
	private String category;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
