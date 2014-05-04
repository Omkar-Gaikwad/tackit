package com.tackit.domain;

import java.util.ArrayList;

import com.tackit.dao.DashBoardDao;

public class DashBoard {
	
	String title;
	String owner;
	ArrayList<User> followerlist;
	ArrayList<Tacks> tacks;
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public ArrayList<User> getFollowerlist() {
		return followerlist;
	}

	public void setFollowerlist(ArrayList<User> followerlist) {
		this.followerlist = followerlist;
	}


	public void addFollowerlist( User follower ) {
		
		if ( null == followerlist ){
			followerlist = new ArrayList<User>();
		}
		
		this.followerlist.add( follower );
		
	}

	public ArrayList<Tacks> getTacks() {
		return tacks;
	}

	public void setTacks(ArrayList<Tacks> tacks) {
		this.tacks = tacks;
	}


	public void addTacks( Tacks tack) {
		
		if( null == tacks ){
			tacks = new ArrayList<Tacks>();
		}
		tacks.add(tack);;
	}

	
	public static void main(String[] args) {
		
		DashBoard db = new DashBoard();
		
		db.setTitle("My Dash");
		db.setOwner("someid");
		
		DashBoardDao dbd = new DashBoardDao();
		
		dbd.addDash(db);
	}
	
}
