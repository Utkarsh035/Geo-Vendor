<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_login</title>
<style>
.main-cont {
	border: 1px solid #8aaded;
	box-shadow: 2px 2px 10px #8aaded;
}
</style>
<%@include file="/common_html/all_css.html"%>
</head>
<body>
	<div class="main-body">
		<%
		String mess = (String) request.getAttribute("msg");
		if (mess != null) {
		%>
		<div class="alert alert-info alert-dismissible fade show" role="alert">
			<h4><%=mess%></h4>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		}
		%>

		<div class="container-fluid w-50 mt-5 mb-5 main-cont">
			<form action="/GeoVendor/AdminLogin" method="post" class="mt-5"
				novalidate class="needs-validation">

				<div class="mb-3 mt-3 input-group">
					<span class="input-group-text "><i
						class="	far fa-envelope-open"></i></span>

					<div class=" form-floating">
						<input type="email" name="email" placeholder="Enter Email"
							class="form-control" required> <label for="email">Email-ID</label>
						<div class="invalid-feedback">Please Provide Your Email</div>
					</div>
				</div>
				
				<div class="mb-3  input-group">
					<span class="input-group-text "><i class="	fas fa-key"></i></span>
					<div class=" form-floating">
						<input type="password" name="password"
							placeholder="Enter password" class="form-control" required>
						<label for="password">Enter Password</label>
						<div class="invalid-feedback">Please Enter Password</div>
					</div>
				</div>
				<div class="text-center mb-3">
					<button class="btn" style="background-color: #83afd4;">
						<i class="fas fa-lock"></i> Submit
					</button>
				</div>

			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/footer.html"%>
	<script src="/GeoVendor/js/validation.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>