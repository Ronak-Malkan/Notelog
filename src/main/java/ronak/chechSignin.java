
package ronak;

import java.sql.*;

public class chechSignin {
    String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
    String uname= "root";
    String pass = "root";
    
    public boolean checkUnamePass(String Uname, String Pass) throws ClassNotFoundException, SQLException{
        
        String query = "select * from users where username='"+Uname+"' AND password='" + Pass + "'";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con;
        con = (Connection) DriverManager.getConnection(url, uname, pass);
        if (con == null){
            System.out.println("con is Null.");
        }
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.next()){
            st.close();
            con.close();
            return true;
        }
        st.close();
        con.close();
        return false;
    }
}
