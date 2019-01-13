<%@page import="fmspackage.ConnectionProvider,java.io.*,java.util.*,java.sql.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
 <%
     int counter,total,temp;
     String temp1;
    try
    {
    String c = session.getAttribute("counter").toString(); 
    counter = Integer.parseInt(c);
    System.out.println("Counter : "+counter);
    temp1 = session.getAttribute("total").toString();
    total=Integer.parseInt(temp1);
    System.out.println("Now Total : "+total);
    if(counter<total)
    {
    temp = counter;
    counter++;
    response.sendRedirect("question.jsp?counter="+counter);
    }else
    {
    response.sendRedirect("result.jsp");
    session.removeAttribute("counter");
    }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
 %>