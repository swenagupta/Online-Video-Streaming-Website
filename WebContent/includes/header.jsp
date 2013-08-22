<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyTube | Home</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />

   <script>
    	function validate(){
    	if(document.form.searchbar.value=="")
    	{
    	    return false;
    	 }
    	return true;
    	}
    </script>
    


</head>

<body>
<%@ page import="java.sql.*;" %> 

<div id="container">
	<div id="header">
    	<div id="logo">
    	 <%if((session.getAttribute("userid")!=null)){%>
    		 <a href="welcome.jsp"><img src="images/logo.png" alt="logo"/></a><%}else{ %>
        	<a href="index.jsp"><img src="images/logo.png" alt="logo"/></a><%} %>
        </div>
        <div id="search">
        	<form name="form" action="searchHandler.jsp" method="post" onSubmit="return validate()">
        		<input type="text" placeholder="Whats on your mind??"  name="searchbar" class="big_text" />
        		<input type="submit" value="Search" class="big_button" />
            </form>
        </div>
        <%if((session.getAttribute("userid")!=null))
		{
        p1.LoginUserBean lb=new p1.LoginUserBean(); %>
       <div id="pho"> <p id="by"><%=lb.getSubsid() %><p>
        <img src="photos/<%=lb.getImage() %>" width="60" height="60" alt="photo" /></div><%} %>
        <div id="log">
        	<% 
				if((session.getAttribute("userid")!=null))// && session.getAttribute("password")!=null) || session.getAttribute("userid1")!=null && session.getAttribute("password1")!=null)
				{
					 p1.LoginUserBean lb=new p1.LoginUserBean();
			%>
			
			    
            	<a href="logout.jsp" class="logout">Logout</a>
            	<a href="upload.jsp">Upload</a>
             <% } 
			 else{
				 %>
                  
                  <a href="login.jsp" class="logout">Login</a>
             <% } %> 
        </div>
        <div id="clr"></div>
    </div>
   
 