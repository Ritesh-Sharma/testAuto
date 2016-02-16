 
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
 
public class SimpleThreadPool {
 
    public static void main(String[] args) {
    	try {
    	
    		long startTime = System.currentTimeMillis();
    		
    		Set set = new HashSet<Callable>();
    		
    		ExecutorService executor = Executors.newFixedThreadPool(500);
    		

			
    			for (int i = 0; i < 50000; i++) {
        			
        			Callable worker = new MongoDBConcurrencyTest("" + i);
        			set.add(worker);
        			//executor.execute(worker);
        		}
        		
        		List<Future<Object>> futures = executor.invokeAll(set);
    			for(Future<Object> future : futures){
    				
    				System.out.println("future.get = " + future.get());
    				
    			}

    		
    		
    		System.out.println(System.currentTimeMillis() - startTime);
    		
    		executor.shutdown();
    		while (!executor.isTerminated()) {
    		}
    		System.out.println("Finished all threads");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    }
 
}