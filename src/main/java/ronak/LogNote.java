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
@WebServlet("/saveNote")
public class LogNote extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("username") == null){
                response.sendRedirect("signin.jsp");
            }
            String Uname = (String) session.getAttribute("username");
            String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
            String uname= "root";
            String pass = "root";
            String query = "insert into "+ Uname +" values(?,?,?,?)";
            String query2 = "select * from " + Uname;
            String title = request.getParameter("title");
            String date = request.getParameter("date");
            String body = request.getParameter("body");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = (Connection) DriverManager.getConnection(url, uname, pass);
            if (con == null){
                System.out.println("con is Null.");
            }
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query2);
            int id = 0;
            while(rs.next()){
                id = rs.getInt("id");
            }
            id = id+1;
            PreparedStatement s = con.prepareStatement(query);
            s.setInt(1, id);
            s.setString(2, title);
            s.setString(3, date);
            s.setString(4, body);
            int i = s.executeUpdate();
            s.close();
            con.close();
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
            Logger.getLogger(LogNote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LogNote.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
