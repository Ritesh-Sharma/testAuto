import com.mongodb.Mongo;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.Arrays;
import java.util.concurrent.Callable;

public class MongoDBConcurrencyTest implements Callable {
	private String command;

	public MongoDBConcurrencyTest(String s) {
		this.command = s;
	}

	@Override
	public Object call() {
		System.out.println(Thread.currentThread().getName()
				+ " Start. Command = " + command);
		processCommand();
		System.out.println(Thread.currentThread().getName() + " End.");
		return null;
	}

	private void processCommand() {
		try {
			// To connect to mongodb server
			// MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
			Mongo mongo = new Mongo("10.49.120.68", 27017);
			// Now connect to your databases
			DB db = mongo.getDB("jionewsnewd");
			System.out.println("Connect to database successfully");
			DBCollection coll = db.getCollection("Issue");
			System.out
					.println("Collection Issue selected successfully");
			DBCursor cursor = coll.find(new BasicDBObject("_id",348));
			
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
	}
}