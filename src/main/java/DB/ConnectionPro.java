package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionPro {
	
	 public static Connection getConnection() throws Exception{
	        
	        Class.forName("com.mysql.jdbc.Driver"); 
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee_management" , "root" , "supunvirajitha"); //database connection , username and password
	       
	        return con;
	        
	        
	    }

}
