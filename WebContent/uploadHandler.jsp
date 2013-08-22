<jsp:useBean id="ub" class="p1.UploadBean" scope="session">
<jsp:setProperty name="ub" property="*" />
</jsp:useBean>
<%
String user=(String)session.getAttribute("userid");
ub.setUserid(user);
	ub.setContext(application);
	ub.setRequest(request);
	ub.formFieldParser();
  
	ub.insertRecord();
	response.sendRedirect("welcome.jsp");
%>