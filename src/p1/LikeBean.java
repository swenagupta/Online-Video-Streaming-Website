package p1;

import java.sql.*;



public class LikeBean {
	private String userid;
	private int videoid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getVideoid() {
		return videoid;
	}
	public void setVideoid(int videoid) {
		this.videoid = videoid;
	}
	
	public boolean like() throws SQLException
	{
		boolean flag=true;
		Connection con=DbConnect.connect("yotube");
		PreparedStatement ps=con.prepareStatement("select likeid from likes where userid=? and videoid=?");
		ps.setString(1, userid);
		ps.setInt(2, videoid);
		System.out.println("reached");
		ResultSet rs=ps.executeQuery();
		
		PreparedStatement ps1=con.prepareStatement("select no_of_likes from video where videoid=?");
		ps1.setInt(1, getVideoid());
		ResultSet rs1=ps1.executeQuery();
		rs1.next();
		int no=rs1.getInt("no_of_likes");
		
		if(rs.next())
		{
			ps=con.prepareStatement("delete from likes where userid=? and videoid=?");
			ps.setString(1, userid);
			ps.setInt(2, videoid);
			ps.executeUpdate();
			
			ps1=con.prepareStatement("UPDATE video SET no_of_likes=? WHERE videoid=?");
			ps1.setInt(1, (no-1));
			ps1.setInt(2,getVideoid());
			ps1.executeUpdate();
			flag=false;
		}
		else
		{
			ps=con.prepareStatement("insert into likes(userid,videoid) values(?,?)");
			ps.setString(1, userid);
			ps.setInt(2, videoid);
			ps.execute();
			
			ps1=con.prepareStatement("UPDATE video SET no_of_likes=? WHERE videoid=?");
			ps1.setInt(1, (no+1));
			ps1.setInt(2,getVideoid());
			ps1.executeUpdate();
			flag=true;
		}
		
		
		
		ps1.close();
		ps.close();
		return flag;
	}

}
