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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Owl Stylesheets -->
<link rel="stylesheet" href="/user/css/owlcarousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="/user/css/owlcarousel/owl.theme.default.min.css">
<!-- main css -->
<link rel="stylesheet" type="text/css" href="/user/css/style.css">

</head>
<body>
	<!-- main nav -->
	<div class="container-fluid fluid-nav">
		<div class="container cnt-tnar">
			<nav class="navbar navbar-expand-lg navbar-light bg-light tjnav-bar">
				<!-- <a class="navbar-brand" href="#">Navbar</a> -->
				<a href="#" class="nav-logo"> <img
					src="/user/img/techjobs_bgb.png">
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

						<c:choose>
							<c:when test="${not empty sessionScope.account}">
								<li class="nav-item dropdown"><a class="nav-link" href="#"
									id="dropdownMenu"> Xin chào
										${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name}
								</a>
									<div class="dropdown-content" id="dropdownContent"
										style="display: none; color: black;">
										<c:choose>
											<c:when test="${account.role.nameRole == 'APPLICANT'}">
												<a class="dropdown-item" href="/user/profile-user">Thông
													tin cá nhân</a>
												<a class="dropdown-item" href="/user/CV">Xem CV</a>
												<a class="dropdown-item" href="/user/CV-applied">Xem
													việc làm đã ứng tuyển</a>
											</c:when>
											<c:when test="${account.role.nameRole == 'EMPLOYER'}">
												<a class="dropdown-item" href="/employer/profile_employer">Thông
													tin cá nhân</a>
												<a class="dropdown-item"
													href="/employer/recruitment-management">Tin tuyển dụng
													đã đăng</a>
												<a class="dropdown-item"
													href="/employer/candidate-management">Xem ứng viên đã
													ứng tuyển</a>
											</c:when>
										</c:choose>
										<a class="dropdown-item"
											href="${pageContext.request.contextPath}/logout">Đăng
											Xuất</a>
									</div></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a id="registerBtn" class="nav-link"
									href="#" data-toggle="modal" data-target="#registerModal">Đăng
										Ký</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/login">Đăng Nhập</a></li>
							</c:otherwise>
						</c:choose>
						<c:if test="${account.role.nameRole == 'EMPLOYER'}">
							<li class="nav-item"><a class="nav-link btn-employers"
								href="/employer/JobPosting" tabindex="-1" aria-disabled="true">Đăng
									tin tuyển dụng</a></li>
						</c:if>
						<c:if test="${account.role.nameRole == 'ADMIN'}">
							<li class="nav-item"><a class="nav-link btn-employers"
								href="/admin/index" tabindex="-1" aria-disabled="true">ADMIN</a>
							</li>
						</c:if>
					</ul>
				</div>


			</nav>
		</div>
	</div>
	<!-- (end) main nav -->

	<div class="clearfix"></div>

	<!-- main banner -->
	<div class="container-fluid clear-left clear-right">
		<div class="main-banner">
			<div class="banner-image">
				<img src="/user/img/banner2.jpg" alt="banner-image">
			</div>
		</div>
		<div class="banner-content">
			<h3>TOP Jobs For Developers</h3>
		</div>
	</div>
	<!-- (end) main banner -->

	<!-- search section -->
	<div class="container-fluid search-fluid">
		<div class="container">
			<div class="search-wrapper" style="margin-top: -11rem;">


				<div class="tab-content search-tab-content" id="myTabContent">

					<div class="tab-pane stab-pane fade show active" id="home"
						role="tabpanel" aria-labelledby="home-tab">
						<form action="/public/searchkey" method="post"
							class="bn-search-form">
							<div class="row">
								<div class="col-md-10 col-sm-12">
									<div class="row">
										<div class="col-md-12">
											<div class="input-group s-input-group">
												<input type="text" class="form-control sinput"
													name="keywords" placeholder="Nhập kỹ năng, công việc,...">
												<span><i class="fa fa-search"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2 col-sm-12">
									<button type="submit"
										class="btn btn-primary btn-search col-sm-12">Tìm kiếm</button>
								</div>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- (end) search section -->

	<!-- job board -->
	<div class="container-fluid jb-wrapper">
		<div class="container">
			<div class="row">
				<!-- job board -->
				<div class="col-md-12 col-sm-12 col-12">
					<div class="job-board-wrap">
						<h2 class="widget-title">
							<span>Tin tuyển dụng</span>
						</h2>

						<div class="job-group">
							<div class="job pagi">
								<c:forEach var="job" items="${jobPostings}">
									<div class="job-content" >
										<div class="job-logo">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/images/${job.employer.logo}"
												class="job-logo-ima" alt="job-logo">
											</a>
										</div>

										<div class="job-desc">
											<div class="job-title">
												<a href="${pageContext.request.contextPath}./jd-page?id=${job.id}">${job.jobTitle}</a>
											</div>
											<div class="job-company">
												<a href="#">${job.employer.namecompany}</a> | <a href="#"
													class="job-address"><i class="fa fa-map-marker"
													aria-hidden="true"></i> ${job.jobLocation}</a>
											</div>

											<div class="job-inf">
												<div class="job-main-skill">
													<i class="fa fa-code" aria-hidden="true"></i> <a href="#">
														${job.majorName}</a>
												</div>
												<div class="job-salary">
													<i class="fa fa-money" aria-hidden="true"></i> <span
														class="salary">${job.jobDetail.salary}</span>
												</div>
												<div class="job-deadline">
													<span><i class="fa fa-clock-o" aria-hidden="true"></i>
														Hạn nộp: <strong>${job.dealine}</strong></span>
												</div>
											</div>
										</div>
										<div class="wrap-btn-appl">
											<a
												href="${pageContext.request.contextPath}./jd-page?id=${job.id}"
												class="btn btn-appl">Apply Now</a>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="pagination-container">
								<ul class="pagination justify-content-center">
								

									<c:forEach var="i" begin="0" end="${totalPages - 1}">
										<li class="page-item ${i == currentPage ? 'active' : ''}">
											<c:choose>
												<c:when test="${i == currentPage}">
													<span class="page-link">${i + 1}</span>
												</c:when>
												<c:otherwise>
													<a class="page-link"
														href="${pageContext.request.contextPath}/public/index?page=${i + 1}&size=6">${i + 1}</a>
												</c:otherwise>
											</c:choose>
										</li>
									</c:forEach>

									
								</ul>
							</div>


						</div>


					</div>
				</div>

				<!-- (end) job board -->
			</div>
		</div>
	</div>
	<!-- (end) job board & sidebar section  -->



	<div class="clearfix"></div>

	<div class="clearfix"></div>

	<div class="clearfix"></div>

	<!-- job-best-salary -->
	<div class="container-fluid">
		<div class="container job-best-salary">
			<div class="row">
				<div class="col-md-12 job-board2-wrap-header job-best-salary-header">
					<h3>
						<i class="fa fa-briefcase pr-2"></i> Việc làm mới nhất
					</h3>
				</div>
			</div>
			<div class="row job-best-salary-inner">
				<c:forEach var="jobposting" items="${latestJobs}">
					<div class="col-md-6 job-over-item">
						<div class="job-inner-over-item">
							<a
								href="${pageContext.request.contextPath}./jd-page?id=${jobposting.id}">
								<div class="thumbnail">
									<img
										src="${pageContext.request.contextPath}/images/${jobposting.employer.logo}"
										alt="company logo image">
								</div>
								<div class="content">
									<div class="job-name">${jobposting.jobTitle}</div>
									<a href="#company" class="company">
										${jobposting.employer.namecompany} </a> | <a href="#jobdate"
										class="company"><i class="fa fa-calendar pr-2"></i>${jobposting.jobPostingDate}
									</a>
								</div>
								<div class="extra-info">
									<p class="salary mt-2">
										<i class="fa fa-money pr-2"></i>${jobposting.jobDetail.salary}
									</p>
									<p class="place">
										<i class="fa fa-map-marker pr-2"></i>${jobposting.jobLocation}
									</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- (end) job-best-salary -->


	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="home-ads">
						<a href="#"> <img src="/user/img/hna.jpg">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- job-best-salary -->
	<div class="container-fluid">
		<div class="container job-best-salary">
			<div class="row">
				<div class="col-md-12 job-board2-wrap-header job-best-salary-header">
					<h3>
						<i class="fa fa-briefcase pr-2"></i> Việc làm lương cao
					</h3>
				</div>
			</div>
			<div class="row job-best-salary-inner">
				<c:forEach var="jobposting" items="${highestSalaryJobs}">
					<div class="col-md-6 job-over-item">
						<div class="job-inner-over-item">
							<a
								href="${pageContext.request.contextPath}./jd-page?id=${jobposting.id}">
								<div class="thumbnail">
									<img
										src="${pageContext.request.contextPath}/images/${jobposting.employer.logo}"
										alt="company logo image">
								</div>
								<div class="content">
									<div class="job-name">${jobposting.jobTitle}</div>
									<a href="#company" class="company">
										${jobposting.employer.namecompany} </a>
								</div>
								<div class="extra-info">
									<p class="salary mt-2">
										<i class="fa fa-money pr-2"></i>${jobposting.jobDetail.salary}
									</p>
									<p class="place">
										<i class="fa fa-map-marker pr-2"></i>${jobposting.jobLocation}
									</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- (end) job-best-salary -->

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
							<ul class="spp-list">
							<li><span><i class="fa-solid fa-envelope pr-2 icsp" ></i>Email hỗ trợ:</span></li>
							<li><span>techjobs123v123@gmail.com</span>
							</li>
						</ul>
							
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

	
	<!-- Modal -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="registerModalLabel">Bạn là ai?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<button id="jobSeekerBtn" type="button" class="btn btn-primary">
						<a href="/public/signup" style="color: white;"> Tôi là người
							tìm việc</a>
					</button>
					<button id="employerBtn" type="button" class="btn btn-success">
						<a href="/public/register" style="color: white;"> Tôi là nhà
							tuyển dụng</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) footer -->



	<!-- Read More Plugin -->
	<script>
		document.getElementById("dropdownMenu").addEventListener(
				"click",
				function(event) {
					event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ a
					var dropdownContent = document
							.getElementById("dropdownContent");

					// Kiểm tra và thay đổi trạng thái hiển thị của dropdown
					if (dropdownContent.style.display === "none") {
						dropdownContent.style.display = "block";
					} else {
						dropdownContent.style.display = "none";
					}
				});

		// Ẩn menu dropdown nếu người dùng click bên ngoài menu
		window.addEventListener("click", function(event) {
			if (!event.target.matches('#dropdownMenu')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				for (var i = 0; i < dropdowns.length; i++) {
					dropdowns[i].style.display = "none";
				}
			}
		});
	</script>


</body>

</html>