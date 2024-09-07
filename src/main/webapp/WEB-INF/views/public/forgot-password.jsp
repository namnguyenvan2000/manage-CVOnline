<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login - TechJobs</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- bootstrap css -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

  <!-- Font Awesome -->
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <!-- select 2 css -->
  <link rel="stylesheet" href="<c:url value='/user/css/select2.min.css'/>">

  <!-- Owl Stylesheets -->
  <link rel="stylesheet" href="<c:url value='/user/css/owl.carousel.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/user/css/owl.theme.default.min.css'/>">
  
  <!-- main css -->
  <link rel="stylesheet" href="<c:url value='/user/css/style.css'/>">
</head>
<body>
<div class="container-fluid login-fluid clear-left clear-right">
	<div class="login-container">
		<!-- login header -->
		<div class="login-header">
			<div class="w-login m-auto">
				<div class="login-logo">
					<h3>
						<!-- <a href="#">Tech<span class="txb-logo">Jobs.</span></a> -->
						<a href="/public/index">
							<img src="<c:url value='/user/img/techjobs_bgw.png'/>" alt="TechJobs">
						</a>
					</h3>
					<span class="login-breadcrumb"><em>/</em>Quên mật khẩu</span>
				</div>
				<div class="login-right">
					<a href="/public/index" class="btn btn-return">Return Home</a>
				</div>
			</div>
		</div>
		<!-- (end) login header -->

		<div class="clearfix"></div>

		<div class="padding-top-90"></div>
		
		<!-- login main -->
		<div class="login-main">
			<div class="w-login m-auto">
				<div class="row">
					<!-- login main descriptions -->
					<div class="col-md-6 col-sm-12 col-12 login-main-left">
						<img src="<c:url value='/user/img/banner-login.png'/>">
					</div>
					<!-- login main form -->
					<div class="col-md-6 col-sm-12 col-12 login-main-right">
						<c:if test="${not empty message}">
						    <div class="alert alert-success" role="alert">
						        ${message}
						    </div>
						</c:if>
						<c:if test="${not empty error}">
						    <div class="alert alert-success" role="alert">
						        ${error}
						    </div>
						</c:if>
						<form class="login-form" action="/public/forgot-password" method="post">
							<div class="login-main-header">
								<h3>Quên mật khẩu?	</h3>
							</div>
							<div class="input-div one">
			           		   <div class="div lg-lable">
			           		   		<h5>Email</h5>
			           		   		<input name="email" type="text" class="input form-control-lgin">
			           		   </div>
		           			</div>
						<hr>
						  <button type="submit" class="btn btn-primary float-right btn-login d-block w-100">Đặt lại mật khẩu</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- (end) login main -->
	</div>
</div>
<footer class="login-footer">
		<div class="w-login m-auto">
			<div class="row">
				<!-- login footer left -->
				<div class="col-md-6 col-sm-12 col-12 login-footer-left">
					<div class="login-copyright">
						<p>Copyright © 2020 <a href="#"> TechJobs</a>. All Rights Reserved.</p>
					</div>
				</div>
				<!-- login footer right -->
				<div class="col-md-6 col-sm-12 col-12 login-footer-right">
					<ul>
						<li><a href="#">Terms & Conditions</a></li>
						<li><a href="#">Privacy Policy</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<script type="text/javascript" src="<c:url value='/user/js/main.js'/>"></script>
</body>
</html>