 
  <%@include file="includes/header.jsp" %>
    <%@include file="includes/nav.jsp" %>
  
   <div id="body">
		
		<%
		String userid=request.getParameter("userid");
		System.out.print(userid);
		 p1.UserBean ub=new p1.UserBean();
		ResultSet rs=ub.viewRecord(userid);
		if(rs.next())
		{
		%>
		<table border="1" width="80%" align="center" cellpadding="1">
		<tr>
			<td width="300" align="center" id="recent1">Profile Picture</td>
			<td width="50%" align="center"><img src='photos/<%= rs.getString("image")%>' alt='swena' width="100px" height="100px"/></td>
		</tr>
		<tr>
			<td height="45" align="center" id="recent1">Email id</td>
			<td id="by" align="center"><%= rs.getString("userid")%></td>
		</tr>
		<tr>
			<td height="38" align="center" id="recent1">Subsciption ID</td>
			<td id="by" align="center"><%= rs.getString("subsid")	%></td>
		</tr>
		<tr>
			<td height="37" align="center" id="recent1">User Type</td>
			<td id="by" align="center"><%= rs.getString("usertype")%> </td>
		</tr>
		<tr>
			<td height="44" align="center" id="recent1">Birthday</td>
			<td id="by" align="center"><%= rs.getString("birthday")%></td>
		</tr>
		<tr>
			<td height="45" align="center" id="recent1">Gender</td>
			<td id="by" align="center"> <%= rs.getString("gender")%>    </td>
		</tr>
		<tr>
			<td height="52" align="center" id="recent1">Location</td>
			<td id="by" align="center"> 	  <%= rs.getString("location")%>    </td>
		</tr>
		<tr>
			<td height="43" align="center" id="recent1">Nationality</td>
			<td id="by" align="center"> <%= rs.getString("nationality")%>  </td>
		</tr>
		<tr>
			<td height="52" align="center" id="recent1">Number of Subscription</td>
			<td id="by" align="center"> <%= rs.getInt("no_of_subs")%>   </td>
		</tr>
		<tr>
			<td height="41" align="center" id="recent1">Number of Uploads</td>
			<td id="by" align="center"> <%= rs.getInt("no_of_uploads")%>  </td>
		</tr>
	    <tr>
	    	<td colspan="2" align="center" height="50"><a href="edit.jsp?userid=<%=userid%>"><p id="by">Edit</p></a></td>
	    </tr>
		</table>
		<%} %>
	</div>
	<div class="clr"></div>
	  <%@include file="includes/footer.jsp" %>   
 </div>
</body>
</html>