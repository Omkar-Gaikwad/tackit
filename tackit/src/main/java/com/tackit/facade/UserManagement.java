package com.tackit.facade;


import com.tackit.dao.UserDao;
import com.tackit.domain.DashBoard;
import com.tackit.domain.Tack;
import com.tackit.domain.User;

public class UserManagement {

	
	public int createUser( User u ){
		UserDao ud = new UserDao();
		return ud.addUser(u);
	}
	

	
	public User getUserBoardsAndTacks(  String usersObjId ){
		
		UserDao ud = new UserDao();
		
		User u = ud.getUserById(usersObjId);
		
		return u;
		
	}
	
	
	
	public User getUserInfo(  String email , String password ){
		
		UserDao ud = new UserDao();
		
		User u = ud.getUser(email);
		
		return u;
		
	}
	
	
	public int validateUser( String email , String password ){
		
		int returnVal = 0;
		
		UserDao ud = new UserDao();
		
		User u = ud.getUser(email);
		
		
		if ( null == u ){
			returnVal = -99;
		}else if ( u.getPassword().equals(password)){
			returnVal = 0;
		}else{
			returnVal = -1;
		}
		
		return returnVal;
		
	}
	
}
