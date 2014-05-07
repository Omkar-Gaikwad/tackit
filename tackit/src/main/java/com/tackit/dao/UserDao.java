package com.tackit.dao;

import java.util.Iterator;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.tackit.domain.DashBoard;
import com.tackit.domain.Tack;
import com.tackit.domain.User;

/**
 * Java MongoDB : Insert a Document
 * 
 */
public class UserDao {
	
	
	public boolean followDashBoard( String uId , String boardId){
		
		boolean returnValue = false;
		
		try {
		
		DB db = MongoConnection.getConn();
		
		DBCollection userCollection = db.getCollection("User");
		

		ObjectId usrid = new ObjectId( uId );
		
		BasicDBObject searchUser = new BasicDBObject();			
		
		searchUser.put("_id", usrid );
		
		
		BasicDBObject newDash = new BasicDBObject();			
		newDash.append("followingdashboards", boardId );
		
		BasicDBObject originalDash = new BasicDBObject();			
		originalDash.put("$addToSet", newDash);
		
		userCollection.update(searchUser, originalDash );
		
		returnValue = true;
		
		}catch ( Exception e ){
			e.printStackTrace();
		}

		
		return returnValue;
	
	}
	
	public int addToMyDashBoard ( String uId , String boardId){
		
	
		DB db = MongoConnection.getConn();
	
		DBCollection userCollection = db.getCollection("User");
		

		ObjectId usrid = new ObjectId( uId );
		
		System.out.println("usrid" + usrid );
		
		BasicDBObject searchUser = new BasicDBObject();			
		searchUser.put("_id", usrid );
		
		
		BasicDBObject newDash = new BasicDBObject();			
		newDash.append("dashboards", boardId );
		
		BasicDBObject originalDash = new BasicDBObject();			
		originalDash.put("$addToSet", newDash);
		
		userCollection.update(searchUser, originalDash );
		
		DBCursor cursorDoc2 = userCollection.find();

		while (cursorDoc2.hasNext()) {
			System.out.println(cursorDoc2.next());
		}
		
		
		
		return 0;
	}
	
	public User getUserById( String uid ){
		
		DB db = MongoConnection.getConn();

		DBCollection userCollection = db.getCollection("User");
		
		ObjectId userobjid = new ObjectId( uid );
		
		BasicDBObject searchUserdocument = new BasicDBObject();

		searchUserdocument.put("_id", userobjid );
		
		DBCursor cursorDoc = userCollection.find( searchUserdocument );
		
		while (cursorDoc.hasNext()) {
			
			DBObject userdoc = cursorDoc.next();
		
			User usr = new User();
			
			usr.setId(uid);
			usr.setFirstName( userdoc.get("FirstName").toString() );
			usr.setLastName( userdoc.get("LastName").toString() );
			usr.setEmail( userdoc.get("Email").toString() );
			
			DashBoardDao dbdo = new DashBoardDao();
			
			BasicDBList boardsList = ( BasicDBList ) userdoc.get( "dashboards" );
			
			if ( null != boardsList) {	
				for( Iterator< Object > it = boardsList.iterator(); it.hasNext(); ) {
					String boardListid     =  (String) it.next();
					
					DashBoard d = dbdo.getDashboardById( boardListid );
					
					if ( null != d ){
						usr.addMyBoards(d);
					}						
				}
			}

			BasicDBList followDashBoardsList = ( BasicDBList ) userdoc.get( "followingdashboards" );
			
			if ( null != followDashBoardsList) {	
				for( Iterator< Object > it = followDashBoardsList.iterator(); it.hasNext(); ) {
					String followBoardListid     =  (String) it.next();
					
					DashBoard d = dbdo.getDashboardById( followBoardListid );
					
					if ( null != d ){
						usr.addMyBoards(d);
					}						
				}
				
			}
			
			return usr;
		}
		return null;
	}
	
	
	

	public User getUser(String email) {

		DB db = MongoConnection.getConn();

		DBCollection collection = db.getCollection("User");

		// search user in  database

		System.out.println(" searching user in db ");

		BasicDBObject document = new BasicDBObject();

		document.put("Email", email);

		DBCursor cursorDoc = collection.find( document );
	
		User u = null;

		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			System.out.println( doc );
			
			u = new User();	
			
			u.setId( doc.get("_id").toString());
			u.setEmail( doc.get("Email").toString());
			u.setPassword( doc.get("Password").toString());
			u.setFirstName( doc.get("FirstName").toString() );
			u.setLastName( doc.get("LastName").toString());
			
		}

		return u;

	}
	
	

	public int addUser(User u) {

		DB db = MongoConnection.getConn();

		DBCollection collection = db.getCollection("User");

		// add user to database

		System.out.println(" adding user to  db ");

		BasicDBObject document = new BasicDBObject();

		document.put("Email", u.getEmail());
		document.put("FirstName", u.getFirstName());
		document.put("LastName", u.getLastName());
		document.put("Password", u.getPassword());

		collection.insert(document);

		DBCursor cursorDoc = collection.find();

		while (cursorDoc.hasNext()) {
			System.out.println(cursorDoc.next());
		}

		return 0;
	}
	
	
	public User getUserDetailsNodashById( String id){	// only User no dash boards
		
		DB db = MongoConnection.getConn();

		DBCollection collection = db.getCollection("User");

		// search user in  database

		System.out.println(" searching user in db " + id );
		
		
		ObjectId userobjid = new ObjectId( id );
		
		BasicDBObject searchUserDocument = new BasicDBObject();

		searchUserDocument.put("_id", userobjid );


		DBCursor cursorDoc = collection.find( searchUserDocument );
		
		User u = null;

		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			System.out.println( doc );
			
			u = new User();	
			
			u.setId( doc.get("_id").toString());
			u.setEmail( doc.get("Email").toString());
			u.setPassword( doc.get("Password").toString());
			u.setFirstName( doc.get("FirstName").toString() );
			u.setLastName( doc.get("LastName").toString());
			
		}
		return u;
	}
	
	
public boolean deleteDashBoardById( String userId , String boardId ){

		boolean returnVal = false ;
		
		try { 
			
			DB db = MongoConnection.getConn();
			
			DBCollection userCollection = db.getCollection("User");
			
			ObjectId objid = new ObjectId(userId); // search user
	
			BasicDBObject searchUser = new BasicDBObject(); // search user
																// query
			searchUser.put("_id", objid);
			
			BasicDBObject rmBoard = new BasicDBObject(); // remove tack from board
			rmBoard.append("dashboards", boardId );
			
			BasicDBObject newDashBoardList = new BasicDBObject();
			newDashBoardList.put("$pull", rmBoard ); // remove tack to array
			
			System.out.println("newDashBoardList  " + newDashBoardList);
			
			userCollection.update( searchUser , newDashBoardList); // update board
			
			// ===========================================
			
			DashBoardDao dashDao = new DashBoardDao();
			
			returnVal = dashDao.removeDashBoardById(boardId);
		
		} catch ( Exception e ){
			
			e.printStackTrace();
			
		}
		
		return returnVal;
		
	}
	
	
}