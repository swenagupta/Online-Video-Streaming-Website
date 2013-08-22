package p1;

import java.sql.*;

public class RecentBean {
	public ResultSet searchRecent()
	{
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=DbConnect.connect("yotube");
			ps=con.prepareStatement("SELECT * FROM video order by time_of_upload desc limit 12");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(Exception e){
			
		}
		return null;
	}
}
