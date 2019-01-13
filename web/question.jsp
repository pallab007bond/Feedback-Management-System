<%@page import="fmspackage.ConnectionProvider,java.io.*,java.util.*,java.sql.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<jsp:useBean id="mybean" class="fmspackage.fmsJavaBeans"/>
<jsp:setProperty name="mybean" property="*"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Khula" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Feedback Management</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-light bg-light text-dark p-2">
            <div class="container">
                <img src="images/hitlogo.png" class="image-fluid mr-3 d-inline align-middle" width="60" height="60" >
                <a href="index.html" class="navbar-brand" style="font-family:khula;font-size:22px">HIT Haldia Feedback Management </a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="navbarNav"><span class="navbar-toggler-icon"></span></button>
                <div class="navbar navbar-collapse" id="navbarNav"> 
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown mr-2">
                            <a href="#" class="nav-link text-dark" ><i class="fa fa-user"></i>&nbsp; Welcome </a> 
                        </li>
                        <li class="nav-item px-2">
                            <a href="login.html" class="nav-link text-dark"><i class="fa fa-user-times"></i>&nbsp; Logout</a>
                        </li>
                    </ul> 
                </div>  
            </div>
        </nav>
        <header class="bg-primary text-white py-0" id="main-header">
            <div class="container">
                <div class="row py-2">
                    <div class="col-md-6">
                        <h4><i class="fa fa-gear"></i>&nbsp;Question Panel</h4>
                    </div>
                </div>
            </div>
        </header>


<%
    int total = 0;
    int counter;
    counter=0;
    try
  {
      
  Connection con = ConnectionProvider.getConnection();
  String fdept=(String)session.getAttribute("sdept");
  int fsem=(Integer)session.getAttribute("ssem");
 // int fsem=Integer.parseInt(fsem1);
  //System.out.println(fsem);
  PreparedStatement pstmt1 = con.prepareStatement("select * from secondfacultytable where fdept=? and fsem=?");
  pstmt1.setString(1,fdept);
  pstmt1.setInt(2,fsem);
  ResultSet rset1 = pstmt1.executeQuery();
  while(rset1.next())
  {
      total++;
  }
 // System.out.println(total+"l");
  }catch(SQLException e)
  {
      e.printStackTrace();
  }
    session.setAttribute("total",total);
%>
 <%  
     try
    {
       int t=1;
        counter=Integer.valueOf((String)request.getParameter("counter"));
          System.out.println("e"+counter);
     if (counter==0||counter>total)
     {
         counter = 1;
        System.out.println("e"+counter);
     }
        Connection con = ConnectionProvider.getConnection();
  String fdept=(String)session.getAttribute("sdept");
  int fsem1=(Integer)session.getAttribute("ssem");
  
 PreparedStatement pstmt = con.prepareStatement("select * from secondfacultytable where fdept=? and fsem =?");
 // PreparedStatement pstmt = con.prepareStatement("SELECT facultytable.fname,secondfacultytable.fsub,secondfacultytable.fdept FROM secondfacultytable,facultytable where secondfacultytable.fid = facultytable.fid and secondfacultytable.fdept=? and fsem=?");
  pstmt.setString(1,fdept);
  pstmt.setInt(2,fsem1);
  ResultSet rset = pstmt.executeQuery();
 //int fid=rset.getInt("fid");
 //
  
  while(rset.next())
  {
 if(t==counter)
  {
      int fid=rset.getInt(1);
 PreparedStatement pstmt1 = con.prepareStatement("select * from facultytable where fid=?");
  pstmt1.setInt(1,fid);
  ResultSet rset1 = pstmt1.executeQuery();
  if(rset1.next())
  {
      rset1.first();
 System.out.println(fid);
 String name=rset1.getString(2);
  System.out.println(name);
 %>     
        <!--     Post section    -->
        <section id="post" class="py-3">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control form-control-lg" placeholder="<%=rset1.getString(2)%>">
                        <%}%>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-lg" placeholder="<%=rset.getString("fsub")%>">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control form-control-lg" placeholder="<%=rset.getString("fdept")%>">
                    </div> 
                </div>
            </div>
        </section>
        <%
}
t++;
}
  session.setAttribute("total",String.valueOf(total));
  session.setAttribute("counter",String.valueOf(counter));
  }catch(Exception e)
  {
      e.printStackTrace();
  }
%> 


        <!--     Question section    -->
        <section id="Question" class="py-3" style="min-height: 1000px">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <form action="questionnext.jsp" method="post">
                            <fieldset class="form-group">
                                <legend> 1.Knowledge base of the teacher</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1" >
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 2.Communication skills</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1">
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 3.	Interest about the subject generated by the teacher</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1" >
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 4.	Ability to integrate content with other courses</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1" >
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 5.	Ability to design quiz/tests/assignments</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1" >
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 6.	Commitment of teacher</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1">
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 7.	Accessibility of teacher in and out of the class</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1" >
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 8.	Nature of delivery</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1">
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend> 9.	Subject coverage</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1">
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                            <fieldset class="form-group mt-5 mb-5">
                                <legend>10.	Overall rating</legend>
                                <div class="mt-2">
                                    <label class="form-check-label ml-5 mr-5">
                                        <input type="radio"class="form-check-input" value="option1">
                                        Very Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio"  class="form-check-input" value="option1" >
                                        Good
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Satisfactory
                                    </label>
                                    <label class="form-check-label ml-4 mr-5">
                                        <input type="radio" class="form-check-input" value="option1">
                                        Unsatisfied
                                    </label>
                                </div> 
                            </fieldset>
                             
                            <div class="card ">
                                    <div class="card-header">
                                        <h3 class="card-title text-primary text-center m-0 p-0"> Any Suggestion </h3>
                                    </div>
                                    <div class="card-body">
                                        <textarea name="" id="" cols="150" rows="6"></textarea>  
                                        <button type="submit" class="btn btn-primary btn-block mt-2">Next>></button>  
                                    </div>  
                            </div>
                            
                        </form>  
                    </div>


                </div>
            </div>
        </section>


        <footer class="footer bg-dark text-white mt-5 p-4 ">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <p class="lead">Copyright &copy; 2018 Blogen</p>
                    </div>
                </div>
            </div>
        </footer>







        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.9.1/standard/ckeditor.js"></script>
        <script>
            CKEDITOR.replace( 'editor1' );
        </script>
    </body>
</html> 