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

	
	public DashBoard getDashboardById( String did ){
		
		DB db = MongoConnection.getConn();

		DBCollection dashCollection = db.getCollection("DashBoard");
		
		ObjectId boardobjid = new ObjectId( did );
		
		BasicDBObject searchDashdocument = new BasicDBObject();

		searchDashdocument.put("_id", boardobjid );
		
		DBCursor cursorDoc = dashCollection.find( searchDashdocument );
		
		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			DashBoard board = new DashBoard();
			
			board.setTitle( doc.get("Title").toString()  );
			
			System.out.println(  "board.getTitle" + board.getTitle()    );
			
			board.setId(did);
			board.setOwner( doc.get("Owner").toString() );
			
			BasicDBList tacksList = ( BasicDBList ) doc.get( "Tacks" );
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
			return board;		
		}		
		return null;
	}
	
	
	public int addDash( DashBoard d ){
		
		DB db = MongoConnection.getConn();

		DBCollection dashCollection = db.getCollection("DashBoard");

		System.out.println(" Adding dash in database ");
		
		BasicDBObject Dashdocument = new BasicDBObject();

		Dashdocument.put("Title", d.getTitle() );
		
		Dashdocument.put( "Owner" , d.getOwner() );
		
		ArrayList<BasicDBObject> followersList = new ArrayList<BasicDBObject>();
		
		dashCollection.insert(Dashdocument);
		
		DBCursor cursorDoc = dashCollection.find( Dashdocument );
		
		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			String dashId = doc.get("_id").toString();
			
			System.out.println("dashboards" + dashId);
			
			System.out.println( doc );
			
			ObjectId objid = new ObjectId( d.getOwner() );
			
			System.out.println("objid" + objid );
			
			BasicDBObject searchUser = new BasicDBObject();			
			searchUser.put("_id", objid );
			
			
			BasicDBObject newDash = new BasicDBObject();			
			newDash.append("dashboards", dashId );
			
			BasicDBObject originalDash = new BasicDBObject();			
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