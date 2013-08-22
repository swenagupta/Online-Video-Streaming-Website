 <%@include file="includes/header.jsp" %>
    <%@include file="includes/nav.jsp" %>
  
   <div id="body">
<%
p1.UserBean rb=new p1.UserBean();
boolean b=rb.deleteRecord(request.getParameter("userid"));
if(b==true)	
%>
<p id="by">You have successfully deleted the entry!!!!</p>

</div>
	<div class="clr"></div>
	  <%@include file="includes/footer.jsp" %>   
 </div>	

</body>
</html>