package epmLogin;

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

public class UserMasterDAO {

	public static UserMasterBean createUser(UserMasterBean bean) {
		Statement stmt = null;

		String username = bean.getUsername();
		String password = bean.getPassword();
		String userid = bean.getUserId();

		try {
			System.out.println("In UserMasterDAO");

			// System.out.println("UserName: "+username);
			// System.out.println("Password: "+password);
			// System.out.println("userid: "+userid);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("UserMaster");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("UserName", username);
			DBCursor dbCursor = dbCollection.find(whereQuery);
			boolean isUserAlreadyExist = dbCursor.hasNext();

			// if user does not exist set the isValid variable to false
			if (!isUserAlreadyExist) {
				System.out.println("Add User");
				BasicDBObject addUser = new BasicDBObject();
				addUser.put("UserId", userid);
				addUser.put("UserName", username);
				addUser.put("Password", password);
				addUser.put("UserType", "Normal");
				addUser.put("Status", "Active");
				dbCollection.insert(addUser);
				bean.setValid(true);
			}

			// if user exists set the isValid variable to true
			else if (isUserAlreadyExist) {
				System.out.println("User Already Exist");
				bean.setValid(false);
			}
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return bean;

	}

	public static String disableUser(String deleteUser) {
		Statement stmt = null;
		String userDeleted = "";
		try {
			System.out.println("In UserMasterDAO");
			System.out.println("Delete UserName: " + deleteUser);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("UserMaster");
			BasicDBObject document = new BasicDBObject();
			document.put("UserName", deleteUser);
			// DBCursor dbCursor = dbCollection.find(document);
			dbCollection.remove(document);
			userDeleted = "S";
			System.out.println("User Deleted Successfully...");

			/*
			 * while(dbCursor.hasNext()) { dbCollection.remove(document);
			 * //bean.setValid(true);
			 * System.out.println("User Deleted Successfully..."); }
			 */
		}

		catch (Exception ex) {
			userDeleted = "F";
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return userDeleted;

	}

	public static ArrayList findUser(UserMasterBean bean) {
		Statement stmt = null;

		String username = bean.getUsername();
		ArrayList userInfo = new ArrayList();
		try {
			System.out.println("In UserMasterDAO");
			System.out.println("UserName: " + username);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("UserMaster");
			BasicDBObject whereQuery = new BasicDBObject();
			/*
			 * whereQuery.put("UserName", username); DBCursor dbCursor =
			 * dbCollection.find(whereQuery);
			 */
			DBCursor dbCursor = dbCollection.find();
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				userInfo.add(obj.getString("UserName"));
				userInfo.add(obj.getString("UserType"));
				userInfo.add(obj.getString("Status"));

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
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return userInfo;

	}

	public static ArrayList findSelectedUser(UserMasterBean bean) {
		Statement stmt = null;

		String username = bean.getUsername();
		ArrayList userInfo = new ArrayList();
		try {
			System.out.println("In UserMasterDAO");
			System.out.println("selectedUserName: " + username);

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("EPM");
			DBCollection dbCollection = db.getCollection("UserMaster");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("UserName", username);
			DBCursor dbCursor = dbCollection.find(whereQuery);
			// DBCursor dbCursor = dbCollection.find();
			while (dbCursor.hasNext()) {

				BasicDBObject obj = (BasicDBObject) dbCursor.next();
				userInfo.add(obj.getString("UserName"));
				userInfo.add(obj.getString("UserType"));
				userInfo.add(obj.getString("Status"));

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
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}

		finally {
		}

		return userInfo;

	}

}