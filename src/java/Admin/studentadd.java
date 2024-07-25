/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

/**
 *
 * @author mayan
 */
@MultipartConfig
@WebServlet(name = "studentadd", urlPatterns = {"/studentadd"})
public class studentadd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet studentadd</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentadd at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String ccode =request.getParameter("ccode");
        String name =request.getParameter("name");
        String dob=request.getParameter("dob");
        String adhar=request.getParameter("adhar");
        String module=request.getParameter("module");
        String fname =request.getParameter("fname");
        String gender =request.getParameter("gender");
        String email =request.getParameter("email");
        String contact =request.getParameter("contact");
        String address=request.getParameter("address");
        String payment =request.getParameter("payment");
        String bank =request.getParameter("bank");
        String pfee=request.getParameter("pfee");
        String fee=request.getParameter("fee");
        
        SimpleDateFormat df=new SimpleDateFormat("dd-MMM-yyyy");
        java.util.Date d=new java.util.Date();
        String doa=df.format(d);
        String dof=df.format(d);
        HttpSession session=request.getSession();
        Part file=request.getPart("image");
        String filename=file.getSubmittedFileName();
       
        boolean flag=true,fu=false;
        //out.print("hi");
        String ext=" ";
        if(filename.length()>0)
        {
            ext=filename.substring(filename.lastIndexOf("."));
            fu=true;
            if(ext.equals(".jpg") || ext.equals(".png"))
            {
              flag=true;
            }  
            else
            {
                flag=false;
                session.setAttribute("msg", "Please upload a valid  File");
            }
        }
        else
        {
            if(gender.equals("M"))
                filename="male.jpg";
            else
                filename="female.jpg";
        }
        int diff=(Integer.parseInt(pfee)-Integer.parseInt(fee));
        if(diff>0)
          {
            flag=false;
            session.setAttribute("msg","Paid fee Is Greater than Fee");
          }
        //out.print(diff);
        if(flag)
       {
         Connection con;
         PreparedStatement ps;
         ResultSet rs;
         String query;
         //out.print("hi");
        try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                    
                    
                    query="select id from student where email='"+email+"'";
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    if(rs.next())
                    {
                        flag=false;
                        session.setAttribute("msg","Email-id already regestered" );
                    }
                    if(flag)
                    {
                        query="select id from student where adhar='"+adhar+"'";
                        ps=con.prepareStatement(query);
                        rs=ps.executeQuery();
                        if(rs.next())
                        {
                            flag=false;
                            session.setAttribute("msg","Adhar Number already regestered");
                        }
                    }
                    
                    
                    
                    //out.print(flag);
                    if(flag)
                    {
                      int id=0;
                    query="select id from login order by id desc";
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    
                    if(rs.next())
                       {
                          id=rs.getInt("id");
                       }
                    id++;
                    if(fu)
                    {
                        filename=(String.valueOf(id))+ext;
                        String path="F:/Progrms/JSP/Edcuation/web/User/Profile/"+filename;
                        FileOutputStream fos=new FileOutputStream(path);
                        InputStream is=file.getInputStream();
                        byte[] data=new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                        fos.close();
                    }
                    out.print(id);
                    ps=con.prepareStatement("insert into student (id,name,fname,email,contact,gender,address,adhar,dob,ccode,module,fee,profile,doa) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1,id);
                    ps.setString(2, name);
                    ps.setString(3,fname);
                    ps.setString(4,email);
                    ps.setString(5,contact);
                    ps.setString(6,gender);
                    ps.setString(7,address);
                    ps.setString(8,adhar );
                    ps.setString(9,dob);
                    ps.setString(10,ccode);
                    ps.setString(11,module);
                    ps.setString(12,fee);
                    ps.setString(13,filename );
                    ps.setString(14,doa);
                    ps.executeUpdate();
                    ps=con.prepareStatement("insert into fee (id,pfee,bname,pmode,dof) values(?,?,?,?,?)");
                    ps.setInt(1,id);
                    ps.setString(2, pfee);
                    ps.setString(3,bank);
                    ps.setString(4,payment);
                    ps.setString(5,dof);
                    ps.executeUpdate();
                    ps=con.prepareStatement("insert into login (id,email,password,profile,status) values(?,?,?,?,?)");
                    ps.setInt(1,id);
                    ps.setString(2,email);
                    ps.setString(3,"student12");
                    ps.setString(4,"S");
                    ps.setString(5,"A");
                    ps.executeUpdate();
                    
                    session.setAttribute("name","");
                    session.setAttribute("fname","");
                    session.setAttribute("email","");
                    session.setAttribute("contact","");
                    session.setAttribute("gender"," ");          
                    session.setAttribute("address","");
                    session.setAttribute("adhar","");
                    session.setAttribute("dob","");
                    session.setAttribute("module","");
                    session.setAttribute("pfee","");
                    session.setAttribute("bank","");
                    session.setAttribute("payment","");
                    
                    response.sendRedirect("User/Admin/studentdisplay.jsp");
              }
            
        }
        catch(Exception e){}
       } 
        if(flag==false)
        {
            session.setAttribute("name",name);
            session.setAttribute("fname",fname);
            session.setAttribute("email",email);
            session.setAttribute("contact",contact);
            session.setAttribute("gender",gender);          
            session.setAttribute("address",address);
            session.setAttribute("adhar",adhar);
            session.setAttribute("ccode",ccode);
            session.setAttribute("dob",dob);
            session.setAttribute("module",module);
            session.setAttribute("pfee",pfee);
            session.setAttribute("bank",bank);
            session.setAttribute("payment",payment);

            response.sendRedirect("User/Admin/student.jsp"); 
        }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
