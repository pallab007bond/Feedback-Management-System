/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fmspackage;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import static org.apache.tomcat.jni.Buffer.address;
import static org.eclipse.jdt.internal.compiler.parser.Parser.name;
/**
 *
 * @author Pallab Banerjee
 */
public class fmsJavaBeans {
    String aname,apassword,fname,sdept,ddept,dpassword,fsub,fdept,spassword;
    int aid,did,fid,sattendance,sroll,ssem,fsem;

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getSdept() {
        return sdept;
    }

    public void setSdept(String sdept) {
        this.sdept = sdept;
    }

    public String getDdept() {
        return ddept;
    }

    public void setDdept(String ddept) {
        this.ddept = ddept;
    }

    public String getDpassword() {
        return dpassword;
    }

    public void setDpassword(String dpassword) {
        this.dpassword = dpassword;
    }

    public String getFsub() {
        return fsub;
    }

    public void setFsub(String fsub) {
        this.fsub = fsub;
    }

    public String getFdep() {
        return fdept;
    }

    public void setFdept(String fdept) {
        this.fdept = fdept;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getSattendance() {
        return sattendance;
    }

    public void setSattendance(int sattendance) {
        this.sattendance = sattendance;
    }

    public int getSroll() {
        return sroll;
    }

    public void setSroll(int sroll) {
        this.sroll = sroll;
    }

    public int getSsem() {
        return ssem;
    }

    public void setSsem(int ssem) {
        this.ssem = ssem;
    }

    public int getFsem() {
        return fsem;
    }

    public void setFsem(int fsem) {
        this.fsem = fsem;
    }
    Connection con = ConnectionProvider.getConnection();
     public int save()
    {
        int i = 0;
        String s=null;
        try
        {
         //Connection con = ConnectionProvider.getConnection();
         PreparedStatement pstmt2 = con.prepareStatement("insert into studenttable values(?,?,?,?,?)");
         pstmt2.setString(1,sdept);
         pstmt2.setInt(2,ssem);
         pstmt2.setInt(3,sroll);
         pstmt2.setInt(4,0);
         pstmt2.setString(5,spassword);
         i = pstmt2.executeUpdate();
        
         if(i!=0)
         {
             return i;
         }
         pstmt2.close();
         con.close();
         
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }
     public int addFaculty()
    {
        int i = 0;
        String s=null;
        try
        {
         PreparedStatement pstmt2 = con.prepareStatement("insert into facultytable values(?,?,?)");
         pstmt2.setInt(1,fid);
         pstmt2.setString(2,fname);
         pstmt2.setString(3,fdept);
         i = pstmt2.executeUpdate();
        
         if(i!=0)
         {
             return i;
         }
         pstmt2.close();
         con.close();
         
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }
     public boolean finds(HttpServletRequest request)
     {
         boolean flag=false;
      try{
         HttpSession session;
      session=request.getSession();
     String sroll1= request.getParameter("sroll1");
     String [] arrOfStr = sroll1.split("/");
     sdept=arrOfStr[1];
     int roll=Integer.parseInt(arrOfStr[2]);
      PreparedStatement pstmt = con.prepareStatement("select * from studenttable where sdept=? and spassword=? and sroll=?");
      pstmt.setString(1,sdept);
      pstmt.setInt(3,roll);
      session.setAttribute("sdept",sdept);
      pstmt.setString(2,spassword);
      System.out.println(sdept+" "+roll+" "+spassword);
      ResultSet rset = pstmt.executeQuery();
      if(rset.next())
      {
        session.setAttribute("ssem",rset.getInt(2));
        session.setAttribute("sattendance",rset.getString(4));
        flag=true;
      }
      }catch(SQLException e)
       {
           e.printStackTrace();
       }
        return flag;
     }
     public String generatePassword(HttpServletRequest request)
     {
         String deptpass=request.getParameter("deptpass");
         dpassword=deptpass+"-"+(int)((Math.random()*((10000-100)+1))+100); 
         try
         {
         PreparedStatement pstmt2 = con.prepareStatement("update departmenttable set dpassword=? where ddept=?");
         pstmt2.setString(1,dpassword);
         pstmt2.setString(2,deptpass);
         pstmt2.executeUpdate();
         }catch(SQLException e)
         {
             e.printStackTrace();
         }
         return dpassword;
     }
     
     public boolean finda(HttpServletRequest request)
    {
       boolean flag= false;
    try
     {
      HttpSession session;
      session=request.getSession();
     // Connection con = ConnectionProvider.getConnection();
      PreparedStatement pstmt = con.prepareStatement("select * from admintable where aname=? and apassword=?");
      pstmt.setString(1,aname);
      //session.setAttribute("adminname",aname);
      pstmt.setString(2,apassword);     
      ResultSet rset=pstmt.executeQuery();
      if(rset.next())
        {
         session.setAttribute("adminname",rset.getString(2));
         flag = true;   
        }
     }catch(SQLException e)
       {
           e.printStackTrace();
       }
        return flag;
     }
     public ResultSet fdet(HttpServletRequest request)
     {
         PreparedStatement pstmt = null;
         ResultSet rset = null;
try
{
String fdept=request.getParameter("fdept");
pstmt = con.prepareStatement("select * from facultytable where fdept = ?");
pstmt.setString(1,fdept);
  rset = pstmt.executeQuery();
 }catch(Exception e){
    e.printStackTrace();
}
  return rset;
     }
    
}
