<%@ page import="fmspackage.ConnectionProvider,java.io.*,java.sql.*,java.util.zip.*" %>

<%
   Connection con = ConnectionProvider.getConnection();
    String fid=request.getParameter("fid");
    String fdept=request.getParameter("fdept");
    System.out.println(fdept);
    try{
    Statement st=con.createStatement();
    int i =st.executeUpdate("delete from facultytable where fid="+fid); 
   // response.sendRedirect("facultydetails.jsp");
   %>
   <jsp:forward page="facultydetails.jsp">
       <jsp:param name="fdept" value="<%=fdept%>"/>
   </jsp:forward>
   <%
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    
    %>