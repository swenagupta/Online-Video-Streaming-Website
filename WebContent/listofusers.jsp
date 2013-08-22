 
 <%@include file="includes/header.jsp" %>
 <%@include file="includes/nav.jsp" %>
  
 <div id="body">
		<%
		p1.UserBean rb=new p1.UserBean();
		java.sql.ResultSet rs=rb.displayRecord();
		if(session.getAttribute("userid")!=null)
		{
		%>
		<table border="1" width="100%" align="center" cellpadding="1">
		<tr>
			<th>User_id</th>
			<th>Subs_id</th>
			<th>User_type</th>
			<th>Password(encrypted)</th>
			<th>Birthday</th>
			<th>Gender</th>
			<th>Location</th>
			<th>Nationality</th>
			<th>No_of_subs</th>
			<th>No_of_uploads</th>
			<th>Image_path</th>
			<th>Action</th>
		</tr>
		<%
		while(rs.next())
		{
			if(rs.getString("userid").equals((String)session.getAttribute("userid"))){continue;} 
		%>
		<tr>
			<td>
			<%
			out.print(rs.getString(1));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(2));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(3));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(4));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(5));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(6));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(7));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(8));
			%>
			</td>
			<td>
			<%
			out.print(rs.getInt(9));
			%>
			</td>
			<td>
			<%
			out.print(rs.getInt(10));
			%>
			</td>
			<td>
			<%
			out.print(rs.getString(11));
			%>
			</td>
			<td><a href="View.jsp?userid=<%=rs.getString("userid")%>">View</a> <a href="edit.jsp?userid=<%=rs.getString("userid")%>">Edit</a> <a href="delete.jsp?userid=<%=rs.getString("userid")%>">Delete</a></td>
		</tr>
		
		<%
		}%>
		</table>
		<% }
		else
		{
			response.sendRedirect("login.jsp");
		}
		%>
	</div>
	<div class="clr"></div>
	<%@include file="includes/footer.jsp" %>   
 </div>
</body>
</html>



