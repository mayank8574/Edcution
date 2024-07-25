/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author mayan
 */
@WebServlet(name = "courseadd1", urlPatterns = {"/courseadd1"})
public class courseadd1 extends HttpServlet {

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
            out.println("<title>Servlet courseadd1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet courseadd1 at " + request.getContextPath() + "</h1>");
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
        String cname=request.getParameter("cname");
        String ccode=request.getParameter("ccode");
        String duration=request.getParameter("duration");
        String fee=request.getParameter("fee");
        String module=request.getParameter("module");
        String career=request.getParameter("career");
        HttpSession session=request.getSession();
        boolean flag=true;
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String query; 
        try{

            Class.forName("com.mysql.jdbc.Driver");
            
            con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
            query="select ccode from course where ccode='"+ccode+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                flag=false;

                session.setAttribute("msg","Course Code Already Exixts");
            }
            query="select ccode from course where cname='"+cname+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                flag=false;

                session.setAttribute("msg","Course Name Already Exixts");
            }
            
            if(flag)
            {
                out.print("name :"+query);
                ps=con.prepareStatement("insert into course (ccode,cname,duration,fee,module,career) values(?,?,?,?,?,?)");
                ps.setString(1,ccode);
                ps.setString(2,cname);
                ps.setString(3,duration);
                ps.setString(4,fee);
                ps.setString(5,module);
                ps.setString(6,career); 
                ps.executeUpdate(); 
               response.sendRedirect("User/Admin/coursedisplay.jsp");
               }
             else
            {
             session.setAttribute("ccode",ccode);
             session.setAttribute("cname",cname);
             session.setAttribute("duration",duration);
             session.setAttribute("fee",fee);
             session.setAttribute("module",module);
             session.setAttribute("career",career);
             response.sendRedirect("User/Admin/course.jsp");
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
