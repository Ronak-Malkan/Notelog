
package ronak;

import java.sql.*;

public class checkSignup {
    String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
    String uname= "root";
    String pass = "root";
    
    public boolean checkUname(String Uname, String Pass) throws ClassNotFoundException, SQLException{
        
        String query = "select * from users where username='"+Uname+"'";
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
            return false;
        }
        
        query = "insert into users values(?,?)";
        PreparedStatement s = con.prepareStatement(query);
        s.setString(1, Uname);
        s.setString(2, Pass);
        int i = s.executeUpdate();
        query = "CREATE TABLE " + Uname + " " +
                "(id INT, title VARCHAR(255), " +
                " date VARCHAR(255), " +
                " body MEDIUMTEXT not NULL)";
        Statement stm = con.createStatement();
        int j = stm.executeUpdate(query); 
        stm.close();
        st.close();
        con.close();
        return true;
    }
}
