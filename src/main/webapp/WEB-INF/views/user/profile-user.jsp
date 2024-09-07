<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
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
									class="dropdown-item" href="/user/CV">Xem CV</a> <a
									class="dropdown-item" href="/user/CV-applied">Xem việc làm đã ứng tuyển</a> <a
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

	<!-- recuiter Nav -->
	<nav class="navbar navbar-expand-lg navbar-light nav-recuitment">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNava" aria-controls="navbarNava"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse container" id="navbarNava">
			<ul class="navbar-nav nav-recuitment-li">
				<li class="nav-item active"><a class="nav-link" href="#">Thông tin cá nhân</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/CV">Xem CV</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/CV-applied">Việc làm đã ứng tuyển</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/change-password">Đổi mật khẩu</a></li>
			</ul>
			<ul class="rec-nav-right">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
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
					<c:if test="${not empty successMessage}">
					    <div class="alert alert-success" role="alert">
					        ${successMessage}
					    </div>
					</c:if>
					
					
					<form class="employee-form" action="/profile-user/update" method="post">
						<div class="accordion" id="accordionExample">
							<div class="card recuitment-card">
								<div class="card-header recuitment-card-header" id="headingOne">
									<h2 class="mb-0">
										<a class="btn btn-link btn-block text-left recuitment-header"
											type="button" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne"> Thông tin tài khoản <span
											id="clickc1_advance2" class="clicksd"> <i
												class="fa fa fa-angle-up"></i>
										</span>
										</a>
									</h2>
								</div>

								<div id="collapseOne" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body recuitment-body row">
										<div class="col-md-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label text-right label">Họ
													tên<span style="color: red" class="pl-2">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="fullname"  value="${applicant.fullname}"
														placeholder="Nhập họ và tên">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label text-right label">Số
													điện thoại</label>
												<div class="col-sm-9">
													<input type="number" class="form-control" name="phone" value="${applicant.phone}"
														placeholder="Nhập số điện thoại">
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-sm-3 col-form-label text-right label">Ngày
													sinh<span style="color: red" class="pl-2">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="dateofbirth" value="${applicant.dateofbirth}"
														placeholder="Nhập ngày sinh">
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label text-right label">Chỗ
													ở hiện tại<span style="color: red" class="pl-2">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="address" value="${applicant.address}"
														placeholder="Nhập địa chỉ">
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>



						</div>

						<div class="rec-submit">
							<button type="submit" class="btn-submit-recuitment mb-3 ml-3"
								name="">
								<i class="fa fa-floppy-o pr-2"></i>Lưu và thay đổi
							</button>
						</div>
					</form>

				</div>
				<!-- Side bar -->
				<div class="col-md-4 col-sm-12 col-12">
					<div class="recuiter-info">
						
						<div class="clearfix list-rec">
							<h4>${applicant.fullname}</h4>
							<h4>Số CV đã ứng tuyển: ${cvCount} </h4>
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
	<script type="text/javascript">
		// Avatar upload and preview
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imagePreview').css('background-image',
							'url(' + e.target.result + ')');
					// $('#imagePreview').hide();
					// $('#imagePreview').fadeIn(650);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#imageUpload").change(function() {
			readURL(this);
		});
	</script>


</body>
</html>