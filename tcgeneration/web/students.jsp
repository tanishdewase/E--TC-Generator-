<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Online Leaving Certificate Generation System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%@ include file="includes/header.jsp" %>

        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12" style="padding-top: 40px;">
                            <div class="text-center mx-auto" >
                                <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("2")) {
                                            out.println("<div class='alert alert-danger'>Student deleted successfully!</div>");
                                        }
                                        if (status.equals("1")) {
                                            out.println("<div class='alert alert-success'>Student added successfully!</div>");
                                        }
                                        
                                        if (status.equals("11")) {
                                            out.println("<div class='alert alert-success'>Students uploaded successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                                <h1 class="text-primary">Students List</h1>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <a href="img/Students.csv" style="text-align: left">Download template</a><br><br>
                                        <form action="includes/uploadFile.jsp" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="uploadexcel"/>
                                            <div class="input-group">
                                                <input type="file" class="border-0" name="file" required >
                                                <button class="btn form-control border-secondary bg-white text-primary " type="submit">Upload</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-lg-7">
                                        <a href="student-add.jsp" class="btn btn-primary pull-right" style="float:right">Add new student</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <form action="" method="get">
                                            <input type="hidden" name="action" value="search"/>
                                            <div class="col-lg-3">
                                                <div class="input-group">
                                                <select class="form-control border-0" name="branch" required >
                                                    <option value="All">All</option>
                                                    <option value="CS">CS</option>
                                                    <option value="IT">IT</option>
                                                    <option value="ME">ME</option>
                                                    <option value="EE">EE</option>
                                                    <option value="EXTC">EXTC</option>
                                                </select>
                                                <button class="btn form-control border-secondary bg-white text-primary " type="submit">Filter</button>
                                            </div>
                                            </div>
                                        </form>
                            <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th  class="text-center">Enroll NO</th>
                                                    <th  class="text-center">Name</th>
                                                    <th  class="text-center">E-Mail</th>
                                                    <th  class="text-center">Mobile Number</th>
                                                    <th  class="text-center">Branch</th>
                                                    <th  class="text-center">Address</th>
                                                    <th  class="text-center">DOB</th>
                                                    <th  class="text-center">Gender</th>
                                                    <th  class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Database db = new Database();

                                                    try {
                                                        int j = 0;
                                                        ResultSet rs= null;
                                                        
                                                        if(request.getParameter("branch") != null){ 
                                                        
                                                            if(request.getParameter("branch").equals("All")){   
                                                                rs = db.getStudents();
                                                            }
                                                            else{
                                                                rs = db.getStudentByBranch(request.getParameter("branch"));
                                                            }
                                                        }
                                                        else{
                                                            rs = db.getStudents();
                                                        }
                                                        
                                                        while (rs.next()) {
                                                %>
                                                <tr class="table-row">
                                                    <td><%=rs.getString("enrollno")%></td>
                                                    <td><%=rs.getString("name")%></td>
                                                    <td><%=rs.getString("email")%></td>
                                                    <td><%=rs.getString("mobileno")%></td>
                                                    <td><%=rs.getString("branch")%></td>
                                                    <td><%=rs.getString("address")%></td>
                                                    <td><%=rs.getString("dob")%></td>
                                                    <td><%=rs.getString("gender")%></td>
                                                    <td>
                                                        <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                            <input type="hidden" name="action" value="delete"/>
                                                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                            <input type="hidden" name="table" value="students"/>
<!--                                                            <a href="employee-edit.jsp?empid=<%=rs.getInt("id")%>" style="width:100px" class="btn btn-info btn-sm">Edit</a>-->
                                                            <button type="submit" class="btn btn-danger btn-sm" style="width:100px">Delete</button>
                                                        </form>
                                                    </td>	
                                                </tr>
                                                <%
                                                    j++;
                                                    }
                                                } catch (Exception e) {

                                                }
                                            %>
                                            </tbody>
                                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->

        <%@ include file="includes/footer.jsp" %>  
        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    </body>

</html>