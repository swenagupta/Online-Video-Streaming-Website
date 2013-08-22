package p1;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginUserBean {
static private String userid;
static private String password;
private String usertype;
static private String subsid;
static Connection con=null;
PreparedStatement ps=null;


	public String getSubsid() {
	return subsid;
}

public void setSubsid(String subsid) {
	this.subsid = subsid;
}

	public String getUsertype() {
	return usertype;
}

public void setUsertype(String usertype) {
	this.usertype = usertype;
}

	public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

	public boolean checkUser()
	{
		if(userid == null && password == null)
		{
			return false;
		}
		
		try{
		
		con=p1.DbConnect.connect("yotube");
		ps=con.prepareStatement("select userid,usertype,subsid from user where userid=? and password=?");

		MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
	    mdEnc.update(password.getBytes(), 0, password.length());
	    String md5 = new BigInteger(1, mdEnc.digest()).toString(16);
		System.out.print(userid);
		ps.setString(1,userid);
		ps.setString(2,md5);
		ResultSet rs=ps.executeQuery();
		rs.next();
		if((userid=rs.getString("userid"))!=null)
		{
			setUsertype(rs.getString("usertype"));
			setSubsid(rs.getString("subsid"));
			return true;
		}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public String getImage()
	{
		System.out.print(userid);
		try
		{
		ps=con.prepareStatement("select image from user where userid=?");
		ps.setString(1, userid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		String str=rs.getString("image");
		System.out.print(str);
		return str;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
