<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Register</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script>
	function validateForm()
	{
		if(document.regform.userid.value == "" || document.regform.subsid.value=="" || 
				document.regform.password.value=="" || document.regform.confirm.value=="" ||
				document.regform.birthday.value=="" || document.regform.gender.value=="" ||
				document.regform.location.value=="" || document.regform.nationality.value=="" ||
				document.regform.image.value=="")
    	{
	    	alert("All the fields are compulsory!!!");
    	    return false;
    	 }
   	    if(	document.regform.password.value!=document.regform.confirm.value)
   	   	    {
   	   	    	alert("Password does not match");
   	   	    	return false;
   	   	    }
    	return true;
    	}
	
</script>
</head>

<body>
<div id="container">
	<div id="header">
    	<div id="logo">
    	
        <%if((session.getAttribute("userid")!=null)){%>
    		 <a href="welcome.jsp"><img src="images/logo.png" alt="logo"/></a><%}else{ %>
        	<a href="index.jsp"><img src="images/logo.png" alt="logo"/></a><%} %>
        </div>
    </div>
    <div id="logbody">
		<form action="registerHandler.jsp" method="post" enctype="multipart/form-data" name="regform" id="regform" onSubmit="return validateForm()">
  <table width="600px" border="1" bgcolor="#FFFFFF" align="center">
		    	<tr>
		        	<td height="50" colspan="2" align="center"><h1>Registration form</h1></td>
    </tr>
		        <tr>
		            <td valign="middle" height="40"><h3>Email Id</h3></td>
		            <td align="center"><input type="email" name="userid" size="35"></td>
		        </tr>
		        <tr>
		            <td height="40" valign="middle"><h3>NickName</h3></td>
		            <td align="center"><input type="text" name="subsid" size="35"></td>
		        </tr>
		        <tr>
		        	<td height="40" valign="middle"><h3>Password</h3></td>
		            <td align="center"><input type="password" name="password" size="35"/></td>
		        </tr>
		        <tr>
		        	<td height="40" valign="middle"><h3>Confirm Password</h3></td>
		            <td align="center"><input type="password" name="confirm" size="35"/></td>
		        </tr>
		        <tr>
		        	<td height="40" valign="middle"><h3>Date of Birth</h3></td>
		            <td align="center"><input type="date" name="birthday" size="35"/></td>
		        </tr>
		        <tr>
		            <td height="40" valign="middle"><h3>Gender</h3></td>
		            <td align="center"><input type="radio" name="gender" value="m" checked="checked" />Male
						<input type="radio" name="gender" value="f">Female</td>
		        </tr>
		        <tr>
		       		<td height="40" valign="middle"><h3>Country</h3></td>
		            <td align="center"><select name="location">
		                    <option value="dubai">Dubai</option>
		                    <option value="india">India</option>
		                    <option value="other">Other</option>
		                </select>
		            </td>
		        </tr>
		          <tr>
		       		<td height="40" valign="middle"><h3>Nationality</h3></td>
		            <td align="center"><select name="nationality">
		                    <option value="american">American</option>
		                    <option value="indian">Indian</option>
		                    <option value="other">Other</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		        	<td height="40" valign="middle"><h3>Image</h3></td>
		            <td align="center"><input type="file" name="image" /></td>
		          
		        </tr>
		        
		        <tr>                          
		            <td height="72" colspan="2" align="center"><input type="submit" value="login"></td>
		        </tr>              
  			</table>
		  </form>
	</div>
	 <%@include file="includes/footer.jsp" %>
</body>
</html>
