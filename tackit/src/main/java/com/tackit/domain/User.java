package com.tackit.domain;

import java.util.ArrayList;

public class User {

	private String id;
	private String email;
	private String password;
	private String firstName;
	private String lastName;

	ArrayList<DashBoard> myBoards;

	ArrayList<DashBoard> followingBoards;

	public User(String id, String email, String password, String firstName,
			String lastName) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public ArrayList<DashBoard> getMyBoards() {
		return myBoards;
	}

	public void setMyBoards(ArrayList<DashBoard> myBoards) {
		this.myBoards = myBoards;
	}

	public void addMyBoards(DashBoard board) {
		if (null == myBoards) {
			myBoards = new ArrayList<DashBoard>();
		}
		myBoards.add(board);
	}

	public ArrayList<String> getDashBoardNames() {

		ArrayList<String> dashBoardNames = new ArrayList<String>();

		if (null != this.myBoards) {

			for (DashBoard d : this.myBoards) {
				dashBoardNames.add(d.getTitle());
			}
		}
		return dashBoardNames;

	}

	public boolean deleteDashBoard(String id) {

		DashBoard d = new DashBoard();
		d.setId(id);
		if (this.myBoards.remove(d))
			return true;
		else
			return false;
	}
	
	public boolean updateDashBoard(String id,String title,String desc) {

		DashBoard d = new DashBoard();
		d.setId(id);
		d.setTitle(title);
		d.setDescription(desc);
	
		int index=this.myBoards.indexOf(d);		
		System.out.println(id+""+title+""+desc +" "+index);
		this.myBoards.set(index, d);
		return true;
	}


	public String getBoardCount() {

		if (myBoards != null)
			return String.valueOf(this.myBoards.size());
		return String.valueOf(0);
	}

	public ArrayList<DashBoard> getFollowingBoards() {
		return followingBoards;
	}

	public void setFollowingBoards(ArrayList<DashBoard> followingBoards) {
		this.followingBoards = followingBoards;
	}

	public void addFollowingBoards(DashBoard board) {
		if (null == followingBoards) {
			followingBoards = new ArrayList<DashBoard>();
		}
		followingBoards.add(board);
	}

	public ArrayList<String> getFollowingDashBoardNames() {

		ArrayList<String> followDashBoardNames = new ArrayList<String>();

		if (null != this.followingBoards) {

			for (DashBoard d : this.followingBoards) {
				followDashBoardNames.add(d.getTitle());
			}
		}
		return followDashBoardNames;
	}
	
	
	public String getFavBoardId(){
		
		for ( DashBoard d : this.myBoards ){
			
			if ( d.getTitle().equals( "MyFavorite") ){
				return d.getId();
			}
			
			
		}
		
		
		return email;
		
	}

}
