<div>

<%@ page import="java.sql.*;" %> 
	<%
          System.out.println("in jsp");
		   	if(session.getAttribute("userid")!=null)
		   	{
		   		p1.SearchBean vb1=new p1.SearchBean();
		 	    ResultSet rs1=vb1.searchDetails(request.getParameter("title"));
		 	    rs1.next();
		 	    p1.LikeBean lb=new p1.LikeBean();
		   		lb.setUserid((String)session.getAttribute("userid"));
		   		lb.setVideoid(rs1.getInt("videoid"));
		   		boolean b=lb.like();
		   		if(b){%> <p id="by">Liked :)</p>
		   		<%}else{%> <p id="by">Unliked :(</p><%}	
		   	}  
		   	else
		   	{
   %>
   <p id="by">Login Required!!!!</p>
   <%}%>
</div>

