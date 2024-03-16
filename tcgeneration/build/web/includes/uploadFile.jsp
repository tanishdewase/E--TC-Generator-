
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="database.Database"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  
//   System.out.println("asdasd");
    String saveFile =new String();
    String contentType=request.getContentType();
//    out.println(contentType);
    if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0)){
        DataInputStream in=new DataInputStream(request.getInputStream());
        int formDataLength=request.getContentLength();
        byte dataBytes[]=new byte[formDataLength];
        int byteRead=0;
        int totalBytesRead=0;
        while(totalBytesRead<formDataLength)
        {
            byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
            totalBytesRead+=byteRead;
        }
        
        String file=new String(dataBytes,"CP1256");
        
        saveFile=file.substring(file.indexOf("filename=\"")+ 10);
        saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
        saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
        
        int lastIndex=contentType.lastIndexOf("=");
        String boundary=contentType.substring(lastIndex+1, contentType.length());
        
        int pos;
        pos=file.indexOf("filename=\"");
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        
        int boundaryLocation=file.indexOf(boundary,pos);
        
        //int startPos=((file.substring(0,pos)).getBytes()).length;
        int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
        //int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
        //out.println(file);
        //out.println(endPos);
        String saveFile1="C:/Users/Akshay Bahadarpure/Documents/NetBeansProjects/tcgeneration/web/uploads/"+saveFile;
        File ff=new File(saveFile1);
        System.out.print(saveFile1);
        try{
            Database db=new Database();
            
            FileOutputStream fileout=new FileOutputStream(ff);
            fileout.write(dataBytes,startPos,(endPos-startPos));
            fileout.flush();
            
            boolean isFirstLine = true;
            String line = null;
            BufferedReader input = new BufferedReader(new FileReader(saveFile1));
            while (( line = input.readLine()) != null){
            
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                
                String[] cells = line.split(",");
                
                if (cells.length < 2) {
                    System.out.println("Line doesn't contain enough fields: " + line);
                    continue;
                }
                
                String enrollno = cells[0];
                String regcandno = cells[1];
                String namecand = cells[2];
                String mothername = cells[3];
                String race = cells[4];
                String caste = cells[5];
                String subcaste = cells[6];
                String placebirth = cells[7];
                String nation = cells[8];
                String dob = cells[9];
                String dobwords = cells[10];
                String lastinstitute = cells[11];
                String admissiondate = cells[12];
                String progress = cells[13];
                String conduct = cells[14];
                String leavingdate = cells[15];
                String course = cells[16];
                String reason = cells[17];
                
                ResultSet res = db.selectAll("select * from students where enrollno='"+enrollno+"'");
                if(res.next()){
                    int res2 = db.update_delete("update students set regcandno='"+regcandno+"',name='"+namecand+"',namecand='"+namecand+"',mothername='"+mothername+"',"
                    + "race='"+race+"',caste='"+caste+"',subcaste='"+subcaste+"',placebirth='"+placebirth+"',nation='"+nation+"',dob='"+dob+"',"
                    + "dobwords='"+dobwords+"',lastinstitute='"+lastinstitute+"',admissiondate='"+admissiondate+"',progress='"+progress+"',"
                    + "conduct='"+conduct+"',leavingdate='"+leavingdate+"',course='"+course+"',reason='"+reason+"' where enrollno='"+enrollno+"'");
                    
                }else{
                    int res2 = db.update_delete("insert into students(regcandno,namecand,mothername,race,caste,subcaste,placebirth,nation,dob,dobwords,lastinstitute,"
                    + "admissiondate,progress,conduct,leavingdate,course,reason,enrollno,name) values('"+regcandno+"','"+namecand+"','"+mothername+"','"+race+"'"
                    + ",'"+caste+"','"+subcaste+"','"+placebirth+"','"+nation+"','"+dob+"','"+dobwords+"','"+lastinstitute+"','"+admissiondate+"'"
                    + ",'"+progress+"','"+conduct+"','"+leavingdate+"','"+course+"','"+reason+"','"+enrollno+"','"+namecand+"')");
                }
                
                System.out.println("asdas");
            }
//            input.close();
            response.sendRedirect("../students.jsp?status=11");
           
        }catch(Exception e){
            out.println(e);
            System.out.println(e);
        }
    }
%>