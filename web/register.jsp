<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="fmspackage.fmsJavaBeans"/>
<jsp:setProperty name="bean" property="*"/>
<%
  int i = 0;
  i = bean.save();
  if(i!=0)
  { 
      
  //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
  out.println("Hurray! You are successfully registered!");
  //rd.forward(request, response);
 %>
    <jsp:forward page="index.jsp"/>
 <br>Click here to <a href="index.jsp"><i>Login!</i></a>
<%
  }
  else
  {
    out.println("Sorry! Request can't be processed!");
    %>
    <jsp:include page="signup.jsp"/>
<%
  }
%>
    
