<%-- <%@page import="com.avekshaa.common.ZipExtractor"%> --%>
<%-- <%@ page errorPage="CIError.jsp" %> --%>
<%-- <%@ page import="com.avekshaa.ci.FunctionView"%>
<%@ page import="com.avekshaa.ci.ThreadView"%>
<%@ page import="com.avekshaa.ci.ETAnalyzer"%>
<%@ page import="com.avekshaa.ci.ExtendedParser"%> --%>
<%@ page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
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
            <h3>Extended Thread Analyzer</h3>
            Analysis Report
            <hr>
        </div>

        <table border="1" width="100%" class="tableHead"><tr>
                <th><a href="index.jsp" style="color: white">HOME</a></th>
                <!-- <th><a href="javascript:void(0);" style="color: white" class="show_hide" onclick="displayDiv(threadView)">Thread View</a></th>
                <th><a href="javascript:void(0);" style="color: white" class="show_hide" onclick="displayDiv(functionView)">Function View</a></th> -->
            </tr></table>
        <br>

        <%
            File file;
            int maxFileSize = 5000000 * 1024;
            int maxMemSize = 5000000 * 1024;
            ServletContext context = pageContext.getServletContext();
            //String filePath = context.getInitParameter("file-upload");
            //Class.forName("com.mysql.jdbc.Driver");//load driver

            String folderName = "";
            Calendar cal = Calendar.getInstance();
            long timeStamp = cal.getTimeInMillis();
            String date = Integer.toString(cal.get(Calendar.DATE)) + "-" + Integer.toString(cal.get(Calendar.MONTH)) + "-" + Integer.toString(cal.get(Calendar.YEAR)) + " ";
            String timeMillis = String.valueOf(timeStamp);
            //    HttpSession httpSession = request.getSession(false);
            UUID idOne = UUID.randomUUID();
            String sessionId = idOne.toString();

            /* Properties prop = new Properties();
            String propertiesFile = "config.properties";
            InputStream in = this.getClass().getClassLoader().getResourceAsStream(propertiesFile);
            prop.load(in); */
/*             String upload_directory = prop.getProperty("upload.directory");
            String upload_temp_repository = prop.getProperty("upload.temp.repository");
 */
            String upload_directory = "C:\\images";
            String upload_temp_repository = "C:\\uploads";

           System.out.println("upload_directory: "+upload_directory);
           System.out.println("upload_temp_repository: "+upload_temp_repository);
            
            
            folderName = date.trim() + "[" + timeMillis + "]";
            (new File(upload_directory + folderName)).mkdirs();

            String filePath = upload_directory + folderName + "/";
            // Verify the content type
            /* String contentType = request.getContentType();

            if ((contentType.indexOf("multipart/form-data") >= 0)) {
 */
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File(upload_temp_repository));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);
                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            // Get the uploaded file parameters
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            // Write the file
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath
                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            fi.write(file);

                            /*
                             *   Extract If Zip File
                             */
                            /* String filename = file.toString();
                            //converting the filename to string and stoing it in string variable
                            String fileExtension = filename.substring(filename.lastIndexOf(".") + 1);
                            if (fileExtension.equalsIgnoreCase("zip")) {
                                System.out.println("File Uploaded is a Zip File !");
                                ZipExtractor unzip = new ZipExtractor();
                                // creating an object of class unzipExtractor 
                                unzip.zipReader(filename, filePath);
                                // calling the method of class unzipExtractor which will unzip a zipped file  
                            } */
                            
                        }
                    }
                    /* File dir = new File(filePath);
                    File[] dumps = dir.listFiles();
                    ExtendedParser ep = new ExtendedParser();
                    ep.setFiles(dumps);
                    ep.updateDB(sessionId); */
                    /*
                    *   Delete Created Directory
                    */
                    /* for (File f : dumps) {
                        f.delete();
                    }
                    dir.delete(); */
                    /*
                    *   Redirect to Report
                    */
                    //response.sendRedirect("CITReport.jsp?id=" + sessionId);

        %>
        <%                } catch (Exception ex) {
                    System.out.println(ex);
                    ex.printStackTrace();
                    StackTraceElement s[] = ex.getStackTrace();
                    for (int i = 0; i < s.length; i++) {
                        out.println(s[i].toString());
                    }
                }
             /* } else {
            } */ 
        %>
        <div class="footer" ><br></div> 
    </body>
</html>