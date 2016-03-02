import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.util.JSON;
 
/**
 * Java MongoDB : Insert a Document
 * 
 */
public class MongoDBJDBC {
  public static void main(String[] args) {
 
    try {
 int i =0;
	Mongo mongo = new Mongo("localhost", 27017);
	DB db = mongo.getDB("test");
 
	DBCollection collection = db.getCollection("testcollection");
 
	// 1. BasicDBObject example
	System.out.println("BasicDBObject example...");
	for(i = 0; i<=10; i++)
	{
	BasicDBObject document = new BasicDBObject();
	
	document.put("id"+i, "UserID"+i);
	document.put("UserName"+i, "UserName"+i);
	document.put("EmailID"+i, "Jag"+i+"@yahoo.com");
	document.put("Address"+i, "Stree No: "+i);
	
	collection.insert(document);
	}
/*	DBCursor cursorDoc = collection.find();
	while (cursorDoc.hasNext()) {
		System.out.println(cursorDoc.next());
	}
*/ 

 
	    } catch (UnknownHostException e) {
	e.printStackTrace();
    } catch (MongoException e) {
	e.printStackTrace();
    }
 
  }
}