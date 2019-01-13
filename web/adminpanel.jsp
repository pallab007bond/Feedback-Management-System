
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
                        <li class="nav-item"><a href="logout.jsp"  class="nav-link"><i class="fa fa-user"></i>&nbsp; Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <section id="explore"  class="bg-primary text-white" style="padding-top:65px;">
            <div class="container">
                <div class="row">
                    <div class="col" >
                        <h1 class="h3"><i class="fa fa-gear"></i>&nbsp; Admin Panel</h1>
                    </div>
                </div>
            </div>
        </section>

        <section id="Faculty"  class="text-dark mb-5" style="padding-top:65px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mt-4" style="border-right:2px solid #000" >
                        <h2 class="text-center text-dark mb-4">Faculty</h2>
                        <button class="btn btn-primary btn-block mb-4" data-toggle="modal" data-target="#addPostModal"><i class="fa fa-plus"> &nbsp;</i>ADD Faculty</button>
                        <form class="form-inline " action="facultydetails.jsp">
                            <div class="form-group mr-5">
                               
                                <select name="fdept" id="" class="form-control">
                                    <option value="CSE">CSE</option>
                                    <option value="IT">IT</option>
                                    <option value="ECE">ECE</option>
                                    <option value="ME">ME</option>
                                    <option value="EE">EE</option>
                                    <option value="CE">CE</option>
                                    <option value="BT">BT</option>
                                    <option value="FT">FT</option>
                                    <option value="CHE">CHE</option>
                                    <option value="ICE">ICE</option>
                                    <option value="AEIE">AEIE</option>
                                    <option value="PE">PE</option>
                                </select>
                            </div> 
                         <div class="form-group mr-5">  
                                <button class="btn btn-success" type="submit"><i class="fa fa-display"> &nbsp;</i>Display Faculty Details</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6 mt-4">
                        <h2 class="text-center text-dark mb-4">Student</h2>
                        <form class="form-inline " action="passwordgenerator.jsp">
                            <div class="form-group mr-5">
                               <select name="deptpass" id="" class="form-control">
                                 <option value="CSE">CSE</option>
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="ME">ME</option>
                                <option value="EE">EE</option>
                                <option value="CE">CE</option>
                                <option value="BT">BT</option>
                                <option value="FT">FT</option>
                                <option value="CHE">CHE</option>
                                <option value="ICE">ICE</option>
                                <option value="AEIE">AEIE</option>
                                <option value="PE">PE</option>
                                </select>
                            </div> 
                            <div class="form-group mr-5">   
                                <button type="submit" class="btn btn-success">Generate Password</button>
                            </div>
                            <div class="form-group ">  
                                <%String password= request.getParameter("password");
                                if (password==null)
{%>
                               <input type="text" value=" "disabled ><%} else{%>
                               <input type="text" value="<%out.print(password);%>"disabled>
                               <%
                              // se.removeParameter("deptpass");
                               }
                               %> 
                            </div>
                            </form>
                     <form class="form-inline mt-4" action="uploadfile.jsp" method="POST" enctype="multipart/form-data">
                            <div class="form-group mr-5">
                                <select name="deptdata"class="form-control">
                                  <option value="CSE">CSE</option>
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="ME">ME</option>
                                <option value="EE">EE</option>
                                <option value="CE">CE</option>
                                <option value="BT">BT</option>
                                <option value="FT">FT</option>
                                <option value="CHE">CHE</option>
                                <option value="ICE">ICE</option>
                                <option value="AEIE">AEIE</option>
                                <option value="PE">PE</option>

                                </select>
                            </div> 
                            <div class="form-group">  
                                <input type="file" name="excelsheet" class="form-control-file" >
                            </div>
                            <div class="form-group">  
                                <button type="submit" class="btn btn-success">UPLOAD</button>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
         <!--     Post Modal       --> 

    <div class="modal fade" id="addPostModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add Faculty</h5>
                     
                </div>
                <form action="addfaculty.jsp" method="post">
                        <div class="modal-body">
                               <div class="form-group">
                            <label for="title">Faculty ID</label>
                            <input type="text" class="form-control" name="fid">
                        </div>
                        <div class="form-group">
                            <label for="title">Faculty Name</label>
                            <input type="text" class="form-control" name="fname">
                        </div>
                        <div class="form-group">
                            <label for="category">Department Name</label>
                            <select class="form-control" name="fdept">
                                <option value=" ">---</option>
                                <option value="CSE">CSE</option>
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="ME">ME</option>
                                <option value="EE">EE</option>
                                <option value="CE">CE</option>
                                <option value="BT">BT</option>
                                <option value="FT">FT</option>
                                <option value="CHE">CHE</option>
                                <option value="ICE">ICE</option>
                                <option value="AEIE">AEIE</option>
                                <option value="PE">PE</option>
                            </select>
                        </div>
                        <div class="form-group my-2">
                            <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </div>
                                           </form>
            </div>
        </div>
    </div>

        <footer id="main-footer" class="bg-dark text-white  fixed-bottom ">
           <div class="container">
               <div class="row">
                   <div class="col text-center">
                       <p class="lead">Copyright &copy; 2018 </p>
                   </div>
               </div>
           </div>
            
        </footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>