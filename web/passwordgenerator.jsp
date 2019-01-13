<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<%
    String password=mybean.generatePassword(request);
%>
<%response.sendRedirect("adminpanel.jsp?password="+password);%>
