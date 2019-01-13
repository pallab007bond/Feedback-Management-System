<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<jsp:setProperty name="mybean" property="*"/>
<%
    if(mybean.finda(request))
      {
        response.sendRedirect("adminpanel.jsp");
      }
    else
          {
              %>
   
   <jsp:include page="adminlogin.jsp?msg=Either user id or password is invalid!"/>
     <% } %>