package com.tackit.domain;

import java.util.ArrayList;

public class Tacks {

	String URL;
	ArrayList<String> tags;

	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public ArrayList<String> getTags() {
		return tags;
	}
	
	public void addTags( String tag ) {
		
		if ( null == tags ){
			tags = new ArrayList<String>();
		}
	
		tags.add(tag);
	}
	
	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}
	
	

}
