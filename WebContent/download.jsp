<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%  String s[] = request.getParameter("path").split("/");
	String filename=s[2];
	//System.out.println(s[0]+" "+s[1]+" "+s[2]);
  //String filename="video1.mp4";
  response.setContentType("APPLICATION/OCTET-STREAM"); 
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");  

  java.io.FileInputStream fileInputStream = new java.io.FileInputStream("C:/Users/MAHAVEER/Desktop/ayushi/mytube/WebContent/"+request.getParameter("path"));
		  
  int i; 
  
  while ((i=fileInputStream.read())!=-1) 
  {
    out.write(i); 
  } 
  fileInputStream.close(); 
%>
</body>
</html>