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

public class TackDao {

	
	public ArrayList<Tack> getLastNTacksDashandUserInfo( int n ) {

		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack"); // get tacks
																// collection

		DBObject orderBy = new BasicDBObject("_id",-1);
		
		DBCursor cursorTacks = tackCollection.find().sort(orderBy).limit(n);

		ArrayList<Tack> allTacks = new ArrayList<Tack>(); // array list to
															// return tacks

		while (cursorTacks.hasNext()) {

			try {

				DBObject tackDoc = cursorTacks.next();

				Tack t = new Tack();

				t.setId(tackDoc.get("_id").toString());
				t.setURL(tackDoc.get("URL").toString());

				BasicDBList boardsList = (BasicDBList) tackDoc.get("Board");

				if (null != boardsList) {

					DashBoardDao dashBoardDao = new DashBoardDao();

					for (Iterator<Object> it = boardsList.iterator(); it
							.hasNext();) {
						String boardListId = (String) it.next();

						System.out.println("boardListId  " + boardListId);

						DashBoard dashBoard = dashBoardDao
								.getDashBoardNameAndOwner(boardListId);

						if (null != dashBoard) {
							t.addDashboardlist(dashBoard);
						}
					}
				}

				allTacks.add(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return allTacks;
	}
	
	
	public ArrayList<Tack> getAllTacksDashandUserInfo() {

		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack"); // get tacks
																// collection

		DBCursor cursorTacks = tackCollection.find();

		ArrayList<Tack> allTacks = new ArrayList<Tack>(); // array list to
															// return tacks

		while (cursorTacks.hasNext()) {

			try {

				DBObject tackDoc = cursorTacks.next();

				Tack t = new Tack();

				t.setId(tackDoc.get("_id").toString());
				t.setURL(tackDoc.get("URL").toString());

				BasicDBList boardsList = (BasicDBList) tackDoc.get("Board");

				if (null != boardsList) {

					DashBoardDao dashBoardDao = new DashBoardDao();

					for (Iterator<Object> it = boardsList.iterator(); it
							.hasNext();) {
						String boardListId = (String) it.next();

						System.out.println("boardListId  " + boardListId);

						DashBoard dashBoard = dashBoardDao
								.getDashBoardNameAndOwner(boardListId);

						if (null != dashBoard) {
							t.addDashboardlist(dashBoard);
						}
					}
				}

				allTacks.add(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return allTacks;
	}

	public Tack getTackbyId(String tackId) {

		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack");

		ObjectId tackobjid = new ObjectId(tackId);

		BasicDBObject seaarchtackdocument = new BasicDBObject();

		seaarchtackdocument.put("_id", tackobjid);

		DBCursor cursorDoc = tackCollection.find(seaarchtackdocument);

		Tack t = null;

		while (cursorDoc.hasNext()) {

			DBObject doc = cursorDoc.next();

			System.out.println(" tack dao get tack by id " + doc);

			t = new Tack();

			t.setId(tackId);

			t.setURL(doc.get("URL").toString());

			break;
		}

		return t;

	}

	public int addTack(String boardId, Tack tack) {

		DB db = MongoConnection.getConn();

		DBCollection tackCollection = db.getCollection("Tack");

		BasicDBObject tackdocument = new BasicDBObject();

		tackdocument.put("URL", tack.getURL()); // create tack with url

		System.out.println(" Adding tack in database " + tackdocument);

		tackCollection.insert(tackdocument); // // add tack

		DBCursor cursorDoc = tackCollection.find(tackdocument); // get same tack
																// back

		while (cursorDoc.hasNext()) {

			DBObject doc = cursorDoc.next();

			String tackId = doc.get("_id").toString(); // get id of new tack

			DBCollection dashCollection = db.getCollection("DashBoard");

			System.out.println(" tack dao get new added tack with id " + doc);

			ObjectId objid = new ObjectId(boardId); // search board

			BasicDBObject searchBoard = new BasicDBObject(); // search board
																// query
			searchBoard.put("_id", objid);

			BasicDBObject newTack = new BasicDBObject(); // add tack to board
			newTack.append("Tacks", tackId);

			BasicDBObject newTackList = new BasicDBObject();
			newTackList.put("$push", newTack); // push tack to array

			System.out.println("newTack  " + newTackList);

			dashCollection.update(searchBoard, newTackList); // update board

			// ===========================================

			ObjectId tackobjid = new ObjectId(tackId); // search tack

			System.out.println("tackobjid " + tackobjid);

			BasicDBObject searchThisTack = new BasicDBObject(); // search tack
																// query
			searchThisTack.put("_id", tackobjid);

			BasicDBObject newBoardId = new BasicDBObject(); // add board to tack
			newBoardId.append("Board", boardId);

			BasicDBObject newBoardList = new BasicDBObject();
			newBoardList.put("$push", newBoardId); // push board id to array

			System.out.println("newBoardList " + newBoardList);

			tackCollection.update(searchThisTack, newBoardList); // update tack

			// ============================================================

		}
		return 0;

	}
	
	public boolean removeBoardFromTack( String boardId, String tackId ){
		
		boolean returnVal = false ;
		
		try { 
			
			DB db = MongoConnection.getConn();
			
			DBCollection tackCollection = db.getCollection("Tack");
			
			ObjectId objid = new ObjectId( tackId ); // search tack
	
			BasicDBObject searchTack = new BasicDBObject(); // search tack
																// query
			searchTack.put("_id", objid);
			
			BasicDBObject rmTack = new BasicDBObject(); // remove board from tack 		
			
			rmTack.append("Board", boardId );
			
			BasicDBObject newBoardList = new BasicDBObject();
			newBoardList.put("$pull", rmTack); // remove tack to array
			
			System.out.println("newBoardList  " + newBoardList);
			
			tackCollection.update(searchTack, newBoardList); // update board
			
			// ===========================================
			
			returnVal = true;
		
		} catch ( Exception e ){
			
			e.printStackTrace();
			
		}
		
		return returnVal;
		

		
		
	}
}
