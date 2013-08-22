package p1;

import java.sql.DriverManager;
import java.sql.*;

public class DbConnect {
	    static	Connection conn=null;
	    static public Connection connect(String dbName)
	    {
		   System.out.println("MySQL Connection"); 
		   if(conn == null)
		   {
			   String url = "jdbc:mysql://localhost:3306/"; 
			    
			   String driver = "com.mysql.jdbc.Driver"; 
			   String userName = "root"; 
			   String password = ""; 
			   try{
				   Class.forName(driver).newInstance(); 
				   conn = DriverManager.getConnection(url+dbName,userName,password); 
				   System.out.println("Connected to the database...");
			   }
			   catch(Exception e){
			   } 
		    }
		   return conn; 
	    }
}
