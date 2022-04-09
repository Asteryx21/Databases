
package projectbd;
import java.sql.*;
import javax.swing.JOptionPane;

public class MySQLConnection {
   
    static Connection myConn;
    
    public static Connection getConnection(){
       try {
        
        String dbRoot ="jdbc:mysql://localhost:3306/bd_database";   
        String hostUsername = "root";
        String hostPassword = "";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection myConn = DriverManager.getConnection(dbRoot,hostUsername,hostPassword);
       }
       catch(Exception ex) {
           System.out.println(""+ex);
       }
        return myConn;
    
    }
    
    
}
