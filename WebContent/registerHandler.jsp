<jsp:useBean id="rb" class="p1.RegisterBean">
<jsp:setProperty name="rb" property="*" />
</jsp:useBean>
<%
	rb.setContext(application);
	rb.setRequest(request);
	rb.formFieldParser();
//    String uname=(String)session.getAttribute("user_id");
//	add.setUploaded_by(uname);
    String utype=(String)session.getAttribute("usertype");
    if(utype.equals("admin"))
    	rb.setUsertype("admin");
    else
    	rb.setUsertype("user");
	rb.insertRecord();
	response.sendRedirect("welcome.jsp");
	
%>