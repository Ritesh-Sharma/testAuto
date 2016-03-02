<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.MultipartStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.*"%>
<%@page import="org.apache.commons.*"%>
<%@page import="com.avekshaa.common.ZipExtractor"%>
<%@page import="com.avekshaa.ImageOptimization.ImageCompression"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.lang.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/cit.css" />
        <link rel="stylesheet" type="text/css" href="styles/CITTable.css" />
        <script type='text/javascript' src='scripts/jquery.js'></script>
        <script type='text/javascript' src='scripts/ci.js'></script>
        <script type='text/javascript' src='scripts/jquery.tablesorter.js'></script>
        <title>Case Investigator</title>
    </head>
    <body>
        <div class="header"><br></div>

        <img  src="images/CITitle.png" alt="CITitle" width="400px" />

        <div class="gr">
            <hr>
            <h3>Image Compression</h3>
            <hr>
        </div>

        <table border="1" width="100%" class="tableHead"><tr>
                <th><a href="index.jsp" style="color: white">HOME</a></th>
            </tr></table>
        <br>



<%
   File file ;
	int maxFileSize = 5000000 * 1024;
	int maxMemSize = 5000000 * 1024;
   ServletContext context = pageContext.getServletContext();
   //String filePath = context.getInitParameter("image-file-upload");

   
   String folderName = "";
   Calendar cal = Calendar.getInstance();
   long timeStamp = cal.getTimeInMillis();
   String date = Integer.toString(cal.get(Calendar.DATE)) + "-" + Integer.toString(cal.get(Calendar.MONTH)) + "-" + Integer.toString(cal.get(Calendar.YEAR)) + " ";
   String timeMillis = String.valueOf(timeStamp);
   //HttpSession httpSession = request.getSession(false);
   UUID idOne = UUID.randomUUID();
   String sessionId = idOne.toString();

   Properties prop = new Properties();
   String propertiesFile = "config.properties";
   InputStream in = this.getClass().getClassLoader().getResourceAsStream(propertiesFile);
   prop.load(in);
   
   String upload_directory = prop.getProperty("image.upload.directory");
   String upload_temp_repository = prop.getProperty("image.upload.temp.repository");
	String zipFilePath = prop.getProperty("zip.file.directory");   
	String imageSourcePath = upload_directory;
	String imageDestinationPath = prop.getProperty("ImageDestinationPath");
// 	int dpi = Integer.parseInt(prop.getProperty("DPI"));
//	float imageQuality = Float.parseFloat(prop.getProperty("ImageQuality"));

 	int dpi = 0;
	float imageQuality = 0.0f;

	
	
/* 	String userImageQuality = request.getParameter("imagequality"); 
	String userDPI = request.getParameter("dpi");
	
	System.out.println("userImageQuality:" +userImageQuality);
	System.out.println("userDPI:" +userDPI);
 */	
 	
      
   System.out.println("image_upload_directory:" +upload_directory);
   System.out.println("image_upload_temp_repository: " +upload_temp_repository);
   System.out.println("imageDestinationPath: " +imageDestinationPath);
/*    System.out.println("imageQuality: " +imageQuality);
   System.out.println("dpi:" +dpi);
 */   
   //String upload_directory = image_upload_directory;
   //String upload_temp_repository = "C:\\uploads";
   
   folderName = date.trim() + "[" + timeMillis + "]";
   (new File(upload_directory + folderName)).mkdirs();

   String filePath1 = upload_directory + folderName + "/";

   
   // Verify the content type
    String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
	   
	   DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 

    	     	  
    	  // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
        	 FileItem fi = (FileItem)i.next();
            
        	 if ( fi.isFormField () )
        	 {
        		 String fieldName1 = fi.getFieldName();
                 String fieldValue = fi.getString();
                 System.out.println("fieldName1 -- "+fieldName1);
                 if(fieldName1.equalsIgnoreCase("imagequality"))
                 {
					 String imgQuality = fi.getString();
                	 if(!(imgQuality.equalsIgnoreCase("") || imgQuality == null))
                	 {
                	 	imageQuality = Float.parseFloat(imgQuality);
                	 	System.out.println("User Define Image Quality Value: "+imageQuality);
                	 }
                	 else
                	 {
                		 imageQuality = Float.parseFloat(prop.getProperty("ImageQuality"));
                		 System.out.println("Default Image Quality Value: "+imageQuality);
                	 }
                	 
                 }
                 if(fieldName1.equalsIgnoreCase("dpi"))
                 {
                	 String dpiValue = fi.getString();
                	 if(!(dpiValue.equalsIgnoreCase("") || dpiValue == null))
                	 {
                		 dpi = Integer.parseInt(fi.getString());
                		 System.out.println("User Define DPI Value: "+dpi);
                	 }
                	 else
                	 {
                		 dpi = Integer.parseInt(prop.getProperty("DPI"));
                		 System.out.println("Default DPI Value: "+dpi);
                	 }
                	                 			 
                	 
                 }
        	 }
        	 
        	 if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            System.out.println("fieldName -- "+fieldName);
            System.out.println("fileName -- "+fileName);
            
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath1 + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath1 + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            
			//Extract If Zip File
            
            String filename = file.toString();
            //converting the filename to string and stoing it in string variable
            String fileExtension = filename.substring(filename.lastIndexOf(".") + 1);
            if (fileExtension.equalsIgnoreCase("zip")) {
                System.out.println("File Uploaded is a Zip File !");
                ZipExtractor unzip = new ZipExtractor();
                // creating an object of class unzipExtractor 
                unzip.zipReader(filename, filePath1);
                // calling the method of class unzipExtractor which will unzip a zipped file  
            } 


            (new File(imageDestinationPath + folderName)).mkdirs();
            String filePath2 = imageDestinationPath + folderName + "/";
            String zipFileName = zipFilePath + "CompressedImages.zip";
            
            System.out.println("imageSourcePath:" +filePath1);
            System.out.println("imageDestinationPath---------------------:" +imageDestinationPath);
            System.out.println("imageDestinationPath:" +filePath2);
                        
            ImageCompression imageCompression = new ImageCompression();
            String status = imageCompression.compressImages(upload_directory, filePath1, filePath2, imageDestinationPath, zipFileName, dpi, imageQuality);
             if(status.equalsIgnoreCase("success"))
             {
            	 %>
            	 <jsp:forward page="IOFileDownload.jsp"> 
            	 <jsp:param name="" value=""/>
            	 </jsp:forward>
            	<% 
            /* out.println("Uploaded Filename: " + filePath1 + fileName + "compressed successfully... <br>");
            <a href="DownloadFile.jsp">download the jsp file</a> */
             }
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
    }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>File upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   } 
%>
        <div class="footer" ><br></div> 
    </body>
</html>