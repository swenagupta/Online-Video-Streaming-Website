   <%@include file="includes/header.jsp" %>
    <%@include file="includes/nav.jsp" %>
    <div id="body">
		
		
		<%
		p1.SearchBean sb=new p1.SearchBean();
		sb.setSearchbar(request.getParameter("searchbar"));
		ResultSet rs=sb.searchVideo();
		%>
		<table border="0" cellspacing="20">
		<% 
		while(rs.next())
		{%>
		  <tr>
			<td>
				<a href="playvideo.jsp?path=videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>&title=<%=rs.getString("title") %>" name="selectvideo">
				<video width="320" height="240">
				  <source src="videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>" type="video/mp4" />
				</video>
				</a>
			</td>
			<td align="center" width="200">
				<p id="by"><%= rs.getString("title") %></p>
				<p><%= rs.getString("description") %></p>
			
			</td>
		  </tr>
	   <% }%>
		</table>
   </div>
    <div class="clr"></div>
   <%@include file="includes/footer.jsp" %>
</div>
</body>
</html>