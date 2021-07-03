/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ronak;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RONAK MALKAN
 */
@WebServlet("/delete")
public class delete extends HttpServlet {

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
            HttpSession session = request.getSession();
            if(session.getAttribute("username") == null){
                response.sendRedirect("signin.jsp");
            }
            String Uname = (String) session.getAttribute("username");
            String id = session.getAttribute("Id").toString();
            int Id = Integer.parseInt(id);
            String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
            String uname= "root";
            String pass = "root";
            String query = "delete from "+ Uname +" where id='"+ Id +"'";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = (Connection) DriverManager.getConnection(url, uname, pass);
            if (con == null){
                System.out.println("con is Null.");
            }
            Statement st = con.createStatement();
            int i = st.executeUpdate(query);
            if(session.getAttribute("theme")==null) response.sendRedirect("home.jsp");
            String theme = (String) session.getAttribute("theme");
            if(theme == "dark"){
                response.sendRedirect("home.jsp");
            }
            else if(theme == "matrix"){
                response.sendRedirect("home2.jsp");
            }
            else if(theme == "light"){
                response.sendRedirect("home3.jsp");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
