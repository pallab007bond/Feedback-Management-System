<%@ page import="fmspackage.ConnectionProvider ,java.io.*,java.sql.*,java.util.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%
    String dept=null;
    //System.out.println(dept);
           DiskFileItemFactory factory = new DiskFileItemFactory();

// Configure a repository (to ensure a secure temp location is used)
ServletContext servletContext = this.getServletConfig().getServletContext();
File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
factory.setRepository(repository);

// Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);

// Parse the request
List items = upload.parseRequest(request);
Iterator iter = items.iterator();
while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
        processFormField(item);
      
    } {
        processUploadedFile(item);
    }
}
String saveFile="";
String contentType = request.getContentType();
System.out.println("1");
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
System.out.println("2");
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
System.out.println(saveFile);
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:/Users/Pallab Banerjee/workspace/Ecommerce/WebContent/themes/images/ladies/"+saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%><br><table border="2"><tr><td><b>You have successfully upload the file:</b>
<%out.println(saveFile);%></td></tr></table>
<%
 
PreparedStatement psmnt = null;
try{
Connection con = ConnectionProvider.getConnection();
 System.out.println(dept);
psmnt = con.prepareStatement("insert into excel values(?)");
psmnt.setString(1,saveFile);
//psmnt.setString(2,dept);

int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}
}
%>