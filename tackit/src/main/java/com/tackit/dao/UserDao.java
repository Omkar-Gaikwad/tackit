package com.tackit.dao;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.tackit.domain.User;

/**
 * Java MongoDB : Insert a Document
 * 
 */
public class UserDao {

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
	
	
	public User getById( String id){
		
		DB db = MongoConnection.getConn();

		DBCollection collection = db.getCollection("User");

		// search user in  database

		System.out.println(" searching user in db " + id );

		BasicDBObject document = new BasicDBObject();

		document.put("_id", id);

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
}