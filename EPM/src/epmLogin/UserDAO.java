package epmLogin;

import java.text.*;
import java.util.*;
import java.sql.*;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;

public class UserDAO {

	public static UserBean login(UserBean bean) {
		Statement stmt = null;

		String username = bean.getUsername();
		String password = bean.getPassword();

		try {

			Mongo mongo = new Mongo("localhost", 27017);
			
			DB db = mongo.getDB("EPM");
			System.out.println("Connect to database successfully");
			
			//change
			
			DBCollection dbCollection = db.getCollection("UserMaster");
			
			BasicDBObject andQuery = new BasicDBObject();

			List<BasicDBObject> param = new ArrayList<BasicDBObject>();
			param.add(new BasicDBObject("Username", username));
			param.add(new BasicDBObject("Password", password));
			
			//andQuery.put("$and", param);
			
			//System.out.println("Query: "+andQuery.toString());
			DBCursor dbCursor = dbCollection.find(andQuery);
			
			//DBCursor dbCursor = dbCollection.find();
			
			boolean more = dbCursor.hasNext();
			// System.out.println("more: "+more);
			while (dbCursor.hasNext()) {
				System.out.println("Record: " + dbCursor.next());
				
			}

			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out
						.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			}

			// if user exists set the isValid variable to true
			else if (more) {
				System.out.println("Welcome ");
				bean.setValid(true);
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
}