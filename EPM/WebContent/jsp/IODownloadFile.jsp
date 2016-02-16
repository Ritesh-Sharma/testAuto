<%@page import="com.avekshaa.common.DeleteFiles"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%
HttpSession httpSession = request.getSession(false);
UUID idOne = UUID.randomUUID();
String sessionId = idOne.toString();
Properties prop = new Properties();
String propertiesFile = "config.properties";
InputStream in = this.getClass().getClassLoader().getResourceAsStream(propertiesFile);
prop.load(in);

String filepath = prop.getProperty("zip.file.directory");
String filename = "CompressedImages.zip";
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   

/*   DeleteFiles deleteFiles = new DeleteFiles();
  deleteFiles.deleteOriginalFiles(filepath);
 */ 
  
%>   