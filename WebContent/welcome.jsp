<%String user=(String)session.getAttribute("userid");
  if(user==null)
	  response.sendRedirect("login.jsp");
%>
<%@include file="includes/header.jsp" %>
<%@include file="includes/nav.jsp" %>

<div id="body">
    		<%
    		p1.RecentBean rb=new p1.RecentBean();
    		ResultSet rs=rb.searchRecent();
    	%>
		<table border="0" cellspacing="10">
		<tr><td colspan="3" id="recent">Recent Videos </td></tr>
		<% int i=0;
		   while(i<4){%>
		  <tr>
		  	<% int j=0;
		  	while(j<3 && rs.next()){%>
		    <td id="vid" bgcolor="#000000">
		     <p id="by" align="center"><%=rs.getString("title") %></p>
		    <a href="playvideo.jsp?path=videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>&title=<%=rs.getString("title")%>" name="selectvideo">	
		    	<video width="250" height="250" align="center">
				  <source src="videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>" type="video/mp4" />
				</video></a>
		    </td>
		    <%j++;}
		    %>
		  </tr>
		  <%i++;}
		    %>
		</table>    	
    </div>

<div class="clr"></div>
<%@include file="includes/footer.jsp" %>
</div>

</body>
</html>