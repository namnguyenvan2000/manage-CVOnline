<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Register-TechJobs</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Roboto Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&display=swap"
	rel="stylesheet">

<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="/user/css/bootstrap.min.css">

<!-- Font Awesome -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- select 2 css -->
<link rel="stylesheet" href="/user/css/select2.min.css">

<!-- Owl Stylesheets -->
<link rel="stylesheet" href="/user/css/owlcarousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="/user/css/owlcarousel/owl.theme.default.min.css">
<!-- main css -->
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
</head>
<body>
	<!-- main nav -->
	<div class="container-fluid fluid-nav another-page">
		<div class="container cnt-tnar">
			<nav class="navbar navbar-expand-lg navbar-light bg-light tjnav-bar">
				<!-- <a class="navbar-brand" href="#">Navbar</a> -->
				<a href="/public/index" class="nav-logo"> <img
					src="/user/img/techjobs_bgw.png">
				</a>
				<button class="navbar-toggler tnavbar-toggler" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<!-- <span class="navbar-toggler-icon"></span> -->
					<i class="fa fa-bars icn-res" aria-hidden="true"></i>

				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto my-2 my-lg-0 tnav-right tn-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">Hello,
								${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name}</a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Thông tin cá nhân</a> <a
									class="dropdown-item" href="#">Xem CV</a> <a
									class="dropdown-item" href="#">Xem việc làm đã ứng tuyển</a> <a
									class="dropdown-item"
									href="${pageContext.request.contextPath}/logout">Đăng Xuất</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- (end) main nav -->

	<div class="clearfix"></div>

	<!-- widget recuitment  -->
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="home-ads">
						<a href="#"> <img src="/user/img/hna2.jpg">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) widget recuitment  -->

	<!-- published recuitment -->
	<div class="container-fluid published-recuitment-wrapper">
		<div class="container published-recuitment-content">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-12 recuitment-inner">
					<form action="/saveCV" method="post" class="recuitment-form"
						enctype="multipart/form-data">

						<div class="accordion" id="accordionExample">
							<div class="card recuitment-card">
								<div class="card-header recuitment-card-header" id="headingOne">
									<h2 class="mb-0">
										<a class="btn btn-link btn-block text-left recuitment-header"
											type="button" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne"> Thông tin ứng tuyển </a>
									</h2>
								</div>
								<div>
									<div class="card-body recuitment-body">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Tiêu
												đề ứng tuyển<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="Title" id="Title" type="text"
													class="form-control" placeholder="Nhập tiêu đề">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Chứng
												chỉ<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="certification" id="certification" type="text"
													class="form-control" placeholder="Nhập tên chứng chỉ">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Giáo
												dục<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="education" id="education" type="text"
													class="form-control"
													placeholder="Nhập tên trường đã và đang học">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Kinh
												nghiệm<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<select name="experience" id="experience"
													class="form-control">
													<option selected="selected" value="">Chọn kinh
														nghiệm</option>
													<option value="None">Chưa có kinh nghiệm</option>
													<option value="<1">Dưới 1 năm</option>
													<option value="1">1 năm</option>
													<option value="2">2 năm</option>
													<option value="3">3 năm</option>
													<option value="4">4 năm</option>
													<option value="5">5 năm</option>
													<option value=">5">Trên 5 năm</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Ngoại
												ngữ<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="foreinLanguage" id="foreinLanguage" type="text"
													class="form-control" placeholder="Nhập ngoại ngữ">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Kỹ
												năng<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="skills" id="skills" type="text"
													class="form-control" placeholder="Nhập kỹ năng">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Tải
												lên CV PDF<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9 ">
												<div id="drop-area">
													<input type="file" id="pdffile" name="pdffile"
														accept="application/pdf"
														onchange="handleFiles(this.files)"> <label
														style="cursor: pointer;" for="pdffile"></label>
													<div id="gallery"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="rec-submit">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn-submit-recuitment">
								<i class="fa fa-floppy-o pr-2"></i>Lưu Tin
							</button>
						</div>
					</form>

				</div>
				<!-- Side bar -->
				<div class="col-md-4 col-sm-12 col-12">
					<div class="recuiter-info">
						<div class="recuiter-info-avt">
							<img src="/user/img/icon_avatar.jpg">
						</div>
						<div class="clearfix list-rec">
							<h4>NESTLE Inc.</h4>
							<ul>
								<li><a href="#">Việc làm đang đăng <strong>(0)</strong></a></li>
								<li><a href="#">Follower <strong>(450)</strong></a></li>
							</ul>
						</div>
					</div>



				</div>
			</div>
		</div>

		<!-- (end) published recuitment -->

		<div class="clearfix"></div>





		<!-- job support -->
		<div class="container-fluid job-support-wrapper">
			<div class="container-fluid job-support-wrap">
				<div class="container job-support">
					<div class="row">
						<div class="col-md-6 col-sm-12 col-12">
							<ul class="spp-list">
								<li><span><i class="fa fa-question-circle pr-2 icsp"></i>Hỗ
										trợ nhà tuyển dụng:</span></li>
								<li><span><i class="fa fa-phone pr-2 icsp"></i>0123.456.789</span>
								</li>
							</ul>
						</div>
						<div class="col-md-6 col-sm-12 col-12">
							<div class="newsletter">
								<span class="txt6">Đăng ký nhận bản tin việc làm</span>
								<div class="input-group frm1">
									<input type="text" placeholder="Nhập email của bạn"
										class="newsletter-email form-control"> <a href="#"
										class="input-group-addon"><i
										class="fa fa-lg fa-envelope-o colorb"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) job support -->


	<!-- footer -->
	<div class="container-fluid job-support-wrapper">
		<div class="container-fluid job-support-wrap">
			<div class="container job-support">
				<div class="row">
					<div class="col-md-6 col-sm-12 col-12">
						<ul class="spp-list">
							<li><span><i class="fa fa-question-circle pr-2 icsp"></i>Hỗ
									trợ nhà tuyển dụng:</span></li>
							<li><span><i class="fa fa-phone pr-2 icsp"></i>0123.456.789</span>
							</li>
						</ul>
					</div>
					<div class="col-md-6 col-sm-12 col-12">
						<div class="newsletter">
							<span class="txt6">Đăng ký nhận bản tin việc làm</span>
							<div class="input-group frm1">
								<input type="text" placeholder="Nhập email của bạn"
									class="newsletter-email form-control"> <a href="#"
									class="input-group-addon"><i
									class="fa fa-lg fa-envelope-o colorb"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) job support -->


	<!-- footer -->
	<div class="container-fluid footer-wrap  clear-left clear-right">
		<div class="container footer">
			<div class="row">
				<div class="col-md-8 col-sm-8 col-12">
					<h2 class="footer-heading">
						<span>About</span>
					</h2>
					<p class="footer-content">Discover the best way to find houses,
						condominiums, apartments and HDBs for sale and rent in Singapore
						with JobsOnline, Singapore's Fastest Growing Jobs Portal.</p>
				</div>
				<div class="col-md-4 col-sm-4 col-12">
					<h2 class="footer-heading">
						<span>Thông tin liên hệ</span>
					</h2>
					<ul class="footer-contact">
						<li> <i class="fa fa-phone fticn"></i> +123
								456 7890
						</li>
						<li> <i class="fa fa-envelope fticn"></i>
								techjobs123v123@gmail.com
						</li>
						<li> <i class="fa fa-map-marker fticn"></i>
								123 HCM
						</li>
					</ul>
				</div>


			</div>
		</div>
	</div>


	<!-- (end) footer -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/user/js/jquery-3.4.1.slim.min.js"></script>
	<script src="/user/js/popper.min.js"></script>
	<script src="/user/js/bootstrap.min.js"></script>
	<script src="/user/js/select2.min.js"></script>
	<script src="/user/js/jobdata.js"></script>

	<script type="text/javascript" src="/user/js/main.js"></script>
	<!-- Owl Stylesheets Javascript -->
	<script src="/user/js/owlcarousel/owl.carousel.js"></script>
	<!-- Read More Plugin -->



</body>
</html>