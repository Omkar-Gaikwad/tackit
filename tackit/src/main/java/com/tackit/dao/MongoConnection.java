package com.tackit.dao;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;

/**
 * Omkar : return a mongo db connection
 * 
 */
public class MongoConnection {
	public static DB getConn() {

		try {

			MongoClientURI uri = new MongoClientURI("mongodb://omkar:omkar@ds033067.mongolab.com:33067/tackit");
	        MongoClient mongo = new MongoClient(uri);
			
			System.out.println("connected");
			DB db = mongo.getDB("tackit");
			
			return db;

		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		}
		return null;

	}
}