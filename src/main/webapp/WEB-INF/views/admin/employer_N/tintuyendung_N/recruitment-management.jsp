<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>TechJobs</title>
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
<link rel="stylesheet" href="css/select2.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- main css -->
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
</head>
<body>
	<!-- main nav -->
	<div class="container-fluid fluid-nav another-page">
		<div class="container cnt-tnar">
			<nav class="navbar navbar-expand-lg navbar-light bg-light tjnav-bar">
				<!-- <a class="navbar-brand" href="#">Navbar</a> -->
				<a href="#" class="nav-logo"> <img
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
					<ul class="navbar-nav mr-auto tnav-left tn-nav">
						<li class="nav-item"><a class="nav-link" href="#">Việc
								Làm IT</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Tin Tức</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Dropdown </a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div></li>
					</ul>
					<ul class="navbar-nav mr-auto my-2 my-lg-0 tnav-right tn-nav">
						<li class="nav-item"><a class="nav-link" href="#">Hello, ${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">VI</a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">English</a>
							</div></li>
						<li class="nav-item"><a class="nav-link btn-employers"
							href="#" tabindex="-1" aria-disabled="true"
							style="color: #fff !important">Nhà Tuyển Dụng</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- (end) main nav -->

	<div class="clearfix"></div>

	<!-- recuiter Nav -->
	<nav class="navbar navbar-expand-lg navbar-light nav-recuitment">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNava" aria-controls="navbarNava"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse container" id="navbarNava">
			<ul class="navbar-nav nav-recuitment-li">
				<li class="nav-item active"><a class="nav-link" href="#">Quản
						lý đăng tuyển</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Quản lý
						ứng viên</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Quản lý
						đăng tin</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Quản lý
						hồ sơ</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Tài khoản</a>
				</li>
			</ul>
			<ul class="rec-nav-right">
				<li class="nav-item"><a class="nav-link" href="#">Tìm hồ sơ</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Đăng
						tuyển</a></li>
			</ul>
		</div>
	</nav>
	<!--  recuiter Nav -->

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

					<div class="rightbottomsmallsection">
						<h3>Quản lý tin đăng tuyển</h3>
						<form action="/admin/ungvien/view_ungvien" class="viewjobform">
							<span>Tìm kiếm: </span> <input type="text" name="keywords" id=""
								placeholder="Vui lòng nhập thông tin tin đăng tuyển">
							<button class="btn-form" type="submit" formaction="">Tìm</button>
						</form>
						<table class="admintable">
							<tr>
								<th>STT</th>
								<th>Tiêu đề</th>
								<th>Ngày đăng</th>
								<th>Hạn nộp</th>
								<th>Trạng thái</th>
								<th colspan="3"></th>
							</tr>

							<c:forEach items="${JobPostingList}" var="jobposting">
								<tr>
									<td>${jobposting.id }</td>
									<td>${jobposting.jobTitle }</td>
									<td>${jobposting.jobPostingDate }</td>
									<td>${jobposting.dealine }</td>
									<td>${jobposting.status }</td>
									<td><a href="./recruitment-detail?id=${jobposting.id }">Chi
											tiết</a></td>
									<td><a href="">Duyệt</a></td>
								</tr>
							</c:forEach>

						</table>
					</div>

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
	<!-- (end) job support -->


	<!-- footer -->
	<div class="container-fluid footer-wrap  clear-left clear-right">
		<div class="container footer">
			<div class="row">
				<div class="col-md-4 col-sm-8 col-12">
					<h2 class="footer-heading">
						<span>About</span>
					</h2>
					<p class="footer-content">Discover the best way to find houses,
						condominiums, apartments and HDBs for sale and rent in Singapore
						with JobsOnline, Singapore's Fastest Growing Jobs Portal.</p>
					<ul class="footer-contact">
						<li><a href="#"> <i class="fa fa-phone fticn"></i> +123
								456 7890
						</a></li>
						<li><a href="#"> <i class="fa fa-envelope fticn"></i>
								hello@123.com
						</a></li>
						<li><a href="#"> <i class="fa fa-map-marker fticn"></i>
								33 Xô Viết Nghệ Tĩnh, Đà Nẵng
						</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-12">
					<h2 class="footer-heading">
						<span>Ngôn ngữ nổi bật</span>
					</h2>
					<ul class="footer-list">
						<li><a href="#">Javascript</a></li>
						<li><a href="#">Java</a></li>
						<li><a href="#">Frontend</a></li>
						<li><a href="#">SQL Server</a></li>
						<li><a href="#">.NET</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-6 col-12">
					<h2 class="footer-heading">
						<span>Tất cả ngành nghề</span>
					</h2>
					<ul class="footer-list">
						<li><a href="#">Lập trình viên</a></li>
						<li><a href="#">Kiểm thử phần mềm</a></li>
						<li><a href="#">Kỹ sư cầu nối</a></li>
						<li><a href="#">Quản lý dự án</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-6 col-12">
					<h2 class="footer-heading">
						<span>Tất cả hình thức</span>
					</h2>
					<ul class="footer-list">
						<li><a href="#">Nhân viên chính thức</a></li>
						<li><a href="#">Nhân viên bán thời gian</a></li>
						<li><a href="#">Freelancer</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-12 col-12">
					<h2 class="footer-heading">
						<span>Tất cả tỉnh thành</span>
					</h2>
					<ul class="footer-list">
						<li><a href="#">Hồ Chính Minh</a></li>
						<li><a href="#">Hà Nội</a></li>
						<li><a href="#">Đà Nẵng</a></li>
						<li><a href="#">Buôn Ma Thuột</a></li>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<footer class="container-fluid copyright-wrap">
		<div class="container copyright">
			<p class="copyright-content">
				Copyright © 2020 <a href="#"> Tech<b>Job</b></a>. All Right
				Reserved.
			</p>
		</div>
	</footer>


	<!-- (end) footer -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.4.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jobdata.js"></script>

	<script type="text/javascript" src="js/main.js"></script>
	<!-- Owl Stylesheets Javascript -->
	<script src="js/owlcarousel/owl.carousel.js"></script>
	<!-- Read More Plugin -->



</body>
</html>