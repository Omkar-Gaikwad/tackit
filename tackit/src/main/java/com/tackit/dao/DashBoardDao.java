package com.tackit.dao;

import java.util.ArrayList;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.tackit.domain.DashBoard;
import com.tackit.domain.User;


public class DashBoardDao{
	
	public int addDash( DashBoard d ){
		
		DB db = MongoConnection.getConn();

		DBCollection collection = db.getCollection("DashBoard");

		System.out.println("  Adding dash in database ");
		
		BasicDBObject document = new BasicDBObject();

		document.put("Title", d.getTitle() );
		
		document.put( "Owner" , d.getOwner() );
		
		ArrayList<BasicDBObject> followersList = new ArrayList<BasicDBObject>();
		
		collection.insert(document);
		
		DBCursor cursorDoc = collection.find( document );
		

		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			System.out.println( doc );
			
		}
		
		return 0;
	}
	
}