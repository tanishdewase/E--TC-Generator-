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


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Welcome to Government Polytechnic, Arvi.</h4>
                        <h1 class="mb-5 display-3 text-primary">Leaving Certificate Generator</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("0")) {
                                            out.println("<div class='alert alert-danger'>Enrollment number is invalid!</div>");
                                        }
                                        if (status.equals("1")) {
                                            out.println("<div class='alert alert-success'>TC Generated Successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                        <h3>Generate Here</h3><br>
                        <form action="includes/WebService.jsp" method="post">
                            <input type="hidden" name="action" value="gentc"/>
                            <input type="text" class="w-100 form-control border-0 py-3 mb-4" required name="enrollno" placeholder="Enter Enrollment No.">
                            <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit">Generate TC</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
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