<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
	p1.CommentBean cb=new p1.CommentBean();
	cb.setUserid((String)session.getAttribute("userid")); 
	cb.setVideoid((Integer)session.getAttribute("videoid")); 
	//out.println(request.getParameter("w"));
	cb.setDescription(request.getParameter("w"));
	cb.insertComment();%>
	<p id="by"><%=session.getAttribute("userid")%></p>
    <p><%=request.getParameter("w") %></p>
	
	
