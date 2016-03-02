package com.avekshaa.epm.Login;

import java.text.*;
import java.util.*;
import java.sql.*;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.WriteResult;

public class EndPointMasterDAO {

	public static EndPointMasterBean createEndPoint(EndPointMasterBean bean) {


		int epid = bean.getEpid();
		String epdesc = bean.getEpdesc();
		String ipaddress = bean.getIpaddress();
		int port = bean.getPort();
		int type = bean.getType();
		int status = bean.getStatus();
		
		try {
			System.out.println("In EndPointMasterDAO");

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_ENDPOINT_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("endpoint_id", epid);
			DBCursor dbCursor = dbCollection.find(whereQuery);
			boolean isEndPointAlreadyExist = dbCursor.hasNext();

			// if user does not exist set the isValid variable to false
			if (!isEndPointAlreadyExist) {
				System.out.println("Add End Poit");
				BasicDBObject addEndPoint = new BasicDBObject();
				addEndPoint.put("endpoint_id", epid);
				addEndPoint.put("endpoint_desc", epdesc);
				addEndPoint.put("endpoint_IP_Address", ipaddress);
				addEndPoint.put("endpoint_Port", port);
				addEndPoint.put("endpoint_type", type);
				addEndPoint.put("endpoint_status", status);
				
				dbCollection.insert(addEndPoint);
				bean.setValid(true);
			}

			// if user exists set the isValid variable to true
			else if (isEndPointAlreadyExist) {
				System.out.println("End Point Already Exist");
				bean.setValid(false);
			}
		}

		catch (Exception ex) {
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return bean;

	}

	public static String disableEndPoint(int endPoint) {
		String endPointDeleted = "";
		try {
			System.out.println("In EndPointMasterDAO >> disableEndPoint");
			System.out.println("Delete End Point ID: " + endPoint);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_ENDPOINT_MASTER");
			BasicDBObject document = new BasicDBObject();
			document.put("endpoint_id", endPoint);
			// DBCursor dbCursor = dbCollection.find(document);
			dbCollection.remove(document);
			endPointDeleted = "S";
			System.out.println("End Point Deleted Successfully...");

			/*
			 * while(dbCursor.hasNext()) { dbCollection.remove(document);
			 * //bean.setValid(true);
			 * System.out.println("User Deleted Successfully..."); }
			 */
		}

		catch (Exception ex) {
			endPointDeleted = "F";
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return endPointDeleted;

	}

	public static ArrayList listAllEpm() {
		Statement stmt = null;

		ArrayList endPointMasterList = new ArrayList();
		try {
			System.out.println("In EndPointMonitorMasterDAO");
			
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_ENDPOINT_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			DBCursor dbCursor = dbCollection.find();
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				
				endPointMasterList.add(obj.getString("endpoint_id"));
				endPointMasterList.add(obj.getString("endpoint_desc"));
				endPointMasterList.add(obj.getString("endpoint_IP_Address"));
				endPointMasterList.add(obj.getString("endpoint_Port"));
				endPointMasterList.add(obj.getString("endpoint_type"));
				endPointMasterList.add(obj.getString("endpoint_status"));
				
				/*
				 * DBObject resultElement = dbCursor.next();
				 * System.out.println("resultElement: "+resultElement);
				 * 
				 * Map resultElementMap = resultElement.toMap(); Collection
				 * resultValues = resultElementMap.values();
				 * userInfo.add(resultValues);
				 * System.out.println("resultValues: " +resultValues);
				 */// System.out.println("Record: "+dbCursor.next());
			}

		}

		catch (Exception ex) {
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return endPointMasterList;

	}

	public static ArrayList findSelectedEndPoint(EndPointMasterBean bean) {

		int epId = bean.getEpid();
		ArrayList endPointInfo = new ArrayList();
		try {
			System.out.println("In EndPointMasterDAO");
			System.out.println("selectedEndPointName: " + epId);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_ENDPOINT_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("endpoint_id", epId);
			DBCursor dbCursor = dbCollection.find(whereQuery);
			// DBCursor dbCursor = dbCollection.find();
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();

				
				endPointInfo.add(obj.getString("endpoint_id"));
				endPointInfo.add(obj.getString("endpoint_desc"));
				endPointInfo.add(obj.getString("endpoint_IP_Address"));
				endPointInfo.add(obj.getString("endpoint_Port"));
				endPointInfo.add(obj.getString("endpoint_type"));
				endPointInfo.add(obj.getString("endpoint_status"));
				
								
				/* * DBObject resultElement = dbCursor.next();
				 * System.out.println("resultElement: "+resultElement);
				 * 
				 * Map resultElementMap = resultElement.toMap(); Collection
				 * resultValues = resultElementMap.values();
				 * userInfo.add(resultValues);
				 * System.out.println("resultValues: " +resultValues);
				 // System.out.println("Record: "+dbCursor.next());
*/			
				}

		}

		catch (Exception ex) {
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return endPointInfo;

	}

}