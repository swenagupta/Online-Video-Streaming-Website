package p1;

import javax.servlet.*;
import javax.servlet.http.*;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.oreilly.servlet.multipart.*;
import com.oreilly.servlet.multipart.Part;
import com.oreilly.servlet.*;
import java.io.*;
import java.math.BigInteger;

public class RegisterBean {
	private HttpServletRequest request=null;
	private ServletContext context=null;
	
	private String userid;
	static private String subsid;
	private String usertype;
	private String password;
    private String confirm;
	private String birthday;
	private String gender;
	private String location;
	private String nationality;
	private String image;
	File f;
	String img;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public ServletContext getContext() {
		return context;
	}
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	public void formFieldParser() throws Exception{

		MultipartParser mp = new MultipartParser(request,5000*1024); // 2MB
	    Part part;
	    try{
			while((part = mp.readNextPart()) != null){
	        	if(part.isParam()){
		        	ParamPart paramPart = (ParamPart) part;
		          	String value = paramPart.getName();
		          	if(value.equals("userid")){
		          		setUserid(paramPart.getStringValue());
		          	}
		          	if(value.equals("subsid")){
		          		setSubsid(paramPart.getStringValue());
		          	}
		          	if(value.equals("password")){
		          		setPassword(paramPart.getStringValue());
		          	}
		          	if(value.equals("birthday")){
		          		setBirthday(paramPart.getStringValue());
		          	}
		          	if(value.equals("gender")){
		          		setGender(paramPart.getStringValue());
		          	}
		          	if(value.equals("location")){
		          		setLocation(paramPart.getStringValue());
		          	}
		          	if(value.equals("nationality")){
		          		setNationality(paramPart.getStringValue());
		          	}
		        }
		       	else if(part.isFile()){
		       		FilePart filePart = (FilePart) part;
		          	img = filePart.getFileName();
		          	FileRenamePolicy policy=new MyFileRenamePolicy();
		          	filePart.setRenamePolicy(policy);
		          	
		          	if((img!=null)&&(!img.equals(""))){
		          		System.out.print("hellooo");
		          		//String fileExt=image.substring(image.lastIndexOf("."),image.length());
		          	String fileName = null;	
		          
		         fileName="C:\\Users\\Hp\\Desktop\\JAVA_EE\\yotube\\WebContent\\photos\\";
		         f = new File(fileName);
		         filePart.writeTo(f);
		         String fileExt = img.substring(img.indexOf("."));
		         setImage(subsid+fileExt);
		          	}  // inner if
		        } // else if 
			} // while loop
		}
		catch(Exception e){
			//context.log("shfc",e);
			e.printStackTrace();
       //throw e;
		}
	}
	
	public boolean insertRecord() 
	{
		//System.out.print("record inserted....");
		//return true;
		Connection con=null;
		PreparedStatement ps=null;
		try{
		
		con=p1.DbConnect.connect("yotube");
		//String bday = birthday.getText();
		
		ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?)");
		

		MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
	    mdEnc.update(password.getBytes(), 0, password.length());
	    String md5 = new BigInteger(1, mdEnc.digest()).toString(16);
	    
		ps.setString(1,userid);
		ps.setString(2,subsid);
		ps.setString(3,usertype);
		ps.setString(4,md5);
		ps.setString(5,birthday);
		ps.setString(6,gender);
		ps.setString(7,location);
		ps.setString(8,nationality);
		ps.setInt(9,0);
		ps.setInt(10,0);
	//	FileInputStream fis=new FileInputStream(image);
	//	ps.setBinaryStream(10,fis,fis.available());
		ps.setString(11,image);
		ps.executeUpdate();
		ps.close();
		
		return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean updateRecord() 
	{
		//System.out.print("record inserted....");
		//return true;
		Connection con=null;
		PreparedStatement ps=null;
		try{
		
		con=p1.DbConnect.connect("yotube");
		//String bday = birthday.getText();
		
		ps=con.prepareStatement("update user set userid=?,subsid=?,birthday=?,gender=?,location=?,nationality=?,image=?");
		

		MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
	    mdEnc.update(password.getBytes(), 0, password.length());
	    String md5 = new BigInteger(1, mdEnc.digest()).toString(16);
	    
		ps.setString(1,userid);
		ps.setString(2,subsid);
	
		ps.setString(3,birthday);
		ps.setString(4,gender);
		ps.setString(5,location);
		ps.setString(6,nationality);
		
		ps.setString(7,image);
		ps.executeUpdate();
		ps.close();
		
		return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}

}
class MyFileRenamePolicy implements FileRenamePolicy {
    
    //implement the rename(File f) method to satisfy the 
    // FileRenamePolicy interface contract
    public File rename(File f){
    
        //Get the parent directory path as in h:/home/user or /home/user
        String parentDir = f.getParent( );
      
        //Get filename without its path location, such as 'index.txt'
        String fname = f.getName( );
      
        //Get the extension if the file has one
        String fileExt = "";
        int i = -1;
        if(( i = fname.indexOf(".")) != -1){
      
            fileExt = fname.substring(i);
            //fname = fname.substring(0,i);
        }
        RegisterBean rb=new RegisterBean();
        //piece together the filename
        fname = parentDir + System.getProperty(
            "file.separator") + rb.getSubsid() + fileExt;
      
        File temp = new File(fname);
 
        return temp;
    }
}

