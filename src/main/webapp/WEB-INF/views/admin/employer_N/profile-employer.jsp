<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="vi">
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
<link rel="stylesheet" href="/user/css/select2.min.css">
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
						<li class="nav-item active"><a class="nav-link" href="#"><i
								class="fa fa-search" aria-hidden="true"></i> <span
								class="hidden-text">Tìm kiếm</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">Hello,
								${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> VI </a>
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
<body>
	<div class="container-fluid published-recuitment-wrapper">
		<div class="container published-recuitment-content">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-12 recuitment-inner">
					<form action="/save_NTD" method="post"
						enctype="multipart/form-data" class="employee-form">
						<div class="card-header recuitment-card-header" id="headingOne">
							<h2 class="mb-0">
								<a class="btn btn-link btn-block text-left recuitment-header"
									type="button" data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne"> Thông tin
									nhà tuyển dụng </a>
							</h2>
						</div>
						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body recuitment-body row">
								<div class="col-md-3">
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
								</div>
								<div class="col-md-9">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Tên
											công ty<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="namecompany" type="text" class="form-control"
												placeholder="Nhập tên công ty">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Địa
											chỉ<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="address" type="text" class="form-control"
												placeholder="Nhập địa chỉ">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Số
											điện thoại</label>
										<div class="col-sm-9">
											<input name="phone" type="number" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Mã
											số thuế<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="taxcode" type="text" class="form-control"
												placeholder="Nhập mã số thuế công ty">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Website<span
											style="color: red" class="pl-2">*</span></label>
										<div class="col-sm-9">
											<input name="website" type="text" class="form-control"
												placeholder="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Giới
											thiệu<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<textarea name="introduction" class="form-control"
												type="text" rows="10"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="rec-submit">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn-submit-recuitment mb-3 ml-3"
								name="">
								<i class="fa fa-floppy-o pr-2"></i>Lưu Hồ Sơ
							</button>
						</div>
					</form>


				</div>
				<!-- Side bar can be added here if needed -->
				<div class="col-md-4 col-sm-12 col-12">
					<div class="recuiter-info">
						<div class="recuiter-info-avt">
							<img src="img/icon_avatar.jpg">
						</div>
						<div class="clearfix list-rec">
							<h4>NESTLE Inc.</h4>
							<ul>
								<li><a href="#">Việc làm đang đăng <strong>(0)</strong></a></li>
								<li><a href="#">Follower <strong>(450)</strong></a></li>
							</ul>
						</div>
					</div>


					<div class="block-sidebar" style="margin-bottom: 20px;">
						<header>
							<h3 class="title-sidebar font-roboto bg-primary">Trung tâm
								quản lý</h3>
						</header>
						<div class="content-sidebar menu-trung-tam-ql menu-ql-employer">
							<h3 class="menu-ql-ntv">Quản lý tài khoản</h3>
							<ul>
								<li><a href="#"> Tài khoản </a></li>
								<li><a href="#"> Giấy phép kinh doanh </a></li>
							</ul>
							<h3 class="menu-ql-ntv">Quản lý dịch vụ</h3>
							<ul>
								<li><a href="#"> Lịch sử dịch vụ </a></li>
								<li><a href="#" target="_blank"> Báo giá </a></li>
							</ul>
							<h3 class="menu-ql-ntv">Quản lý tin tuyển dụng</h3>
							<ul>
								<li><a href="#"> Đăng tin tuyển dụng </a></li>
								<li><a href="#"> Danh sách tin tuyển dụng </a></li>
							</ul>
							<h3 class="menu-ql-ntv">Quản lý ứng viên</h3>
							<ul>
								<li><a href="#"> Tìm kiếm hồ sơ </a></li>
								<li><a href="#"> Hồ sơ đã lưu </a></li>
								<li><a href="#"> Hồ sơ đã ứng tuyển </a></li>
								<li><a href="#" title="Thông báo hồ sơ phù hợp"> Thông
										báo hồ sơ phù hợp </a></li>
							</ul>
							<h3 class="menu-ql-ntv">Hỗ trợ và thông báo</h3>
							<ul>
								<li><a href="#" title="Gửi yêu cầu đến ban quản trị">
										Gửi yêu cầu đến ban quản trị </a></li>
								<li><a href="#" title="Ban quản trị thông báo"> Ban
										quản trị thông báo </a></li>
								<li><a href="#" title="Hướng dẫn thao tác"> Hướng dẫn
										thao tác </a></li>
								<li><a href="#" target="_blank"> <span>Thông tin
											thanh toán</span>
								</a></li>
								<li><a target="_blank" href="#"> <span>Cổng tra
											cứu lương</span>
								</a></li>
								<li><a target="_blank" href="#"> <span> Cẩm nang
											tuyển dụng</span>
								</a></li>
							</ul>
							<ul>
								<li class="logout"><a href="#" title="Đăng xuất"> Đăng
										xuất </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

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
					<li><a href="#"> <i class="fa fa-map-marker fticn"></i> 33
							Xô Viết Nghệ Tĩnh, Đà Nẵng
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
			Copyright © 2020 <a href="#"> Tech<b>Job</b></a>. All Right Reserved.
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
</body>
</html>