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
    $(document).ready(function(){

      $("#div1").click(function(){
        /* $("#div2").slideDown(1500) */
        $("#div2").slideToggle(500)
});
      $("#goals").slideDown(1000)
      /* $("#img1").fadeOut(2000) */
      $("#img1").fadeTo(2000,.5)
      $("#change").click(function(){
       $("#message").css({
         " font-size":"30px",
          "color":"RED",
       })

});
      
    });
    </script>
</head>
<body>
<div style="width:100%;height: 100px;background-color: red; font-weight: bolder; text-align: center" id="div1">|</div>
<div style="width:10%;height: 250px;background-color: yellow;margin: auto; display: none; border-radius: 40px  40px 0 0; " id="div2"></div>
<div id="about">
<h1 id="goals" style="display: none;">Our Goals</h1>

<img alt="" src="/GeoVendor/images/contact.gif" style="width: 200px;height: 200px;"id="img1">
<h2 id="message" style="color:blue;font-size: 20px">Use of jquery</h2>
<button id="change">change</button>
</div>
</body>
</html>