<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<jsp:setProperty name="mybean" property="*"/>
<%
    if(mybean.finds(request))
      {
        response.sendRedirect("question.jsp?counter=1");
      }
    else
          {
              %>
   
   <jsp:forward page="login.jsp?msg=Either user id or password is invalid!"/>
     <% } %>