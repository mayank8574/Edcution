/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Home;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileOutputStream;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.InputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.text.SimpleDateFormat;

/**
 *
 * @author mayan
 */
@MultipartConfig
@WebServlet(name = "CareerData", urlPatterns = {"/CareerData"})
public class CareerData extends HttpServlet {

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
            out.println("<title>Servlet CareerData</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CareerData at " + request.getContextPath() + "</h1>");
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
        String contact=request.getParameter("contact");
        String city=request.getParameter("city");
        String gender=request.getParameter("gender");
        String expreience=request.getParameter("expreience");
        SimpleDateFormat df=new SimpleDateFormat("dd-MMM-yyyy");
        java.util.Date d=new java.util.Date();
        String doc=df.format(d);
        HttpSession session=request.getSession();
        Part file=request.getPart("cv");
        String cv=file.getSubmittedFileName();
        String ext=cv.substring(cv.lastIndexOf("."));
        boolean flag=true;
        out.print("hi");
        if(cv.length()>0)
        {
            if(ext.equals(".pdf") || ext.equals(".docx"))
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
            flag=false;  
              session.setAttribute("msg","Please upload  File");
        }
        out.print("hi");
        if(flag)
       {
         Connection con;
         PreparedStatement ps;
         ResultSet rs;
         String query;
         out.print("hi");
        try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                    int id=0;
                    query="select id from career order by id desc";
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    if(rs.next())
                       {
                          id=rs.getInt("id");
                       }
                    id++;
                    cv=(String.valueOf(id))+ext;
                    String path="F:/Progrms/JSP/Edcuation/web/cv/"+cv;
                    FileOutputStream fos=new FileOutputStream(path);
                    InputStream is=file.getInputStream();
                    byte[] data=new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
              if(flag)
              {
                    out.print(gender);
                    ps=con.prepareStatement("insert into career (id,name,email,contact,city,gender,expreience,cv,doc) values(?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1,id);
                    ps.setString(2, name);
                    ps.setString(3,email);
                    ps.setString(4,contact);
                    ps.setString(5,city);
                    ps.setString(6,gender);
                    ps.setString(7,expreience);
                    ps.setString(8,cv);
                    ps.setString(9,doc);
                    ps.executeUpdate();
                    session.setAttribute("name","");
                    session.setAttribute("email","");
                    session.setAttribute("contact","");
                    session.setAttribute("gender"," ");          
                    session.setAttribute("city","");
                    session.setAttribute("expreience","");
                    response.sendRedirect("index.jsp");
              }
                
              
           } 
                catch(Exception e){}
            }  
        else
                 {
                    session.setAttribute("name",name);
                    session.setAttribute("email",email);
                    session.setAttribute("contact",contact);
                    session.setAttribute("gender",gender);
                    session.setAttribute("city",city);
                    session.setAttribute("expreience",expreience);
                    response.sendRedirect("careers.jsp");
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
