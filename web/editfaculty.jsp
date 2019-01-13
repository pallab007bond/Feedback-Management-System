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
                    <h3 class="d-inline align-middle" style="font-size:28px"> Feedback</h3>
                </a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav" ><span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto mr-3">
                        <li class="nav-item"><a href="#" class="nav-link"><i class="fa fa-user"></i>&nbsp; Welcome</a></li>
                        <li class="nav-item"><a href="#" class="nav-link"><i class="fa fa-user"></i>&nbsp; Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <section id="explore"  class="bg-primary text-white" style="padding-top:65px;">
            <div class="container">
                <div class="row">
                    <div class="col" >
                        <h1 class="h3"><i class="fa fa-gear"></i>&nbsp; EDIT FACULTY</h1>
                    </div>
                </div>
            </div>
        </section>

        <!--     Post Section      -->

        <section id="action" class="bg-light py-4 mb-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 mr-auto">
                        <button class="btn btn-light btn-block text-dark " ><i class="fa fa-arrow-left"></i>&nbsp;Back to Dashboard</button>
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
                            <div class="card-body">
                                <form action="editfacukty1.jsp" method="post">
                                    <div class="form-group">
                                        <label for="title">Faculty ID</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Faculty Name</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Department</label>
                                        <select class="form-control">
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
                                        <label for="title">Subject Teaching</label>
                                         <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                     <label for="category">Semester</label>
                            <select class="form-control">
                               <% for(int j=1;j<=8;j++)
                                           out.print("<option value='" + j + "'> "+ j +"</option>"); %>

                            </select>  
                            </div>
                                            <div class="col-md-3 mr-3">
                        <button class="btn btn-success btn-block"><i class="fa fa-check"></i>&nbsp;Save Changes</button>
                    </div>
                                </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="footer bg-dark text-white mt-5 p-5 fixed-bottom" id="main-footer">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <p class="lead">Copyright &copy; 2018 Blogen</p>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.9.1/standard/ckeditor.js"></script>
        <script>
            CKEDITOR.replace( 'editor1' );
        </script>
    </body>
</html> 