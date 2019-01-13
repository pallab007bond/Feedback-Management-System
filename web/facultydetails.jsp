<%@ page import="fmspackage.ConnectionProvider,java.io.*,java.sql.*,java.util.zip.*" %>
<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Feedback Management</title>
    </head>
    <body>
        
        
        <nav class="navbar navbar-expand-md navbar-light bg-light py-0 fixed-top">
            <div class="container">
                <a href="index1.html" class="navbar-brand"><img src="images/hitlogo.png" class="image-fluid" height="55" width="55" >
                    <h3 class="d-inline align-middle" style="font-size:28px">Hit Haldia Feedback Management</h3>
                </a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav" ><span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto mr-3">
                       <% String adminname = (String)session.getAttribute("adminname");
                                                        if(adminname!=null&&!adminname.equals(""))
                                                    
                                                    {%>
                                                    <li class="nav-item"><a  class="nav-link"><i class="fa fa-user"></i>&nbsp; Welcome <%out.println("<b>"+adminname+"</b>");%></a></li><%}
                                                    else
{
                                                    %>
                                                    <jsp:forward page="adminlogin.jsp"/>
                                                    <%
                                                   session.setAttribute("adminname",null); }%>
                        <li class="nav-item"><a href="#" class="nav-link"><i class="fa fa-user"></i>&nbsp; Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <section id="explore"  class="bg-primary text-white mb-3" style="padding-top:65px;">
            <div class="container">
                <div class="row">
                    <div class="col" >
                        <h1 class="h3"><i class="fa fa-gear"></i>&nbsp; Faculty Details</h1>
                    </div>
                </div>
            </div>
        </section>
  
<!--     Post Section      -->
      <section id="action" class="bg-light py-4 mb-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 mr-auto">
                        <a href="adminpanel.jsp" class="btn btn-light btn-block text-dark"><i class="fa fa-arrow-left"></i>&nbsp;Back to Dashboard</a>
                    </div>                
                </div>
            </div>
        </section>   
<!--     Post section    -->
      <section id="post">
              <div class="container">
                  <div class="row">
                      <div class="col">
                          <div class="card">
                              
                              <table class="table table-striped table-hover">
                                 <thead class="thead-inverse">
                                     <tr>
                                         <th>Faculty ID</th>
                                         <th>Faculty Name</th>                                   
                                         <th>Department</th>
                                         
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <%
                
                                         String fdep = request.getParameter("fdept");
                                         System.out.println(fdep);
                                         ResultSet rset= mybean.fdet(request);
while(rset.next())
{
    %>
                                     <tr>
                                         <td scope="row"><%out.print(rset.getInt(1));%></td>
                                         <td><%out.print(rset.getString(2));%></td>
                                         <td><%out.print(rset.getString(3));%></td>
                                         <td><a class="btn btn-secondary" href="editfaculty.jsp"><i class="fa fa-angle-double-right"></i>&nbsp;Edit</a>
                                         </td>
                                        
                                         <td><a class="btn btn-danger" href="deletefaculty.jsp?fid=<%=rset.getString(1)%>&fdept=<%=rset.getString(3)%>"><i class="fa fa-close"></i>&nbsp;Delete</a>
                                         </td>
                                         <td><a class="btn btn-primary" href="addsubject.jsp?fid=<%=rset.getString(1)%>&fdept=<%=rset.getString(3)%>"><i class="fa fa-plus"></i>&nbsp;Add subject/Sem</a>
                                         </td>
                                     </tr>
<%
    }

%>
                                         
                                    
                                 </tbody>
                              </table>
                          </div>
                      </div>
                    
                  </div>
              </div>
      </section>
      
      <footer class="footer bg-dark text-white mt-5 p-3 fixed-bottom" id="main-footer">
          <div class="container">
              <div class="row">
                  <div class="col text-center">
                      <p class="lead">Copyright &copy; 2018 Blogen</p>
                  </div>
              </div>
          </div>
      </footer>
       
 
           
        </nav>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.9.1/standard/ckeditor.js"></script>
        <script>
			CKEDITOR.replace( 'editor1' );
		</script>
    </body>
</html> 