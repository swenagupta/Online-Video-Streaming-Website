package p1;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

public class UploadBean {
	private HttpServletRequest request=null;
	private ServletContext context=null;
	
	static private String title;
	private String description;
	private String category;
	private String videourl;
	private String userid;
	File f;
	String video;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getVideourl() {
		return videourl;
	}
	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}

	public void formFieldParser() throws Exception{

		MultipartParser mp = new MultipartParser(request,40000*40000); // 10MB
	    Part part;
	    try{
			while((part = mp.readNextPart()) != null){
	        	if(part.isParam()){
		        	ParamPart paramPart = (ParamPart) part;
		          	String value = paramPart.getName();
		          	if(value.equals("title")){
		          		setTitle(paramPart.getStringValue());
		          	}
		          	if(value.equals("description")){
		          		setDescription(paramPart.getStringValue());
		          	}
		          	if(value.equals("category")){
		          		setCategory(paramPart.getStringValue());
		          	}
		        }
		       	else if(part.isFile()){
		       		FilePart filePart = (FilePart) part;
		          	video = filePart.getFileName();
		          	FileRenamePolicy policy=new NewFileRenamePolicy();
		          	filePart.setRenamePolicy(policy);
		          	
		          	if((video!=null)&&(!video.equals(""))){
		       
		          	String fileName = null;	
		          
		         fileName="C:\\Users\\Hp\\Desktop\\JAVA_EE\\yotube\\WebContent\\videos\\"+getUserid()+"\\";
		        
		         f = new File(fileName);
		         f.mkdir();
		         filePart.writeTo(f);
		         String fileExt = video.substring(video.indexOf("."));
		         setVideourl(title+fileExt);
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
		Connection con=null;
		PreparedStatement ps=null;
		try{
		
		con=p1.DbConnect.connect("yotube");
		ps=con.prepareStatement("insert into video(title,description,userid," +
				"duration,no_of_views,no_of_likes,category,no_of_comments," +
				"comment_status,videourl) values(?,?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1,title);
		ps.setString(2,description);
		ps.setString(3,userid);
		ps.setString(4, "00");
		ps.setInt(5,0);
		ps.setInt(6,0);
		ps.setString(7,category);
		ps.setInt(8,0);
		ps.setInt(9, 0);
		ps.setString(10,videourl);
	
		ps.executeUpdate();
		ps=con.prepareStatement("select no_of_uploads from user where userid=?");
		ps.setString(1, getUserid());
		ResultSet rs=ps.executeQuery();
		rs.next();
		int no=rs.getInt("no_of_uploads");
		
		ps=con.prepareStatement("UPDATE user SET no_of_uploads=? WHERE userid=?");
		ps.setInt(1, (no+1));
		ps.setString(2,getUserid());
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
class NewFileRenamePolicy implements FileRenamePolicy {
    
    //implement the rename(File f) method to satisfy the 
    // FileRenamePolicy interface contract
    public File rename(File f){

        String parentDir = f.getParent( );
        String fname = f.getName( );
        String fileExt = "";
        int i = -1;
        if(( i = fname.indexOf(".")) != -1){
            fileExt = fname.substring(i);
        }
        UploadBean rb=new UploadBean();
      
        fname = parentDir + System.getProperty(
            "file.separator") + rb.getTitle() + fileExt;
      
        File temp = new File(fname);
 
        return temp;
    }
}
