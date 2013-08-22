package p1;

import java.sql.Connection;
import java.sql.*;



public class CategoryBean {
	private String category;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public ResultSet selectVideo() throws SQLException
	{
		Connection con=DbConnect.connect("yotube");
		System.out.print(category);
		
		PreparedStatement ps=con.prepareStatement("select * from video,user where video.category=? " +
				"and video.userid=user.userid ");
		ps.setString(1, category);
		ResultSet rs=ps.executeQuery();
		
		//ps=con.prepareStatement("select category from video where videoid=5");
		//rs=ps.executeQuery();
		//rs.next();
		//System.out.print(rs.getString("category"));
		return rs;
	}
}
