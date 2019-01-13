<<!DOCTYPE html>
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

               
            </div>
        </nav>

        

        
<!--     Post Section      -->
       
       <section id="action" class="bg-light" fixed-bottom>
              <div class="container">
                  <div class="row">
                    
                  </div>
              </div>
       </section>
       
       
       
<!--     Login section    -->
      <section id="login" style="padding-top:130px">
              <div class="container">
                  <div class="row">
                      <div class="col-md-6 mx-auto">
                           <div class="card">
                              <div class="card-header">
                                  <h4>Student Register</h4>
                              </div>
                              <div class="card-body">
                                  <form action="register.jsp" method="post">
                                  <div class="form-group">
                                      <label for="Deparment">Department</label>
                                      <select class="form-control" name="sdept">
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
                                      <label for="rollno">Roll no</label>
                                     <select class="form-control"  name="sroll">
                                         <% for(int i=1;i<=200;i++)
                                           out.print("<option value='" + i + "'> "+ i +"</option>"); %>
                                       </select>
                                  </div>
                                  <div class="form-group">
                                      <label for="password">Semester</label>
                                       <select class="form-control" name="ssem">
                                             <% for(int j=1;j<=8;j++)
                                           out.print("<option value='" + j + "'> "+ j +"</option>"); %>
                                            </select>
                                  </div>
                                            <div class="form-group">
                                      <label for="password">Password</label>
                                      <input type="password" name="spassword" class="form-control">
                                  </div>
                                            <div class="form-group">
                                      <label for="cpassword">Confirm Password</label>
                                       <input type="password" name="cpassword" class="form-control">
                                  </div>
                                  <button type="submit"class="btn btn-primary btn-block">Register</button>
                                       </form>
                              </div>
                           </div>
                      </div>
                  </div>
              </div>
      </section>
      
       <footer id="main-footer" class="bg-dark text-white  fixed-bottom ">
           <div class="container">
               <div class="row">
                   <div class="col text-center">
                       <p class="lead">Copyrigth &copy; 2018 </p>
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