/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Home;

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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        HttpSession session=request.getSession();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String query;
        boolean flag=true;
        try{

            Class.forName("com.mysql.jdbc.Driver");
            
            con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
            query="select * from login where email='"+email+"' and password='"+password+"'";
            out.print("name :"+query);
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            if(rs.next())
            {
                if(rs.getString("status").equals("B"))
                {
                    flag=false;
                    session.setAttribute("msg", "You are blocked.Please contact Admin");
                }
                else
                {
                    session.setAttribute("uid",email);
                    String profile =rs.getString("profile");
                    query="select * from student where email='"+email+"'";
                    ps=con.prepareStatement(query);
                    rs=ps.executeQuery();
                    if(rs.next())
                    {
                        session.setAttribute("uname",rs.getString("name"));
                        session.setAttribute("uprofile",rs.getString("profile"));
                        //session.setAttribute("us",rs.getString("id"));
                    }
                    if(profile.equals("A"))
                    {
                        response.sendRedirect("User/Admin/index.jsp");
                    }
                    else
                    {
                        response.sendRedirect("User/Student/index.jsp");
                    }
                }
              }
                      
               
            else{
                flag=false;
                session.setAttribute("msg","Please Enter a valid Email ID and Password");
            }
            if(flag==false)
            {
                response.sendRedirect("login.jsp");
            }
        }             
        catch(Exception e){

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
