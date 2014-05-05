package com.tackit.dao;

import java.util.ArrayList;
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

public class DashBoardDao{
	
	public DashBoard getDashBoardNameAndOwner( String dashBoardId ){ // get dash board name and owner only no tacks
		
		DB db = MongoConnection.getConn();

		DBCollection dashBoardCollection = db.getCollection("DashBoard"); // open connection
		
		ObjectId dashBoardIdObj = new ObjectId( dashBoardId );
		
		BasicDBObject searchDashdocument = new BasicDBObject(); // create search document

		searchDashdocument.put("_id", dashBoardIdObj );
		
		DBCursor cursordashBoardCollection = dashBoardCollection.find( searchDashdocument ); // get doc from database
		
		DashBoard board = null;
		
		while ( cursordashBoardCollection.hasNext() ) {
			
			DBObject dashBoardDoc = cursordashBoardCollection.next();
			
			board = new DashBoard();
			
			System.out.println(dashBoardDoc);
			
			board.setTitle( dashBoardDoc.get("Title").toString()  );	// get title
			
			System.out.println(  "board.getTitle" + board.getTitle()    );
			
			board.setId( dashBoardId );	// set id
			
			board.setOwner( dashBoardDoc.get("Owner").toString() ); // set owner id 
			
			board.setOwner( dashBoardDoc.get("Owner").toString() ); // set Description
			
			UserDao userDao = new UserDao();
			
			board.setOwner(  userDao.getUserDetailsNodashById( board.getOwner().getId() ));	// set owner user object
			
			break;		
		}			
		
		return board;
		
	}

	
	public DashBoard getDashboardById( String dashBoardId ){ // gives back tacks
		
		DB db = MongoConnection.getConn();

		DBCollection dashBoardCollection = db.getCollection("DashBoard");	// get collection
		
		ObjectId boardIdObj = new ObjectId( dashBoardId );
		
		BasicDBObject searchDashdocument = new BasicDBObject();

		searchDashdocument.put("_id", boardIdObj );		// create search document
		
		DBCursor cursorDashBoard = dashBoardCollection.find( searchDashdocument );  // get cursor
		
		DashBoard board = null;
		
		while ( cursorDashBoard.hasNext()) {
			
			DBObject dashBoardDoc = cursorDashBoard.next();
			
			System.out.println(  " dashBoardDoc "  + dashBoardDoc );
			
			board = new DashBoard();
			
			board.setTitle( dashBoardDoc.get("Title").toString()  );	// set title
			
			board.setId( dashBoardId );						// set dashboard id
			
			board.setOwner( dashBoardDoc.get("Owner").toString() );
			
			board.setDescription( dashBoardDoc.get("Description").toString() );
			
			BasicDBList tacksList = ( BasicDBList ) dashBoardDoc.get( "Tacks" );
			
			if ( null != tacksList ){
				
				TackDao tdo = new TackDao();
				
				for( Iterator< Object > it = tacksList.iterator(); it.hasNext(); ) {
					String tackListid     =  (String) it.next();
					
					System.out.println("tackListObj  " + tackListid);
					
					Tack t = tdo.getTackbyId( tackListid );
					
					if ( null != t ){
						board.addTacks(t);
					}				
				}		
			}
			break;		
		}		
		return board;
	}
	
	
	public int addDash( DashBoard dashBoardtoAdd ){
		
		DB db = MongoConnection.getConn();

		DBCollection dashCollection = db.getCollection("DashBoard");

		System.out.println(" Adding dash in database ");
		
		BasicDBObject Dashdocument = new BasicDBObject();	// this is dash to add

		Dashdocument.put("Title", dashBoardtoAdd.getTitle() );
		
		Dashdocument.put( "Owner" , dashBoardtoAdd.getOwner() );
		
		Dashdocument.put( "Description" , dashBoardtoAdd.getDescription() );
		
		dashCollection.insert(Dashdocument);	// add new dash board
		
		DBCursor cursorDoc = dashCollection.find( Dashdocument ); // get same dash back
		
		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			String dashId = doc.get("_id").toString();	// get dash id new field
			
			System.out.println( doc );
			
			ObjectId objid = new ObjectId( dashBoardtoAdd.getOwner().getId() ); 	// search for user
			
			System.out.println("objid" + objid );
			
			BasicDBObject searchUser = new BasicDBObject();	// search for user		
			searchUser.put("_id", objid );
			
			
			BasicDBObject newDash = new BasicDBObject();			// crate push object
			newDash.append("dashboards", dashId );
			
			BasicDBObject originalDash = new BasicDBObject();		// puch array	
			originalDash.put("$push", newDash);
		
			System.out.println("originalDash" + originalDash);
			
			DBCollection userCollection = db.getCollection("User");
			
			userCollection.update(searchUser, originalDash );
			
			DBCursor cursorDoc2 = userCollection.find();

			while (cursorDoc2.hasNext()) {
				System.out.println(cursorDoc2.next());
			}
			
		}
		
		return 0;
	}
	
	
}