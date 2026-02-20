<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="gv.dao.*,gv.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedbacks List(user)</title>
<%@include file="/common_html/all_css.html"%>
<style>
.flex-container{
display: flex;
flex-wrap: wrap;
width: 80%;
margin-left:10%;
justify-content:space-around;
gap:10px
}
.box {
    background-color: white;
    border: 1px solid #83afd4;
    box-shadow: 0 4px 15px rgba(131, 175, 212, 0.3);
    border-radius: 12px;
    padding: 20px;
    width: 350px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.box:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 20px rgba(131, 175, 212, 0.4);
}
.box h5 {
    font-size: 15px;
    margin-bottom: 10px;
    color: #555;
}

.box h4 {
    font-size: 16px;
    margin-top: 15px;
    color: #222;
}

.fa-star {
    color: #83afd4;
    margin: 0 2px;
}
.img-contanier {
position:relative;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.2)),
		url("/GeoVendor/images/bg_map.png");
	background-repeat: no-repeat;
	background-size: cover;
	 height: 100vh;  
	   overflow-y: auto; 
}
.main-body, .container-fluid {
    margin: 0;
    padding: 0;
}
.img-contanier h2 {
    margin-top: 0;
}
.pin-img {
	position: absolute;
	bottom: 10px;
	right: 10px;
}

</style>
</head>
<body>
<%@include file="/admin/admin_header.html" %>
<div class="main-body">
<div class="container-fluid  img-contanier ">
<div class="container mt-3 text-center">
<h2 style="margin-top: 65px"> User's Feedback List</h2>
<img alt="pin-img" src="/GeoVendor/images/pin.gif" height="40"
				width="50" class="pin-img">
</div>

<%
AdminDao dao=new AdminDao();
ArrayList<Feedback>feedbacklist=dao.viewAllFeedback();
if(feedbacklist.size()>0){
%>
<div class="flex-container">
<%for(Feedback fb:feedbacklist) {

String rt=fb.getRating();
String[]rate=rt.split(",");

%>


<div class="box">
<h5>Remarks:<%=fb.getRemark() %></h5>
<h5>Rating:
<%for( String  r :rate)
{
%>
<i class="fas fa-star"></i>

<%} %>
</h5>
<h4>Given By :<%=fb.getName() %></h4>
</div>
<%} %>
</div>
<%} 
else{
%>

<h2>No Feedback</h2>
 <%} %>
 <img alt="pin-img" src="/GeoVendor/images/pin.gif" height="40"
				width="50" class="pin-img">
 </div>
</div>



<%@ include file="/WEB-INF/common/footer.html"%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>