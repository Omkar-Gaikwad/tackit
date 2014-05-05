package com.tackit.domain;

import java.util.ArrayList;

import com.tackit.dao.DashBoardDao;
import com.tackit.dao.TackDao;

public class DashBoard {
	
	String id;
	String title;
	User owner;
	String description;
	ArrayList<User> followerlist;
	private ArrayList<Tack> tackList;
	

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




	public void addTacks( Tack tack) {
		
		if( null == getTackList() ){
			setTackList(new ArrayList<Tack>());
		}
		getTackList().add(tack);;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		
		System.out.println("db.toString() " + db.toString() + "number of urls " + db.getTackList().size() );
		
		for ( Tack t1 : db.getTackList() ){
			
			System.out.println(t1.getURL() + "       " + t1.getId());
			
		}
		
	}

	public ArrayList<Tack> getTackList() {
		return tackList;
	}

	public void setTackList(ArrayList<Tack> tackList) {
		this.tackList = tackList;
	}


	
}
