<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<jsp:setProperty name="mybean" property="*"/>
<%
  int i = 0;
  i = mybean.addFaculty();
  if(i!=0)
  { 
      
 response.sendRedirect("adminpanel.jsp");
  }
%>