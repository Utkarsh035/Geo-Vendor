<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	$(document).ready(
	function(){
   /*   alert("hello") */
   
   $("#btnshow").click(function(){

	   $("#div1").show();
});
  $("#btnhide").click(function(){
	  $("#div1").hide();
}); 
  
});//takes guarntee until unless whole document get ready
	</script>
</head>
<body>
<button id="btnshow">show</button>
<button id="btnhide">hide</button>
<div id="div1"  style="width: 200px;height: 200px; background-color: blue;display: none;">
<h2>this is div</h2></div>
</body>
</html>