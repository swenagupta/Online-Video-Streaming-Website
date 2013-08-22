package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentBean {
	private String description;
	private String userid;
	private int videoid;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
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
	
	public boolean insertComment()
	{
		Connection con=null;
		PreparedStatement ps=null;
		try{
		
		con=p1.DbConnect.connect("yotube");
		ps=con.prepareStatement("insert into comments(userid,videoid,description) values(?,?,?)");
		System.out.println(userid+videoid+description);
		ps.setString(1,userid);
		ps.setInt(2,videoid);
		ps.setString(3,description);
		//System.out.println("not exe");
		ps.executeUpdate();
		//System.out.println("executed");
		
		ps=con.prepareStatement("select no_of_comments from video where videoid=?");
		ps.setInt(1, getVideoid());
		ResultSet rs=ps.executeQuery();
		rs.next();
		int no=rs.getInt("no_of_comments");
		
		ps=con.prepareStatement("UPDATE video SET no_of_comments=? WHERE videoid=?");
		ps.setInt(1, (no+1));
		ps.setInt(2,getVideoid());
		ps.executeUpdate();
		ps.close();
		return true;
		}
		catch(Exception e){
		}
		return false;
	
	}
	
	
	
}
