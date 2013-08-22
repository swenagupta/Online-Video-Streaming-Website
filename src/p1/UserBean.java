package p1;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserBean {
	public ResultSet displayRecord()
	{
		Connection con=DbConnect.connect("yotube");
		try {
			PreparedStatement stmt=con.prepareStatement("select * from user");
			
			
			ResultSet rs=stmt.executeQuery();
		
		    return rs;
		   
		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
		
	}
	public ResultSet viewRecord(String userid)
	{
		Connection con=DbConnect.connect("yotube");
		try {
			PreparedStatement stmt=con.prepareStatement("select * from user where userid=?");
			
			stmt.setString(1, userid);
			ResultSet rs=stmt.executeQuery();
			
		    return rs;
		    
		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public boolean deleteRecord(String userid)
	{
		Connection con=DbConnect.connect("yotube");
		try {
			
			PreparedStatement stmt=con.prepareStatement("select image from user where userid=?");
			stmt.setString(1, userid);
			ResultSet rs=stmt.executeQuery();
			rs.next();
			stmt=con.prepareStatement("delete from user where userid=?");
			stmt.setString(1, userid);
			int i=stmt.executeUpdate();
			
			File dir=new File("C:/Users/Hp/Desktop/JAVA_EE/yotube/WebContent/photos/"+rs.getString("image"));
			System.out.print(delete(dir));
			dir=new File("C:/Users/Hp/Desktop/JAVA_EE/yotube/WebContent/videos/"+userid);
			System.out.print(delete(dir));
			
			if(i!=0)
		    return true;
		    
		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
    public boolean delete(File dir)
    {
    	if(dir.isDirectory())
    	{
    	String files[] = dir.list();
		 
  	   for (String temp : files) {
  	      //construct the file structure
  	      File fileDelete = new File(dir, temp);
  	   
  	     fileDelete.delete();
  	   }
  	   }
  	    return dir.delete();
    }
}
