
<html>
<head>

<title>Upload Video</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body>
<%String user=(String)session.getAttribute("userid");
  if(user==null)
	  response.sendRedirect("login.jsp");
%>
<div id="container">
	<div id="header">
    	<div id="logo">
    	
        	<img src="images/logo.png" alt="logo"/>
        </div>
    </div>
    <div id="logbody">
		<form action="uploadHandler.jsp" method="post" enctype="multipart/form-data">
		<table width="611" height="510" border="1" align="center">
			  <tr>
			    <td height="43" align="center">Upload Video</td>
		  </tr>
			  <tr>
			    <td width="215" height="46" align="left"> Title</td>
		  </tr>
			  <tr>
			    <td width="216" height="45">
			      <input name="title" type="text" id="title2" size="80" /></td>
		  </tr>
			  <tr>
			    <td height="45" align="left">Description</td>
		  </tr>
			  <tr>
			    <td align="left">
			      <textarea name="description" id="description" cols="80" rows="5"></textarea></td>
		  </tr>
			  <tr>
			    <td height="43" align="left">Category</td>
		  </tr>
			  <tr>
			    <td height="44">
			      <select name="category" id="category">
			        <option>Autos &amp; Vehicles</option>
			        <option>Comedy</option>
			        <option>Education</option>
			        <option>Entertainment</option>
			        <option>Film &amp; Animation</option>
			        <option>Gaming</option>
			        <option>Howto &amp; Style</option>
			        <option>Music</option>
			        <option>News &amp; Politics</option>
			        <option>Nonprofits &amp; Activism</option>
			        <option selected="selected">People &amp; Blogs</option>
			        <option>Pets &amp; Animals</option>
			        <option>Science &amp; Technology</option>
			        <option>Sports</option>
			        <option>Travel &amp; Events</option>
		          </select></td>
		  </tr>
			  <tr>
			    <td height="51">Video
			      <label for="video"></label>
			      <input type="file" name="video" id="video" /></td>
		  </tr>
			  <tr>
			    <td height="56" align="center"><input type="submit" name="done" id="done" value="Submit" /></td>
		  </tr>
		</table>
		</form>
	</div>
	 <%@include file="includes/footer.jsp" %>
	</div>
</body>
</html>