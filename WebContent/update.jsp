<jsp:useBean id="rb" class="p1.RegisterBean">
<jsp:setProperty name="rb" property="*" />
</jsp:useBean>
<%
	rb.setContext(application);
	rb.setRequest(request);
	rb.formFieldParser();
//  String uname=(String)session.getAttribute("user_id");
//	add.setUploaded_by(uname);

	rb.updateRecord();
	response.sendRedirect("welcome.jsp");
	
%>