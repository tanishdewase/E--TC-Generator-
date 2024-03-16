<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
    String adminlogin1 = String.valueOf(session.getAttribute("adminlogin"));
    
%>
<!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Government Polytechnic,Deurwada road,Arvi</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">office.gparvi@dtemaharashtra.gov.in</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a class="text-white">Contact no : 07157-222680</a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <img src="img/msbte.gif" alt="alt" style="width: 70px;"/>
                    <a href="index.jsp" class="navbar-brand"><h1 class="text-primary display-6" style="font-size: 1.8rem; "> Government Polytechnic, Arvi.</h1><h6>Approved by AICTE, Recognised by DTE & Affiliated to MSBTE</h6></a>
                    
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    
                    <%
                    
                    if(adminlogin1 != "null"){
                    %>
                   <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home.jsp" class="nav-item nav-link active">Generate TC</a>
                            <a href="students.jsp" class="nav-item nav-link">Students</a>
                            <a href="contacts.jsp" class="nav-item nav-link">Contacts</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                    </div>
                    <%
                        }else{
                    %>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="about.jsp" class="nav-item nav-link">About Us</a>
                            <a href="contact.jsp" class="nav-item nav-link">Contact Us</a>
                        </div>
                    </div>
                    <%
                    }
                    %>
                    
                </nav>
            </div>
        </div>
        <!-- Navbar End -->