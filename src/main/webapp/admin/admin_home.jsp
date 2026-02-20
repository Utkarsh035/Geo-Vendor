<%@page import="gv.utilities.CustomMessages"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin home</title>
<%@include file="/common_html/all_css.html"%>
<style>
.img-contanier {
position:relative;
	background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1)),
		url("/GeoVendor/images/bg_map.png");
	background-repeat: no-repeat;
	background-size: cover;
	 height: 90vh; 
    display: flex;
    flex-direction: column;
    justify-content: center; 
    align-items: center; 
    text-align: center;
}
.pin-img{
 position: absolute;
    bottom: 10px; 
    right: 10px; 
   
}
.txt{

color: whitesmoke; 
text-shadow: 14px 14px 3px #56595e;
font-size: 3vw;
}</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
<% 
String email=(String)session.getAttribute("sessionEmail");
if(email==null||session.isNew()){
	request.setAttribute("message",CustomMessages.AUTHORISE_ERROR);
	RequestDispatcher rd=request.getRequestDispatcher("/admin/admin_login.jsp");
	rd.forward(request, response);
}
else{
	%>



<%@include file="/admin/admin_header.html" %>
<div class="main-body">
<div class="container-fluid  img-contanier ">
<h1 class="txt">GEO VENDOR WELCOME'S YOU!</h1>
			<h1 class= "txt" >Admin Portal</h1>
				
	 <img alt="pin-img" src="/GeoVendor/images/pin.gif" height="40" width="50" class="pin-img">
				
		</div>
		<%@include file="/admin/contact_count.jsp" %>
		<%@include file="/admin/piechart.jsp" %>
</div>
<%@ include file="/WEB-INF/common/footer.html"%>
<%} %>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>