package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class SearchBean {
	private String searchbar;

	public String getSearchbar() {
		return searchbar;
	}

	public void setSearchbar(String searchbar) {
		this.searchbar = searchbar;
	}
	
	public ResultSet searchVideo()
	{
		Connection con=null;
		PreparedStatement ps=null;
		String tokens[]=searchbar.split(" ");
		int i=0;
		List<String> arr=new ArrayList<String>();
		con=DbConnect.connect("yotube");
		String final_string="SELECT * FROM video WHERE title like ? OR description like ?";
		arr.add("%"+" "+searchbar+" "+"%");
		arr.add("%"+" "+searchbar+" "+"%");
		try {
			for(i=0;i<tokens.length-2;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+tokens[i]+" "+tokens[i+1]+" "+tokens[i+2]+"%");
				arr.add("%"+tokens[i]+" "+tokens[i+1]+" "+tokens[i+2]+"%");
			}
			for(i=0;i<tokens.length-1;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+tokens[i]+" "+tokens[i+1]+"%");
				arr.add("%"+tokens[i]+" "+tokens[i+1]+"%");
			}
			for(i=0;i<tokens.length;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+tokens[i]+"%");
				arr.add("%"+tokens[i]+"%");
			}
			for(i=0;i<tokens.length-2;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+" "+tokens[i]+" "+tokens[i+1]+" "+tokens[i+2]+" "+"%");
				arr.add("%"+" "+tokens[i]+" "+tokens[i+1]+" "+tokens[i+2]+" "+"%");
			}
			for(i=0;i<tokens.length-1;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+" "+tokens[i]+" "+tokens[i+1]+" "+"%");
				arr.add("%"+" "+tokens[i]+" "+tokens[i+1]+" "+"%");
			}
			for(i=0;i<tokens.length;i++)
			{
				final_string+=" UNION"+" SELECT * FROM video WHERE title like ? OR description like ?";
				arr.add("%"+" "+tokens[i]+" "+"%");
				arr.add("%"+" "+tokens[i]+" "+"%");
			}
			
			
			ps=con.prepareStatement(final_string);
			Iterator<String> i1=arr.iterator();
			int j=1;
			while(i1.hasNext())
			{
				ps.setString(j, i1.next());
				j++;
			}
			ResultSet rs=ps.executeQuery();
			return rs;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet searchDetails(String title1) throws SQLException
	{
		Connection con=DbConnect.connect("yotube");
		PreparedStatement stmt=con.prepareStatement("SELECT * FROM video, user WHERE video.title = ? AND video.userid = user.userid");
		stmt.setString(1,title1);
		ResultSet rs1=stmt.executeQuery();
		return rs1; 
	}
	
	public ResultSet comments(int vidid) throws SQLException
	{
		Connection con=DbConnect.connect("yotube");
		PreparedStatement stmt=con.prepareStatement("SELECT * FROM comments, user WHERE comments.videoid = ? AND comments.userid = user.userid");
		stmt.setInt(1,vidid);
		ResultSet rs1=stmt.executeQuery();
		return rs1; 
	}
	public void view(String title1) throws SQLException
	{
		Connection con=DbConnect.connect("yotube");
		PreparedStatement ps=con.prepareStatement("SELECT no_of_views  FROM video WHERE title = ?");
		ps.setString(1, title1);
		ResultSet rs=ps.executeQuery();
		rs.next();
		int no=rs.getInt("no_of_views");
		
		ps=con.prepareStatement("UPDATE video SET no_of_views=? WHERE title=?");
		ps.setInt(1, (no+1));
		ps.setString(2,title1);
		ps.executeUpdate();
		ps.close();
	}
	
	public ResultSet uploadedVideo(String userid) throws SQLException
	{
		Connection con=DbConnect.connect("yotube");
		PreparedStatement stmt=con.prepareStatement("SELECT * FROM video,user WHERE video.userid=? and video.userid = user.userid");
		stmt.setString(1,userid);
		ResultSet rs1=stmt.executeQuery();
		return rs1; 
	}
}

