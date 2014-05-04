package com.tackit.dao;

import java.util.Iterator;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.tackit.domain.Tack;

public class TackDao {
	
	public Tack getTackbyId( String id ){
		
		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack");
		
		ObjectId tackobjid = new ObjectId( id );
		
		BasicDBObject seaarchtackdocument = new BasicDBObject();

		seaarchtackdocument.put("_id", tackobjid );
		
		DBCursor cursorDoc = tackCollection.find(seaarchtackdocument);
		
		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
		
			Tack t = new Tack();
			
			t.setId(id);;
			t.setURL(  doc.get("URL").toString() );
			
			return t;
		
		}		
		
		return null;
		
		
	}

	
	public int addTack( String b ,  Tack t ){
		
		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack");

		System.out.println(" Adding tack in database ");
		
		BasicDBObject tackdocument = new BasicDBObject();

		tackdocument.put("URL", t.getURL() );
		
		tackdocument.put( "Board" , b );
		
		tackCollection.insert(tackdocument);
		
		DBCursor cursorDoc = tackCollection.find(tackdocument);
		
		while (cursorDoc.hasNext()) {
			
			DBObject doc = cursorDoc.next();
			
			String tackId = doc.get("_id").toString();
			
			DBCollection dashCollection = db.getCollection("DashBoard");
			
			System.out.println("tackId" + tackId);
			
			System.out.println( doc );
			
			ObjectId objid = new ObjectId( b );
			
			System.out.println("objid" + objid );
			
			BasicDBObject searchBoard = new BasicDBObject();			
			searchBoard.put("_id", objid );
			
			BasicDBObject newTack = new BasicDBObject();			
			newTack.append("Tacks", tackId );
			
			BasicDBObject newTackList = new BasicDBObject();			
			newTackList.put("$push", newTack );
			
			System.out.println("newTack" + newTackList);
			
			dashCollection.update( searchBoard , newTackList );
			
			DBCursor cursorDoc2 = dashCollection.find();

			while (cursorDoc2.hasNext()) {
				System.out.println(cursorDoc2.next());
			}
			
		}
		
		return 0;
		
	}

	
}
