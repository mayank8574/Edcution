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

/**
 *
 * @author mayan
 */
@MultipartConfig
@WebServlet(name = "studentedit", urlPatterns = {"/studentedit"})
public class studentedit extends HttpServlet {

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
            out.println("<title>Servlet studentedit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentedit at " + request.getContextPath() + "</h1>");
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
        String name=request.getParameter("name");
        String email=request.getParameter("email");
         
        String adhar=request.getParameter("adhar");
        String fname =request.getParameter("fname");
        String dob=request.getParameter("dob");
        String contact=request.getParameter("contact");
        String gender=request.getParameter("gender");
        String address=request.getParameter("address");
        
        HttpSession session=request.getSession();
        String temp_e=(String)session.getAttribute("temp");
        String temp_b=(String)session.getAttribute("temp1");
        String profile=(String)session.getAttribute("profile");
        String id=(String)session.getAttribute("id");
        
        Part file=request.getPart("image");
        String filename=file.getSubmittedFileName();
        //out.print(ext+"\n"+"Filename"+filename+"\n");
        boolean flag=true;
        if(filename.length()>0)
        {
            String ext=filename.substring(filename.lastIndexOf("."));
            filename=(String.valueOf(id))+ext;
            if(ext.equals(".jpg") || ext.equals(".png"))
            {
                String path="F:/Progrms/JSP/Edcuation/web/User/Profile/"+filename;
                try
                {
                    FileOutputStream fos=new FileOutputStream(path);
                    InputStream is=file.getInputStream();
                    byte[] data=new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                }
                catch(Exception e){}
            }  
            else
            {
                flag=false;
                session.setAttribute("msg", "Please upload a Image File");
            }
        }
        else
            filename=(String)session.getAttribute("profile");
        
        
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        
        
        String query;
       out.print(id);
        //out.print("name :"+name+"email :"+email+"contact :"+contact+"salary :"+salary+"address :"+address+"gender :"+gender+"department :"+department);
        try{

            Class.forName("com.mysql.jdbc.Driver");
            
            con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
            
           // out.print("name :"+name+"\ntemp_e :"+temp_e+"\nEmail : "+email);
            //out.print(id);
            if(temp_e.equals(email)==false)
            {
                 query="select id from student where email='"+email+"'";
                 out.print("name :"+query);
                 ps=con.prepareStatement(query);
                 rs=ps.executeQuery();
                 if(rs.next())
                 {
                     flag=false;

                      session.setAttribute("msg","Email-id already regestered");
                 }
            }
            else if(temp_b.equals(adhar)==false)
            {
                 query="select id from student where adhar='"+adhar+"'";
                 out.print("name :"+query);
                 ps=con.prepareStatement(query);
                 rs=ps.executeQuery();
                 if(rs.next())
                 {
                     flag=false;

                      session.setAttribute("msg","Adhar Number already regestered");
                 }
            
            }
            out.print("hi");    
            if(flag)
            {
                
                ps=con.prepareStatement("update student set name=?,email=?,adhar=?,fname=?,dob=?,contact=?,gender=?,address=?,profile=? where id= ?");
                ps.setString(1,name);
                ps.setString(2,email);
               
                ps.setString(3,adhar);
                ps.setString(4,fname);
                ps.setString(5,dob); 
                out.print(filename);
                ps.setString(6,contact); 
                ps.setString(7,gender);
                ps.setString(8,address);
                ps.setString(9,filename);
                ps.setString(10,id);
                ps.executeUpdate();
                response.sendRedirect("User/Admin/studentdisplay.jsp");
                
            }
            else
            {
            session.setAttribute("name",name);
             session.setAttribute("email",email);
           
             session.setAttribute("adhar",adhar);
             session.setAttribute("fname",fname);
             session.setAttribute("dob",dob);
             session.setAttribute("contact",contact);
             session.setAttribute("gender",gender); 
             session.setAttribute("address",address); 
             response.sendRedirect("User/Admin/studentedit.jsp");
            }
            
            
        }
        catch(Exception e)
        {}

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