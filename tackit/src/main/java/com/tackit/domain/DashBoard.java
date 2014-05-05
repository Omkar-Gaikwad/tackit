package com.tackit.domain;

import java.util.ArrayList;

import com.tackit.dao.DashBoardDao;
import com.tackit.dao.TackDao;

public class DashBoard {
	
	String id;
	String title;
	User owner;
	ArrayList<User> followerlist;
	ArrayList<Tack> tackList;
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		
		if ( null == this.owner ){
			this.owner = new User();
		}
		
		this.owner.setId( owner );
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

	public ArrayList<Tack> getTacks() {
		return tackList;
	}

	public void setTacks(ArrayList<Tack> tacks) {
		this.tackList = tacks;
	}


	public void addTacks( Tack tack) {
		
		if( null == tackList ){
			tackList = new ArrayList<Tack>();
		}
		tackList.add(tack);;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public static void main(String[] args) {
		
		/*
		DashBoard db = new DashBoard();
		
		db.setTitle("My Dash");
		db.setOwner("5365d64f036434a33d151d43");
		
		DashBoardDao dbd = new DashBoardDao();
		
		dbd.addDash(db);*/
	
		Tack t = new Tack();
		
		t.setURL("MyURLNew");
		
		TackDao tbd = new TackDao();
		
		tbd.addTack( "5365d71f0c5259f3b6445fec", t);		
		
		DashBoardDao dbd = new DashBoardDao();
		
		DashBoard db = dbd.getDashboardById("5365d71f0c5259f3b6445fec");
		
		System.out.println("db.toString() " + db.toString() + "number of urls " + db.getTacks().size() );
		
		for ( Tack t1 : db.getTacks() ){
			
			System.out.println(t1.getURL() + "       " + t1.getId());
			
		}
		
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
}
