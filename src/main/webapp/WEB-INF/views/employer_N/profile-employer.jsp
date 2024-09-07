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
									class="dropdown-item" href="/employer/recruitment-management">Tin
									tuyển dụng đã đăng</a> <a class="dropdown-item"
									href="/employer/candidate-management">Xem ứng viên đã ứng
									tuyển</a> <a class="dropdown-item"
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
				<li class="nav-item active"><a class="nav-link" href="#">Thông
						tin cá nhân</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/employer/recruitment-management">Tin tuyển dụng đã đăng</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/employer/candidate-management">Xem ứng viên đã ứng tuyển</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/employer/change-password-employer">Đổi mật khẩu</a></li>
			</ul>
			<ul class="rec-nav-right">
				<li class="nav-item"><a class="nav-link"
					href="/employer/JobPosting">Đăng tin</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
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
					<c:if test="${not empty successMessage}">
						<div class="alert alert-success" role="alert">
							${successMessage}</div>
					</c:if>
					<form action="/employer/profile-employer/update" method="post"
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

											<input name="logoFile" type='file' id="imageUpload"
												accept=".png, .jpg, .jpeg" onchange="previewImage(event)" />
											<label for="imageUpload"></label>
										</div>
										<div class="avatar-preview">
											<div id="imagePreview">
												<img id="previewImg" src="${logoUrl}" alt="Employer Logo"
													style="width: 100%; height: auto;">
											</div>
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
												placeholder="Nhập tên công ty"
												value="${employer.namecompany}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Địa
											chỉ<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="address" type="text" class="form-control"
												placeholder="Nhập địa chỉ" value="${employer.address}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Số
											điện thoại<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="phone" type="number" class="form-control"
												placeholder="Nhập số điện thoại" value="${employer.phone}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Mã
											số thuế<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<input name="taxcode" type="text" class="form-control"
												placeholder="Nhập mã số thuế công ty"
												value="${employer.taxcode}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Website<span
											style="color: red" class="pl-2">*</span></label>
										<div class="col-sm-9">
											<input name="website" type="text" class="form-control"
												placeholder="Nhập link website của công ty"
												value="${employer.website}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-right label">Giới
											thiệu<span style="color: red" class="pl-2">*</span>
										</label>
										<div class="col-sm-9">
											<textarea name="introduction" class="form-control"
												type="text" rows="10">${employer.introduction}</textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="rec-submit">

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
							<img src="${logoUrl}" alt="Employer Logo"
								style="width: 50%; height: auto;">
						</div>
						<div class="clearfix list-rec">
							<h4>${employer.namecompany}</h4>
							<ul>
								<li><a href="#">Số công việc đã đăng: ${JobCount }</a></li>
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
<script src="js/jquery-3.4.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jobdata.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/main.js"></script>
<!-- Owl Stylesheets Javascript -->
<script src="js/owlcarousel/owl.carousel.js"></script>
<!-- Read More Plugin -->
<script>
document.getElementById('imageUpload').addEventListener('change', function() {
    const file = this.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function(event) {
            document.getElementById('previewImg').setAttribute('src', event.target.result);
        };

        reader.readAsDataURL(file);
    }
});
	document.getElementById("dropdownMenu").addEventListener("click", function(event) {
	    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ a
	    var dropdownContent = document.getElementById("dropdownContent");
	
	window.addEventListener("click", function(event) {
	    if (!event.target.matches('#dropdownMenu')) {
	        var dropdowns = document.getElementsByClassName("dropdown-content");
	        for (var i = 0; i < dropdowns.length; i++) {
	            dropdowns[i].style.display = "none";
	        }
	    }
	});
</script>
</body>
</html>