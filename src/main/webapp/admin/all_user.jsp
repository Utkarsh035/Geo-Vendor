<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="gv.dao.*,gv.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<%@include file="/common_html/all_css.html"%>
<style >
.t-row th{
background-color: #83afd4;
color: white;
}
.img-contanier {
position:relative;
	background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1)),
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

table{
box-shadow: 2px 2px 10px #8aaded;
}
</style>
</head>
<body>
<%@include file="/admin/admin_header.html" %>
<div class="main-body">
<div class="container-fluid  img-contanier ">
<div class="container mt-3 text-center">
<h2 style="margin-top: 65px">User List</h2>

<%


AdminDao dao=new AdminDao();
ArrayList<User>userList=dao.viewAllUser();
if(userList.size()>0){%>
	<table class="table table-bordered table-hover text-center border-dark">
	  <thead >
	    <tr class="t-row">
	      
	      <th scope="col">Name</th>
	      <th scope="col">Email</th>
	       <th scope="col">Phone</th>
	      <th scope="col">Address</th>
	      <th scope="col">Date</th>
	    </tr>
	  </thead>
	  <tbody>
	   <% for(User u:userList){
	   %>
	   <tr>
	 
	   <td><%=u.getName() %></td>
	   <td><%=u.getEmail() %></td>
	   <td><%=u.getPhone()%></td>
	    <td><%=u.getAddress()%></td>
	   
	   <td><%=u.getDate() %></td>
	   </tr>
	    <%} %>
   
  </tbody>
</table>

<%} 
else{%>

<h2>No Contact are Present</h2>
 <%} %>

</div>
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