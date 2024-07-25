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
import java.text.SimpleDateFormat;

/**
 *
 * @author mayan
 */
@WebServlet(name = "payment", urlPatterns = {"/payment"})
public class payment extends HttpServlet {

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
            out.println("<title>Servlet payment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment at " + request.getContextPath() + "</h1>");
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
     String payment=request.getParameter("payment");
     String bank =request.getParameter("bank");
     String rf =request.getParameter("rf");
     String bal =request.getParameter("bal");
     SimpleDateFormat df=new SimpleDateFormat("dd-MMM-yyyy");
     java.util.Date d=new java.util.Date();
     String dof=df.format(d);
     boolean flag=true;
     
     HttpSession session=request.getSession();
     String id=(String)session.getAttribute("id");

     int diff=(Integer.parseInt(rf)-Integer.parseInt(bal));
        if(diff>0)
          {
            flag=false;
            session.setAttribute("msg","Paid fee Is Greater than Fee");
          }
     if(flag)
     {
     try{
         Connection con;
         PreparedStatement ps;
         ResultSet rs;
         String query;
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
         ps=con.prepareStatement("insert into fee (id,pmode,bname,pfee,dof) values(?,?,?,?,?)");
         ps.setString(1,id);
         ps.setString(2,payment);
         ps.setString(3,bank);
         ps.setString(4,rf);
         ps.setString(5,dof);
         ps.executeUpdate();
         response.sendRedirect("User/Admin/studentdisplay.jsp");
     }
     
    
     catch(Exception e){}

     }
     if(flag==false)
     {
            session.setAttribute("payment",payment);
            session.setAttribute("bank",bank);
            session.setAttribute("rf",rf);
            response.sendRedirect("User/Admin/payment.jsp"); 
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
