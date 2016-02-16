

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Scheduler
 */
public class Scheduler extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private BufferedWriter writer;
	
	int vUsers,users,testDuration,no_sessions,arrRate;
	String testName;
	
	
//	int testDuration;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		
		
		testName  = request.getParameter("testNameTxt");
		vUsers  = Integer.parseInt(request.getParameter("virtualUserTxt"));
		
		
		int testDurationHH  = Integer.parseInt(request.getParameter("testDurationHH"));
		int testDurationMM  = Integer.parseInt(request.getParameter("testDurationMM"));
		int testDurationSS  = Integer.parseInt(request.getParameter("testDurationSS"));
		
		testDuration = ((testDurationHH*3600)+(testDurationMM*60)+testDurationSS);
		
		//System.out.println("HH :"+testDurationHH);
		
		
		
		
		arrRate  = Integer.parseInt(request.getParameter("arrivalRateTxt"));
		
	
		
		
		System.out.println("\nTest :"+ testName +"  vusers :"+vUsers +"  Duration :"+testDuration +"  Arrival Rate/Sec :"+arrRate  );
		
		//System.out.println("out: "+request.getParameter("listLength"));
		//int length = Integer.parseInt(request.getParameter("listLength"));
	//	System.out.println("out1: "+length);
		
		//System.out.println("Test-Scripts Involved And Percentile Distribution");
		//System.out.println("Scripts\tProbability");
		
		String chkbxSelected[] = request.getParameterValues("testScriptsName");	
		no_sessions=chkbxSelected.length;
		
		if (chkbxSelected!=null)
		{
		
			dumpCfg(testName,vUsers,testDuration,arrRate,no_sessions);       
			
			
			for(int i=0;i<no_sessions;i++)
			{
				//System.out.println(chkbxSelected[i]);	
				     
				String perTextbxName = "prob"+chkbxSelected[i];        //forming probTextBox Name 
				
				
				
				
			//	System.out.println(request.getParameter("probmixload_ILM_v2.x_Rx.xml "));
				
				System.out.println(request.getParameter(perTextbxName));
				
				int  percUser = Integer.parseInt(request.getParameter(perTextbxName));  //10
				
				
				
				
				
				String[] splitScriptName = chkbxSelected[i].split("_");
				
				String usecase_acronym = splitScriptName[1];
			  
			
				/* want to push data like ScriptName,Acronym,percentile as a single element */
				
				putSessionInfo(chkbxSelected[i],percUser,usecase_acronym);
				
				
				
			}
			printAcronyms();

		}
		
	
		
		
		
		
			
	}
	
	
	
	
	
	
	
	
	public void dumpCfg(String tname,int vuser,int testDuration,int arrRate,int no_sessions) throws IOException    //print test Scenario related info ; 
	{
	  File f = new File("E:\\abx.cfg");
	  writer = new BufferedWriter(new FileWriter(f));
	
	  if (!f.exists())
	  {
		f.createNewFile();
		writer.write("Test_Name:"+tname);
		writer.write("\nDuration="+testDuration+"\nduration_unit=second"+"\nusers="+vuser+"\narrival_rate="+arrRate+"\nhostname=RCPPPSIMU");
		writer.write("\nno_sessions="+no_sessions);
		writer.close();
		
		
		
		
	  }	
	else 
	{
	
		System.out.println("File is already existed!!");
		writer.write("Test_Name:"+tname);
		writer.write("\nDuration="+testDuration+"\nduration_unit=second"+"\nusers="+vuser+"\narrival_rate="+arrRate+"\nhostname=RCPPPSIMU");
		writer.write("\nno_sessions="+no_sessions);
		writer.close();
	
	
	}
			
		
	}
	

	ArrayList<String> uAcronym = new ArrayList<String>();
	
	public void putSessionInfo(String Session,int percUser,String uAcr) throws IOException     //print Session related info;
	{
		File f1 = new File("E:\\abx.cfg");
		writer = new BufferedWriter(new FileWriter(f1,true));    //"boolean" append mode ;
		
	 
		
		uAcronym.add(uAcr);
		//System.out.println("ou0:"+output[0]+"ou1:"+output[1]);
		
		writer.write("\n"+uAcr+"file:"+Session+"\n"+uAcr+"prob="+percUser);
		writer.close();
			
	}
	
	
	public void printAcronyms() throws IOException                    //print Session : ISM,ILM..;
	{
		 File f = new File("E:\\abx.cfg");
		 writer = new BufferedWriter(new FileWriter(f,true));
		
		
		 writer.write("\nSessions: ");
		for (String acro : uAcronym )
		{
			writer.write(acro+",");
		
		}
		
		writer.close();
		
	}
	
}


