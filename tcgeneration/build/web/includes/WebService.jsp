
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="database.sendSMS"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db = new Database();
    String action = request.getParameter("action");
    System.out.println(action);
    switch (action) {
        case "loginuser":
            String uusername = request.getParameter("uname");
            String upassword = request.getParameter("pass");
                int resuser = db.checkAdminLogin(uusername, upassword);
                if (resuser > 0) {
                    session.setAttribute("adminlogin", resuser);
                    response.sendRedirect("../home.jsp");
                } else {
                    response.sendRedirect("../index.jsp?status=0");
                }
            break;
        case "gentc":
            String genrollno = request.getParameter("enrollno");
            int resgen = db.checkEnrollno(genrollno);
                if (resgen > 0) {
                    response.sendRedirect("../gentc.jsp?enrollno="+genrollno);
                } else {
                    response.sendRedirect("../home.jsp?status=0");
                }
            
            break;
        case "addcontact":
            String mname = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
                int res2 = db.update_delete("insert into contacts (name,email,message) value('" + mname + "','" + email + "','" + message + "')");
                if (res2 > 0) {
                    response.sendRedirect("../contact.jsp?status=1");
                }
            break;
        case "addstudent":
            String enrollno = request.getParameter("enrollno");
            String sname = request.getParameter("name");
            String semail = request.getParameter("email");
            String smobileno = request.getParameter("mobileno");
            String branch = request.getParameter("branch");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
                int sres2 = db.update_delete("insert into students (enrollno,name,email,mobileno,branch,address,dob,gender) value('" + enrollno + "','" + sname + "','" + semail + "','" + smobileno + "','" + branch + "','" + address + "','" + dob + "','" + gender + "')");
                if (sres2 > 0) {
                    response.sendRedirect("../students.jsp?status=1");
                }
            break;
        case "delete":
            String table = request.getParameter("table");
            String did = request.getParameter("id");
            boolean dreds = db.delete(table, Integer.parseInt(did));
            if (dreds) {
                if (table.equals("students")) {
                    response.sendRedirect("../students.jsp?status=2");
                } else if (table.equals("contacts")) {
                    response.sendRedirect("../contacts.jsp?status=0");
                }
            } else {
                response.sendRedirect("../?status=0");
            }
            break;
        
        case "resendotp":
            String mobileno = request.getParameter("mobile");
            String noo = db.getRandomNumberString();
            String msg = "Your One Time Password (OTP) is " + noo + " for new citizen account.";
            session.setAttribute("otpsession", noo);
            System.out.println(noo);
            out.println(1);
            break;
        
    }
    db.closeDb();
%>
