package com.tackit.domain;

import java.util.ArrayList;

public class User {

	private String id;	
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	
	ArrayList<DashBoard> myBoards;
	
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
	
	public void addMyBoards( DashBoard board ){
		if ( null == myBoards ){
			myBoards = new ArrayList<DashBoard>();
		}
		myBoards.add(board);
	}
		
}

