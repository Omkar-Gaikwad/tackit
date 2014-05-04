package com.tackit.domain;

import java.util.ArrayList;

public class Tacks {

	String URL;
	ArrayList<String> tags;
	ArrayList<String> comments;
	
	
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
	
	public ArrayList<String> getComments() {
		return comments;
	}
	
	public void addComments( String comment) {
		
		if ( null == comments ){
			comments = new ArrayList<String>();
		}
		
		this.comments.add(comment);
	}	
	
	public void setComments(ArrayList<String> comments) {
		this.comments = comments;
	}

}
