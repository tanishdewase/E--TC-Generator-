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
                            <div class="text-center mx-auto" style="max-width: 700px;">
                                <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("0")) {
                                            out.println("<div class='alert alert-danger'>Internal server error!</div>");
                                        }
                                        if (status.equals("1")) {
                                            out.println("<div class='alert alert-success'>Studdent added successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                                <h1 class="text-primary">Add new student</h1>
                            </div>
                        </div>
                        
                        <div class="col-lg-12">
                            <form action="includes/WebService.jsp" method="post">
                                <input type="hidden" name="action" value="addstudent"/>
                                <div class="row">
                                    <div class="col-lg-6">
                                    <input type="text" class="w-100 form-control border-0 py-3 mb-4" name="enrollno" required placeholder="Your enrollment number">
                                    </div>
                                    <div class="col-lg-6">
                                    <input type="text" class="w-100 form-control border-0 py-3 mb-4" name="name" required placeholder="Enter Your name">
                                    </div>
                                    <div class="col-lg-6">
                                    <input type="email" class="w-100 form-control border-0 py-3 mb-4" name="email" required placeholder="Enter Your Email">
                                    </div>
                                    <div class="col-lg-6">
                                    <input type="text" class="w-100 form-control border-0 py-3 mb-4" name="mobileno" required placeholder="Enter Your mobile no">
                                    </div>
                                    <div class="col-lg-6">
                                    <select class="w-100 form-control border-0 py-3 mb-4" name="branch" required >
                                        <option value="CS">CS</option>
                                        <option value="IT">IT</option>
                                        <option value="ME">ME</option>
                                        <option value="EE">EE</option>
                                        <option value="EXTC">EXTC</option>
                                    </select>
                                    </div>
                                    <div class="col-lg-6">
                                    <input type="text" class="w-100 form-control border-0 py-3 mb-4" name="address" required placeholder="Enter Your address">
                                    </div>
                                    <div class="col-lg-6">
                                    <input type="date" class="w-100 form-control border-0 py-3 mb-4" name="dob" required placeholder="Enter Your date of birth">
                                    </div>
                                    <div class="col-lg-6">
                                    <select class="w-100 form-control border-0 py-3 mb-4" name="gender" required >
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                    </div>
                                    <div class="col-lg-12">
                                    <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit">Submit</button>
                                    </div>
                                </div>
                            </form>
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