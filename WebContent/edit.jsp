 
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
		<form action="update.jsp" method="post" enctype="multipart/form-data" name="regform" id="regform" >
		<table border="1" width="80%" align="center" cellpadding="1">
		<tr>
			<td width="300" align="center" id="recent1">Profile Picture</td>
			<td width="50%" align="center"><input type="file" name="image" /></td>
		</tr>
		<tr>
			<td height="45" align="center" id="recent1">Email id</td>
			<td  align="center"><input type="email" name="userid" value="<%= rs.getString("userid")%>" ></td>
		</tr>
		<tr>
			<td height="38" align="center" id="recent1">Subsciption ID</td>
			<td  align="center"><input type="text" name="subsid" value="<%= rs.getString("subsid")%>" ></td>
		</tr>
	
		<tr>
			<td height="37" align="center" id="recent1">User Type</td>
			<td id="by" align="center"><%= rs.getString("usertype")%> </td>
		</tr>
		<tr>
			<td height="44" align="center" id="recent1">Birthday</td>
		<td  align="center"><input type="date" name="birthday" value="<%= rs.getString("birthday")%>" ></td>
		</tr>
		<tr>
			<td height="45" align="center" id="recent1">Gender</td>
			<%String gen=rs.getString("gender"); %>
			<td  align="center"><input type="radio" name="gender" value="m" <%if(gen.equals("m")){%>checked="checked"<%} %> />Male
						<input type="radio" name="gender" value="f" <%if(gen.equals("f")){%>checked="checked"<%} %>>Female</td>
		</tr>
		<tr>
			<td height="52" align="center" id="recent1">Location</td>
			<%String loc=rs.getString("location"); %>
			<td  align="center"><select name="location">
		                    <option value="dubai" <%if(loc.equals("dubai")){%>selected="selected"<%} %>>Dubai</option>
		                    <option value="india" <%if(loc.equals("india")){%>selected="selected"<%} %>>India</option>
		                    <option value="other" <%if(loc.equals("other")){%>selected="selected"<%} %>>Other</option>
		                </select>
		    </td>
		</tr>
		<tr>
			<td height="43" align="center" id="recent1">Nationality</td>
			<%String nat=rs.getString("nationality"); %>
			<td  align="center"><select name="nationality">
		                    <option value="american" <%if(nat.equals("american")){%>selected="selected"<%} %>>American</option>
		                    <option value="indian" <%if(nat.equals("indian")){%>selected="selected"<%} %>>Indian</option>
		                    <option value="other" <%if(nat.equals("other")){%>selected="selected"<%} %>>Other</option>
		                </select>
		    </td>
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
	    	<td align="center" height="50"><input type="submit" value="Save"></td>
	    	<td align="center" height="50"><a href="welcome.jsp"><input type="button" value="Cancel"></a></td>
	    </tr>
		</table>
		</form>
		<%} %>
	</div>
	<div class="clr"></div>
	  <%@include file="includes/footer.jsp" %>   
 </div>
</body>
</html>