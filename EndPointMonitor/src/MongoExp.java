import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;



public class MongoExp {

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		
		try{
			
	         // To connect to mongodb server
	         Mongo mongoClient = new Mongo( "localhost" , 27017 );
				
	         // Now connect to your databases
	         DB db = mongoClient.getDB( "abnh" );
	         System.out.println("Connect to database successfully");
	         
	         /*
	         DBCollection coll = db.createCollection("UserMaster1", null);
	         System.out.println("Collection created successfully");
	        
	          
	         BasicDBObject doc = new BasicDBObject("title", "MongoDB").
	                 append("description", "database").
	                 append("likes", 100).
	                 append("url", "http://www.tutorialspoint.com/mongodb/").
	                 append("by", "tutorials point");
	     				
	        coll.insert(doc);
	        */
	        
	         DBCollection coll = db.getCollection("UserMaster1");
	         System.out.println("Collection UserMaster1 selected successfully");
	         
	         
	         
	        DBCursor cursor = coll.find();
	         int i = 1;
				
	         while (cursor.hasNext()) { 
	            System.out.println("Inserted Document: "+i); 
	            System.out.println(cursor.next()); 
	            i++;
	         }
	        
	         
	         
	         
	         
	        	
	      }catch(Exception e){
	         System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      }
		
		
		

	}

}
