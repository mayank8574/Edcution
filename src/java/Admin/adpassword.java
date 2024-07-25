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
 * @author Mayank Awasthi
 */
@WebServlet(name = "adpassword", urlPatterns = {"/adpassword"})
public class adpassword extends HttpServlet {

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
            out.println("<title>Servlet adpassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adpassword at " + request.getContextPath() + "</h1>");
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
        String opass=request.getParameter("opass");
        String npass=request.getParameter("npass");
        HttpSession session=request.getSession();
        String uid=(String)session.getAttribute("uid");
        boolean flag=true;
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String query;
        out.print(uid);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
            
           // out.print("name :"+name+"\ntemp_e :"+temp_e+"\nEmail : "+email);
                 out.print(uid);
           
                 query="select email from login where email='"+uid+"' and password='"+opass+"'";
                 out.print("name :"+query);
                 ps=con.prepareStatement(query);
                 rs=ps.executeQuery();
                 if(rs.next())
                 {
                    ps=con.prepareStatement("update login set password=? where email= ?");
                    ps.setString(1,npass);
                    ps.setString(2,uid);
                    ps.executeUpdate();
                    response.sendRedirect("User/Admin/index.jsp");      
                 }
                 else
                 {
                    
                     session.setAttribute("msg", "Invaild Old Password");
                     response.sendRedirect("User/Admin/resetpassword.jsp");
                 }
            
        }
        catch(Exception E){}
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
