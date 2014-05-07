package com.tackit.facade;


import com.tackit.dao.UserDao;
import com.tackit.domain.DashBoard;
import com.tackit.domain.Tack;
import com.tackit.domain.User;

public class UserManagement {


	public boolean followBoard( String userId, String boardId ){
		
		UserDao ud = new UserDao();
		return ud.followDashBoard(userId, boardId);
		
	}
	

	public boolean followBoard( String userId, String boardId , boolean toFollow ){
		
		UserDao ud = new UserDao();
		if ( toFollow ){
			return ud.followDashBoard(userId, boardId);
		}else{
		
			return ud.unFollowDashBoard( userId, boardId);
		}
		
	}
	
	
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
	
	public  boolean deleteDashBoardById( String userId, String boardId  ) {
		
		UserDao userDao = new UserDao();
		
		return userDao.deleteDashBoardById(userId, boardId);
		
	}
	
}
