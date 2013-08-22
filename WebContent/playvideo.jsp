
   <%@include file="includes/header.jsp" %>
    <%@include file="includes/nav.jsp" %>
   <div id="body1">
   <%p1.SearchBean vb1=new p1.SearchBean();
   ResultSet rs1=vb1.searchDetails(request.getParameter("title"));
   rs1.next();
   %>
    <script language="Javascript" src="js/commjs.js"></script>
    <script language="Javascript" src="js/likejs.js"></script>
    
	   <%if(request.getParameter("title").length()>15){ %>
	    				<p id="title_video"><%=request.getParameter("title").substring(0,15)+"..."%></p>
	    				<%}else{ %>
	    				<p id="title_video"><%=request.getParameter("title")%><%} %></p>
	   			
	   
	   
	   <video width="660" height="500" controls="controls">
	    	<source src="<%=request.getParameter("path") %>" />
	    </video><br/><br/>
	    
	    
	    <%vb1.view(request.getParameter("title")); %>
	    <div id="button_video_details"> 
	        <input type="button" onclick="subscribe();" value="SUBSCRIBE" class="big_button"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        
	        <a href="download.jsp?path=<%=request.getParameter("path")%>"><img width="40" height="30" src="images/download.png" alt="download"/></a>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     
	       		<input type="image" onclick="makerequest('likes.jsp?title=<%=request.getParameter("title") %>','like'); return false;" src="images/like.png" id="buttons" value="like"/>
	      
	        <!--   <a href="likes.jsp?title=<%=request.getParameter("title")%>"><img src="images/like.png" id="buttons" value="like" /></a>-->
	        
	        <%=rs1.getInt("no_of_likes") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <%=rs1.getInt("no_of_views") %>Views  
	        <div id="like"></div>
	    </div>
	    <div class="clr"></div>
	    <br/>
	  
	   <p id="desc"> <%=rs1.getString("description")%>&nbsp;&nbsp;Uploaded on:<%=rs1.getTimestamp("time_of_upload") %></p>
	   <p id="by">by <%=rs1.getString("subsid")%></p>
	   <div id="line"></div>
	   <p id="desc">Comments...(<%=rs1.getInt("no_of_comments") %>)</p>
        
        <%  ResultSet rs2=vb1.comments(rs1.getInt("videoid")); 
            int i=0;
            while(rs2.next())
            {
        %>
        <p id="by"><%=rs2.getString("subsid")%></p>
        <p><%=rs2.getString("description") %></p>
        <%} %>
        <%if(session.getAttribute("userid")!=null){ 
        	session.setAttribute("videoid",rs1.getInt("videoid"));
        %>
           <div id="result"></div>
        	<p id="by"><%=session.getAttribute("userid")%></p>
        	
        	<form name="form1" method="post">
        		<textarea name="description" id="description" cols="80" rows="5" placeholder="comment here...." ></textarea> 
        		<input type="button" value="Post" onclick='JavaScript:xmlhttpPost1("commentHandler.jsp")'/>
        		
            </form>
            
        <%} %>
   </div>
   
   
   <div id="recent_video">
   <%
    		p1.RecentBean rb=new p1.RecentBean();
    		ResultSet rs=rb.searchRecent();
    	%>
    	<table cellpadding="10px">
    		<tr><td colspan="3" id="recent1">Recent Videos</td></tr>
    		
    		<%
    			
    			while(rs.next())
    			{%><tr>
    				<td id="title">
    				<%=rs.getString("title")%><br/>
    				<a href="playvideo.jsp?path=videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>&title=<%=rs.getString("title")%>">
		    			<video width="150" height="100">
    					  <source src="videos/<%=rs.getString("userid")%>/<%=rs.getString("videourl")%>"/>
    					</video>
    					</a>
    				</td>   			
    			</tr>
    		<%
    		} %>
    		</table>
   </div>
   <div class="clr"></div>
    <%@include file="includes/footer.jsp" %>   
 </div>
	
 
</body>
</html>