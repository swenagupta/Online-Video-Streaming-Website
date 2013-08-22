
<jsp:useBean id="log" class="p1.LoginUserBean">
<jsp:setProperty name="log" property="*" />
</jsp:useBean>
<%
boolean match=log.checkUser();
if(match)
{
	String user = request.getParameter( "userid" );
	session.setAttribute( "userid", user );
	if(log.getUsertype().equals("admin"))
		session.setAttribute("usertype","admin");
	else
		session.setAttribute("usertype","user");
	response.sendRedirect("welcome.jsp");
}
	
else
{
	response.sendRedirect("login.jsp?msg=fail");
}	
%>
