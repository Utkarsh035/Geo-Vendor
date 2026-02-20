<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="gv.dao.*,gv.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact List</title>
<%@include file="/common_html/all_css.html"%>

<style >
.t-row th{
background-color: #83afd4;
color: white;
}
table{
box-shadow: 2px 2px 10px #8aaded;
}
.pin-img {
	position: absolute;
	bottom: 10px;
	right: 10px;
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
</style>
</head>
<body>
<%@include file="/admin/admin_header.html" %>
<div class="main-body">
<div class="container-fluid  img-contanier ">
<div class="container mt-3 text-center">
<h3 style="margin-top: 65px">Contact Details Are as follows</h3>
</div>

<%
AdminDao dao=new AdminDao();
ArrayList<Contact>contactList=dao.viewAllContacts();
if(contactList.size()>0){
%>
<form method="post" action="/GeoVendor/DeleteContact">
<table class="table table-bordered table-hover text-center border-dark">
  <thead >
    <tr class="t-row">
    <th scope="col">Select</th>
      <th scope="col">SR No</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
       <th scope="col">Phone</th>
      <th scope="col">Question</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
   <% for(Contact c:contactList){
   %>
   <tr>
   <th><input type="checkbox" name="chk" class="form-check-input" value="<%=c.getId()%>"></th>
   <th><%=c.getId() %></th>
   <td><%=c.getName() %></td>
   <td><%=c.getEmail() %></td>
   <td><%=c.getPhone()%></td>
   <td><button type="button" class="btn"  style="background-color: #83afd4;"data-bs-toggle="modal" data-bs-target="#exampleModal<%=c.getId()%>">
  Click to View
  </button></td>
   <td><%=c.getDate() %></td>
   </tr>
   <!-- Modal -->
<div class="modal fade" id="exampleModal<%=c.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Question</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>
        <strong>Question:</strong><%=c.getQurey() %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn" data-bs-dismiss="modal"  style="background-color: #83afd4;">Close</button>
      
      </div>
    </div>
  </div>
</div>
   <%} %>
   
  </tbody>
</table>
<div class="text-center">
<button class="btn" id="btndelete" style="background-color: #83afd4;">Delete</button></div>
</form>
<%} 
else{%>

<h2>No Contact are Present</h2>
 <%} %>
 <img alt="pin-img" src="/GeoVendor/images/pin.gif" height="40"
				width="50" class="pin-img">
 </div>
</div>
<script >
let flag=0;
let btn=document.getElementById("btndelete")
btn.addEventListener("click",function(event){

	
	event.preventDefault()//perventing from form submission
	//alert("hello")
	let checkBoxArray = document.getElementsByName("chk");

	
	for(let i=0;i<checkBoxArray.length;i++)
	{
       if(checkBoxArray[i].checked==true){
             flag=1;
             break;
       }
	}//for close
	if(flag==1){
		document.forms[0].submit()
	}
	else{
         alert("Pls Select atleast one checkbox")
	}
	
	
})//event listener closed
</script>


<%@ include file="/WEB-INF/common/footer.html"%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>