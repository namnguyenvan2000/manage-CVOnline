<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Register-TechJobs</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- bootstrap css -->
  <link rel="stylesheet" type="text/css" href="/user/css/bootstrap.min.css">

  <!-- Font Awesome -->
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <!-- select 2 css -->
  <link rel="stylesheet" href="/user/css/select2.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- Owl Stylesheets -->
  <link rel="stylesheet" href="/user/css/owlcarousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/user/css/owlcarousel/owl.theme.default.min.css">
   <!-- main css -->
  <link rel="stylesheet" type="text/css" href="/user/css/style.css"> 
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
							<img src="/user/img/techjobs_bgw.png" alt="TechJobs">
						</a>
					</h3>
					<span class="login-breadcrumb"><em>/</em> Register</span>
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
						<img src="/user/img/banner-login.png">
					</div>
					<!-- login main form -->
					<div class="col-md-6 col-sm-12 col-12 login-main-right">
						<form action="/public/registerEmployer" method="post" class="login-form reg-form" enctype="multipart/form-data">
								<div class="login-main-header">
									<h3>Đăng Ký</h3>
								</div>
								<h3>
											Logo<span class="req">*</span>
										</h3>
								<div class="avatar-upload">
										<div class="avatar-edit">
											<input name="logo" type='file' id="imageUpload"
												accept=".png, .jpg, .jpeg" onchange="previewImage(event)" />
											<label for="imageUpload"></label>
										</div>
										<div class="avatar-preview">
											<div id="imagePreview"></div>
										</div>
									</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Email<span class="req">*</span>
										</h5>
										<input type="email" name="email" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Mật khẩu<span class="req">*</span>
										</h5>
										<input name="password" required type="password"
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Nhập Lại Mật khẩu<span class="req">*</span>
										</h5>
										<input class="input form-control-lgin" type="password"
											name="confirmPassword" required>
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Tên công ty<span class="req">*</span>
										</h5>
										<input name="namecompany" type="text" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Địa chỉ<span class="req">*</span>
										</h5>
										<input name="address" type="text" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Số điện thoại<span class="req">*</span>
										</h5>
										<input name="phone" type="number" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Giới thiệu<span class="req">*</span>
										</h5>
										<input name="introduction" type="text" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Mã số thuế<span class="req">*</span>
										</h5>
										<input name="taxcode" type="number" required
											class="input form-control-lgin">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<h5>
											Website<span class="req">*</span>
										</h5>
										<input name="website" type="text" required
											class="input form-control-lgin">
									</div>
								</div>
								<c:if test="${not empty error}">
									<div style="color: red;">${error}</div>
								</c:if>
								<c:if test="${not empty message}">
									<div style="color: green;">${message}</div>
								</c:if>
								<div class="form-group d-block frm-text">
									<a href="#" class="fg-login d-inline-block"></a> <a href="/login"
										class="fg-login float-right d-inline-block">Bạn đã có tài
										khoản? Đăng Nhập</a>
								</div>
								<button type="submit"
									class="btn btn-primary float-right btn-login d-block w-100">Đăng
									Ký</button>
								<div class="form-group d-block w-100 mt-5">
									<div class="">
										
									</div>

									<div class="row">
										
										<div class="col-md-12 col-12 pl-7">
											
										</div>
									</div>
								</div>
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
						<p>Copyright © 2024 <a href="#"> TechJobs</a>. All Rights Reserved.</p>
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
    <script src="/user/js/jquery-3.4.1.slim.min.js"></script>
    <script src="/user/js/popper.min.js"></script>
    <script src="/user/js/bootstrap.min.js"></script>
<script>
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('imagePreview');
			output.style.backgroundImage = "url('" + reader.result + "')";
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
    <script type="text/javascript" src="/user/js/main.js"></script>
</body>
</html>