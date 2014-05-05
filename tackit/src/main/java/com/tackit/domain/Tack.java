package com.tackit.domain;

import java.util.ArrayList;

public class Tack {

	String id;
	String URL;
	ArrayList<DashBoard> dashboardlist;	
	
	
	
	
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		
		if ( null != uRL ){
			URL = uRL;
		}
	}
	public ArrayList<DashBoard> getDashboardlist() {
		return dashboardlist;
	}
	public void setDashboardlist(ArrayList<DashBoard> dashboardlist) {
		this.dashboardlist = dashboardlist;
	}
	
	public void addDashboardlist( DashBoard dashboard ) {
		
		if ( null == this.dashboardlist){
			dashboardlist = new ArrayList<DashBoard>();
		}
		this.dashboardlist.add( dashboard );
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
