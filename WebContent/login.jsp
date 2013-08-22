<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="container">
	<div id="header">
    	<div id="logo">
    	
        	<img src="images/logo.png" alt="logo"/>
        </div>
    </div>
    <div id="logbody">
		<form action="loginHandler.jsp" id="logform">
		
  				<table width="380" height="275" border="1" align="center">
				<tr>
				  <td colspan="2" align="center"><h1><strong>Login</strong></h1>				  
				  		<%String str=request.getParameter("msg");
							if(str!=null && str.equals("fail"))
							{
							%>
							<p id="by">Username or password incorrect...</p>
							<%}%>
				  </td>
				  
				</tr>
				<tr>
				  <td height="10" colspan="2" align="right"><a href="register.jsp"> SignUp</a></td>
				</tr>
				<tr>
				  <td width="182" align="center"><h3><strong>UserId</strong></h3></td>
				  <td width="182"><input type="text" name="userid" id="userid" /></td>
				</tr>
				<tr>
				  <td align="center"><h3><strong>Password</strong></h3></td>
				  <td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
				  <td height="85" colspan="2" align="center"><input type="submit" name="login" id="login" value="Submit" /></td>
    			</tr>
 		 </table>
		</form>
	</div>
	 <%@include file="includes/footer.jsp" %>
</body>
</html>