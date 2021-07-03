/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ronak;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author RONAK MALKAN
 */
@WebServlet("/signup")
public class signUp extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        //response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String uname = request.getParameter("Username");
            String pass = request.getParameter("Password");
            String status;
            checkSignup s = new checkSignup();
            try {
                if(s.checkUname(uname, pass) == false){
                    status = "unameexists";
                    session.setAttribute("status", status);
                    response.sendRedirect("signup.jsp");
                }
                else{
                    status = "successful";
                    session.setAttribute("status", status);
                    response.sendRedirect("signup.jsp");
                }
                    
            } catch (ClassNotFoundException ex) { 
                out.println("Classnotfound");
            } catch (SQLException ex) {
                out.println("Sql exception");
            }
        }
    }

}
