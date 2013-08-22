
    <div id="nav">
    	<ul id="menu">
    		 <%String user1=(String)session.getAttribute("userid");
  				if(user1!=null){%>
    		<li><a href="welcome.jsp">Home</a></li>
            <li><a href="View.jsp?userid=<%=(String)session.getAttribute("userid")%>">View Profile</a></li>
            <li><a href="uploaded.jsp">View Uploads</a></li>
            <%String utype=(String)session.getAttribute("usertype");
  				if(utype!=null && utype.equals("admin")){%>
	  	    <li><a href="listofusers.jsp">List Of Users</a></li>
	  	    <li><a href="register.jsp">Add New Admin</a></li>
			<%} }%>
        	<li><a href="category.jsp?category=Music">Music</a></li>
            <li><a href="category.jsp?category=Sports">Sports</a></li>
            <li><a href="category.jsp?category=Education">Education</a></li>
            <li><a href="category.jsp?category=Gaming">Gaming</a></li>
            <li><a href="category.jsp?category=Entertainment">Entertainment</a></li>
            <li><a href="category.jsp?category=Autos %26 Vehicls">Autos & Vehicles</a></li>
            <li><a href="category.jsp?category=Howto %26 Style">Howto & Style</a></li>
            <li><a href="category.jsp?category=News %26 Politics">News & Politics</a></li>
            <li><a href="category.jsp?category=Nonprofits %26 Activism">Nonprofits & Activism</a></li>
            <li><a href="category.jsp?category=People %26 Blogs">People & Blogs</a></li>
            <li><a href="category.jsp?category=Pets %26 Animals">Pets & Animals</a></li>
            <li><a href="category.jsp?category=Science %26 Technology">Science & Technology</a></li>
            <li><a href="category.jsp?category=Travel %26 Events">Travel & Events</a></li>
            <li><a href="category.jsp?category=Comedy">Comedy</a></li>
            <li><a href="category.jsp?category=Film %26 Animation">Film & Animation</a></li>
        </ul>
    </div>