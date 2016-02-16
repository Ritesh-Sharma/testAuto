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

public class EPMConfigurationMasterDAO {

	public static EPMConfigurationBean createThreshold(EPMConfigurationBean bean) {

		String thresholdinteraction = bean.getThresholdinteraction();
		int responsetime = bean.getResponsetime();
		int defaultresponsetime = bean.getDefaultresponsetime();
		String averagecreation = bean.getAveragecreation();
		int timewindowlength = bean.getTimewindowlength();
		int noofsamples = bean.getNoofsamples();
		int enableepmengine = bean.getEnableepmengine();
		//int status = bean.getStatus();
		
		try {
			System.out.println("In EPMConfigurationMasterDAO");

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("ThresholdResponseTimeInteraction", thresholdinteraction);
			DBCursor dbCursor = dbCollection.find(whereQuery);
			boolean isThresholdAlreadyExist = dbCursor.hasNext();

			// if user does not exist set the isValid variable to false
			if (!isThresholdAlreadyExist) {
				System.out.println("Threshold Already Poit");
				BasicDBObject addThreshold = new BasicDBObject();
				addThreshold.put("ThresholdResponseTimeInteraction", thresholdinteraction);
				addThreshold.put("ResponseTime", responsetime);
				addThreshold.put("DefaultResponseTime", defaultresponsetime);
				addThreshold.put("AverageCriterion", averagecreation);
				addThreshold.put("TimeWindowLengthInSeconds", timewindowlength);
				addThreshold.put("NumberOfSamples", noofsamples);
				addThreshold.put("EnableEPMEngine", enableepmengine);
				addThreshold.put("Status", "Active");
				
				dbCollection.insert(addThreshold);
				bean.setValid(true);
			}

			// if user exists set the isValid variable to true
			else if (isThresholdAlreadyExist) {
				System.out.println("Threshold Already Exist");
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


	public static EPMConfigurationBean modifyDefaultConfig(EPMConfigurationBean bean) {

		int defaultresponsetime = bean.getDefaultresponsetime();
		String averagecreation = bean.getAveragecreation();
		int timewindowlength = bean.getTimewindowlength();
		int noofsamples = bean.getNoofsamples();
		int enableepmengine = bean.getEnableepmengine();
		//int status = bean.getStatus();
		
		try {
			System.out.println("In EPMConfigurationMasterDAO");

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject updateColumns = new BasicDBObject();
			BasicDBObject updateQuery = new BasicDBObject();
			
			updateColumns.put("DefaultResponseTime", defaultresponsetime);
			updateColumns.put("AverageCriterion", averagecreation);
			updateColumns.put("TimeWindowLengthInSeconds", timewindowlength);
			updateColumns.put("NumberOfSamples", noofsamples);
			updateColumns.put("EnableEPMEngine", enableepmengine);
			updateQuery.put("$set", updateColumns);
			/*updateQuery.append("$set", 
				new BasicDBObject().append("DefaultResponseTime", defaultresponsetime));
			updateQuery.append("$set", 
					new BasicDBObject().append("AverageCriterion", averagecreation));*/
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.append("Status", "Active");
			dbCollection.updateMulti(searchQuery, updateQuery);
			System.out.println("Default Configuration Updated Successfully...");
			bean.setValid(true);

						}

		catch (Exception ex) {
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return bean;

	}

	
	public static String disableThreshold(String thresholdID) {
		String thresholdIDDeleted = "";
		try {
			System.out.println("In EPMConfigurationMasterDAO >> disableThreshold");
			System.out.println("Delete Threshold ID: " + thresholdID);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject document = new BasicDBObject();
			document.put("ThresholdResponseTimeInteraction", thresholdID);
			// DBCursor dbCursor = dbCollection.find(document);
			dbCollection.remove(document);
			thresholdIDDeleted = "S";
			System.out.println("Threshold Deleted Successfully...");

			/*
			 * while(dbCursor.hasNext()) { dbCollection.remove(document);
			 * //bean.setValid(true);
			 * System.out.println("User Deleted Successfully..."); }
			 */
		}

		catch (Exception ex) {
			thresholdIDDeleted = "F";
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return thresholdIDDeleted;

	}

	public static ArrayList listAllEpm() {

		ArrayList epmConfigMasterList = new ArrayList();
		try {
			System.out.println("In EPMConfigurationMasterDAO");
			
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			DBCursor dbCursor = dbCollection.find();
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				
				epmConfigMasterList.add(obj.getString("ThresholdResponseTimeInteraction"));
				epmConfigMasterList.add(obj.getString("ResponseTime"));
				epmConfigMasterList.add(obj.getString("DefaultResponseTime"));
				epmConfigMasterList.add(obj.getString("AverageCriterion"));
				epmConfigMasterList.add(obj.getString("TimeWindowLengthInSeconds"));
				epmConfigMasterList.add(obj.getString("NumberOfSamples"));
				epmConfigMasterList.add(obj.getString("EnableEPMEngine"));
				epmConfigMasterList.add(obj.getString("Status"));
				
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

		return epmConfigMasterList;

	}

	public static ArrayList findThreshold(EPMConfigurationBean bean) {

		String thresholdID = bean.getThresholdinteraction();
		ArrayList epmConfigMasterList = new ArrayList();
		try {
			System.out.println("In EPMConfigurationMasterDAO");
			System.out.println("selectedThresholdID: " + thresholdID);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("ThresholdResponseTimeInteraction", thresholdID);
			DBCursor dbCursor = dbCollection.find(whereQuery);

			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				epmConfigMasterList.add(obj.getString("ThresholdResponseTimeInteraction"));
				epmConfigMasterList.add(obj.getString("ResponseTime"));
				epmConfigMasterList.add(obj.getString("DefaultResponseTime"));
				epmConfigMasterList.add(obj.getString("AverageCriterion"));
				epmConfigMasterList.add(obj.getString("TimeWindowLengthInSeconds"));
				epmConfigMasterList.add(obj.getString("NumberOfSamples"));
				epmConfigMasterList.add(obj.getString("EnableEPMEngine"));
				epmConfigMasterList.add(obj.getString("Status"));
				}

		}

		catch (Exception ex) {
			System.out.println("An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return epmConfigMasterList;

	}

	
	public static ArrayList findDefaultConfiguration() {

		ArrayList epmConfigMasterList = new ArrayList();
		try {
			System.out.println("In EPMConfigurationMasterDAO");
			
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("EPM_CONFIGURATION_MASTER");
			BasicDBObject whereQuery = new BasicDBObject();
			DBCursor dbCursor = dbCollection.find().limit(1);
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				
			//	epmConfigMasterList.add(obj.getString("ThresholdResponseTimeInteraction"));
			//	epmConfigMasterList.add(obj.getString("ResponseTime"));
				epmConfigMasterList.add(obj.getString("DefaultResponseTime"));
				epmConfigMasterList.add(obj.getString("AverageCriterion"));
				epmConfigMasterList.add(obj.getString("TimeWindowLengthInSeconds"));
				epmConfigMasterList.add(obj.getString("NumberOfSamples"));
				epmConfigMasterList.add(obj.getString("EnableEPMEngine"));
			//	epmConfigMasterList.add(obj.getString("Status"));
				
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

		return epmConfigMasterList;

	}

}