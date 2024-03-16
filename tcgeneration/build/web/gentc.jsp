<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%
Database db = new Database();
ResultSet stud = db.getStudentByEnrollno(request.getParameter("enrollno"));
stud.next();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Online Leaving Certificate Generation System</title>
    <style>
        
    </style>
</head>

<body>
    <a href="home.jsp" style="background-color:#000; font-size:30px; color:#fff">Back</a>
    <table style="margin:0px 300px" id="mainblock">
        <tr><th style="display:inline-block; width:100%">
            <div style="width:20%; float:left;">
                <img src="img/msbte.gif" style="width:120px"/>
            </div>
            <div style="width:70%; text-transform: uppercase; float:left;">
                <center><h1>Government Polytechnic, Arvi</h1></center>
                <center><h3>DIST-WARDHA[M.S.]</h3></center>
            </div>
            <hr style="height:10px; width:100%; background-color:#000">
        </th></tr>
        <tr><th>
                <table style="width:100%">
                    <tr><th align="left">Computerised T.C. Book No. <span contentEditable="true">40</span></th><th>T.C.No. <span contentEditable="true">90</span></th></tr>
                </table>
            </th></tr>
        <tr><th>
        <center><h1 style=""><U>LEAVING CERTIFICATE</U></h1></center>
            </th></tr>
        <tr><th>
        <center><h6 style=""><p style="font-size:18px">(No change in any entry in this Certificate shall be made except by the authority issuing it and any infringement of this requirement is liable to involve the imposition of a penalty such as that rusticatial )</p></h6></center>
            </th></tr>
        <tr><th style="display:inline-block; width:100%"><br>
            <div style="">
                <table style="width:80%; font-weight: 200; line-height: 20px;">
                    <tr><td align="left">1. Registered Number of the Candidate : </td><td align="left"><%=stud.getString("regcandno")%></td></tr>
                    <tr><td align="left">2. Name of the Candidate(in full) : </td><td align="left"><%=stud.getString("namecand")%></td></tr>
                    <tr><td align="left">3. Mother Name : </td><td align="left"><%=stud.getString("mothername")%></td></tr>
                    <tr><td align="left">
                        4 . Race : - Caste : <%=stud.getString("caste")%>
                    </td><td>
                    Sub-Caste : <%=stud.getString("subcaste")%>
                    </td></tr>
                    <tr><td align="left">5. Place of birth : <%=stud.getString("placebirth")%></td><td align="left">Nationality : <%=stud.getString("nation")%></td></tr>
                    <tr><td align="left">6. Date of birth according to the Christian Era in words and figures. : </td><td align="left"><%=stud.getString("dobwords")%></td></tr>
                    <tr><td align="left">7. Institute last attended : </td><td align="left"><%=stud.getString("lastinstitute")%></td></tr>
                    <tr><td align="left">8. Date of Admission : </td><td align="left"><%=stud.getString("admissiondate")%></td></tr>
                    <tr><td align="left">9. Progress : </td><td align="left"><%=stud.getString("progress")%></td></tr>
                    <tr><td align="left">10. Conduct : </td><td align="left"><%=stud.getString("conduct")%></td></tr>
                    <tr><td align="left">11. Date of Leaving : </td><td align="left"><%=stud.getString("leavingdate")%></td></tr>
                    <tr><td align="left">12. Course and year in which studing :  </td><td align="left"><%=stud.getString("course")%></td></tr>
                    <tr><td align="left">13. Reason Of Leaving : </td><td align="left"><%=stud.getString("reason")%></td></tr>
                    <tr><td align="left">14. Remarks : </td><td align="left"><span style="text-transform: uppercase;" contentEditable="true">aas</span></td></tr>
                </table>
            </div>
        </th></tr>
        <tr><th>
        <center><h6 style=""><p style="font-size:18px; text-align: left">Certified that the above information is in accordence with the institution register.</p></h6><br></center>
            </th></tr>
        <tr><th style="display:inline-block; width:100%">
            <div style="width:20%; float:left; text-align: left;">
                Date : <br><br>
                Place : Arvi <br>
            </div>
            <div style="width:30%; text-transform: uppercase; float:left;">
                <center><h5>Signature<br> Of Clerk</h5></center>
            </div>
            <div style="width:50%; text-transform: uppercase; float:left;">
                <center><h5>Government Polytechnic, Arvi</h5></center>
            </div>
        </th></tr>
    </table>
    <br><br><br>
    <center><button onclick="printContent('mainblock')" style="background-color:orange; color:#fff; border:1px solid orange; font-size:60px;">Print</button></center>
    <br><br>
</body>

<script>
    function printContent(div) {
      // Get the content of the specific div
      var contentToPrint = document.getElementById(div).innerHTML;

      // Create a new window for printing
      var printWindow = window.open('', '_blank');

      // Write the content to the new window
      printWindow.document.write('<html><head><title>Print</title></head><body>' + contentToPrint + '</body></html>');

      // Close the document stream
      printWindow.document.close();

      // Trigger the print function
      printWindow.print();
    }
    
  </script>
</html>