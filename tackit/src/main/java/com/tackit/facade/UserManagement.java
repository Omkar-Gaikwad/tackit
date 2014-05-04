package com.tackit.facade;


import com.tackit.dao.UserDao;
import com.tackit.domain.DashBoard;
import com.tackit.domain.Tack;
import com.tackit.domain.User;

public class UserManagement {

	public static void main(String[] args) {

		//UserDao ud = new UserDao();
		/*
		 * for (int i = 0; i < 10; i++) {
		 * 
		 * User u = new User(null, "omkar" + i + "@omkar.com", "password",
		 * "firstName" + i , "lastName" + i );
		 * 
		 * um.addUser(u); }
		 */
/*
		int i = 0;
		User u;
		u = ud.getUser("omkar" + i + "@omkar.com");*/

		User u;
		
		UserDao udo = new UserDao();
		
		udo.addToMyDashBoard("5365acd80c525dfe076a7b8e", "5365d71f0c5259f3b6445fec");
		
		u = udo.getUserById("5365acd80c525dfe076a7b8e");
		
		
		System.out.println(" id " + u.getId() + "\n name " + u.getFirstName()
				+ "\n last name " + u.getLastName() + "\n password"
				+ u.getPassword());
		
		for ( DashBoard d : u.getMyBoards()){
			System.out.println("db.toString() " + d.toString() + "number of urls " );
			
			if ( null != d.getTacks() ){
				for ( Tack t1 : d.getTacks() ){
					
					System.out.println(t1.getURL()+t1.getId());
					
				}
			}
			
			
		}

	}
	
	public int createUser( User u ){
		UserDao ud = new UserDao();
		return ud.addUser(u);
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
