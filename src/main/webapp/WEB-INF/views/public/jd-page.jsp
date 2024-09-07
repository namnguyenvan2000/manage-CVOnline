<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<!-- Owl Stylesheets -->
<link rel="stylesheet" href="/user/css/owlcarousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="/user/css/owlcarousel/owl.theme.default.min.css">
<!-- main css -->
<link rel="stylesheet" type="text/css" href="/user/css/style.css">

</head>
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


	<!-- job detail header -->
	<div class="container-fluid job-detail-wrap">
		<div class="container job-detail">
			<c:forEach items="${jobs_detail }" var="job">
				<div class="job-detail-header">
					<div class="row">

						<div class="col-md-2 col-sm-12 col-12">

							<div class="job-detail-header-logo">
								<a href="#"> <img
									src="${pageContext.request.contextPath}/images/${job.jobPosting.employer.logo}"
									class="job-logo-ima" alt="job-logo">
								</a>
							</div>

						</div>

						<div class="col-md-7 col-sm-12 col-12">

							<div class="job-detail-header-desc">
								<div class="job-detail-header-title">
									<a href="#">${job.jobPosting.jobTitle}</a>
								</div>
								<div class="job-detail-header-company">
									<a href="#">${job.jobPosting.employer.namecompany}</a>
								</div>
								<div class="job-detail-header-de">
									<ul>
										<li><i class="fa fa-map-marker icn-jd"></i><span>${job.jobPosting.jobLocation}</span></li>
										<li><i class="fa fa-usd icn-jd"></i><span>${job.salary}</span></li>
										<li><i class="fa fa-calendar icn-jd"></i><span>${job.jobPosting.dealine}</span></li>
									</ul>
								</div>
								<!--            <div class="job-detail-header-tag">
                  <ul>
                      <li>
                          <a href="#">Java</a>
                      </li>
                      <li>
                          <a href="#">.NET</a>
                      </li>
                      <li>
                          <a href="#">SQL</a>
                      </li>
                      <li>
                          <a href="#">C#</a>
                      </li>
                  </ul>
              </div>-->
							</div>
						</div>
						
						<c:if test="${account.role.nameRole == 'APPLICANT'}">
							<div class="col-md-3 col-sm-12 col-12">
							<div class="jd-header-wrap-right">
								<div class="jd-center">
									<a href="/user/saveCV" id="registerBtn" class="btn btn-primary btn-apply"
										data-toggle="modal" data-target="#registerModal">Nộp đơn</a>
							
								</div>
							</div>
						</div>
						</c:if>
						
						
						
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	<!-- (end) job detail header -->

	<div class="clearfix"></div>

	<!-- Phần thân -->
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<!-- Main wrapper -->
				<div class="col-md-8 col-sm-12 col-12 clear-left">
					<c:forEach items="${jobs_detail }" var="job">
						<div class="main-wrapper">
							<h2 class="widget-title">
								<span>Phúc lợi</span>
							</h2>
							<!-- content -->
							<div class="welfare-wrap">
								<div class="row">
									<div class="welfare-list">
										<ul>
											<li>
												<p>
													*
													<c:out
														value="${fn:replace(job.benefits, '*', '<br> <br> *')}"
														escapeXml="false" />
												</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<h2 class="widget-title">
								<span>Mô tả công việc</span>
							</h2>
							<div class="jd-content">
								<span>* <c:out
										value="${fn:replace(job.jobDescription, '*', '<br> <br> *')}"
										escapeXml="false" /></span>
							</div>
							<h2 class="widget-title">
								<span>Yêu cầu công việc</span>
							</h2>
							<div class="jd-content">
								<span>* <c:out
										value="${fn:replace(job.jobRequirements, '*', '<br> <br> *')}"
										escapeXml="false" /></span>
							</div>
						</div>



					</c:forEach>
				</div>



				<!-- Sidebar -->
				<div class="col-md-4 col-sm-12 col-12 clear-right">
					<div class="side-bar mb-3">
						<c:forEach items="${jobs_detail }" var="job">
							<h2 class="widget-title">
								<span>Thông tin</span>
							</h2>

							<div class="job-info-wrap">
								<div class="job-info-list">
									<div class="row">
										<div class="col-sm-4">
											<span class="ji-title">Nơi làm việc:</span>
										</div>
										<div class="col-sm-8">
											<span class="ji-main">${job.jobPosting.jobLocation}</span>
										</div>
									</div>
								</div>


								<div class="job-info-list">
									<div class="row">
										<div class="col-sm-4">
											<span class="ji-title">Lương:</span>
										</div>
										<div class="col-sm-8">
											<span class="ji-main">${job.salary}</span>
										</div>
									</div>
								</div>

								<div class="job-info-list">
									<div class="row">
										<div class="col-sm-4">
											<span class="ji-title">Hạn nộp:</span>
										</div>
										<div class="col-sm-8">
											<span class="ji-main">${job.jobPosting.dealine}</span>
										</div>
									</div>
								</div>

								<div class="job-info-list">
									<div class="row">
										<div class="col-sm-4">
											<span class="ji-title">Ngành nghề:</span>
										</div>
										<div class="col-sm-8">
											<span class="ji-main">${job.jobPosting.majorName }</span>
										</div>
									</div>
								</div>

								<!--     <div class="job-info-list">
              <div class="row">
                <div class="col-sm-4">
                  <span class="ji-title">Kỹ năng:</span>
                </div>
                <div class="col-sm-8">
                  <span class="ji-main">PR Activity</span>
                </div>
              </div>
            </div>
			-->
								<div class="job-info-list">
									<div class="row">
										<div class="col-sm-4">
											<span class="ji-title">Kinh nghiệm:</span>
										</div>
										<div class="col-sm-8">
											<span class="ji-main">${job.experience }</span>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>

					<div class="side-bar mb-3">
						<c:forEach items="${jobs_detail }" var="job">
							<h2 class="widget-title">
								<span>Giới thiệu công ty</span>
							</h2>
							<div class="company-intro">
								<a href="#"> <img
									src="${pageContext.request.contextPath}/images/${job.jobPosting.employer.logo}"
									class="job-logo-ima" alt="job-logo">
								</a>
							</div>
							<h2 class="company-intro-name">${job.jobPosting.employer.namecompany }</h2>
							<ul class="job-add">
								<li><i class="fa fa-map-marker ja-icn"></i> <span>${job.jobPosting.employer.address }</span>
								</li>
								<li><i class="fa fa-bar-chart ja-icn"></i> <span>Quy
										mô công ty: ${job.jobPosting.employer.introduction }</span></li>
							</ul>

							<div class="wrap-comp-info mb-2">
								<a href="#" class="btn btn-primary btn-company">Xem thêm</a>
							</div>
						</c:forEach>
					</div>


					<div class="side-bar mb-3">

						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="home-ads">
										<a href="#"> <img src="/user/img/ads1.jpg">
										</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) Phần thân -->



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

	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="<c:url value='/user/saveCV' />" method="post" class="recuitment-form"
						enctype="multipart/form-data">
						<div class="accordion" id="accordionExample">
							<div class="card recuitment-card">
								<div>
									<div class="card-body recuitment-body">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Tải lên CV<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9 ">
											<input type="hidden" name="id" value="${param.id}" />
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
						<div class="rec-submit">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn-submit-recuitment">
								<i class="fa fa-floppy-o pr-2"></i>Ứng tuyển
							</button>
						</div>
					</form>
			</div>
		</div>
	</div>

	<!-- (end) footer -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="/user/js/readmore.js"></script>
	<script type="text/javascript">
		$('.catelog-list')
				.readmore(
						{
							speed : 75,
							maxHeight : 150,
							moreLink : '<a href="#">Xem thêm<i class="fa fa-angle-down pl-2"></i></a>',
							lessLink : '<a href="#">Rút gọn<i class="fa fa-angle-up pl-2"></i></a>'
						});
		document.getElementById('applyBtn').addEventListener('click', function() {
	        // Replace this with your actual check for user login status
	        var isLoggedIn = "${not empty sessionScope['SPRING_SECURITY_CONTEXT']}";
	        
	        if (isLoggedIn) {
	            // User is logged in, redirect to the form page
	            window.location.href = "/user/add_cv";
	        } else {
	            // User is not logged in, redirect to login or desired page
	            window.location.href = "/login?redirect=/user/add_cv";
	        }
	    });
	</script>
	<!-- Optional JavaScript -->
	<c:if test="${not empty message}">
	    <script type="text/javascript">
	        $(document).ready(function(){
	            $('#messageModal').modal('show');
	        });
	    </script>
	</c:if>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true" >
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-body">
	                <div class="alert alert-success" role="alert">
					  ${message}
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/user/js/jquery-3.4.1.slim.min.js"></script>
	<script src="/user/js/popper.min.js"></script>
	<script src="/user/js/bootstrap.min.js"></script>
	<script src="/user/js/select2.min.js"></script>
	<script src="/user/js/jobdata.js"></script>

	<!-- <script type="text/javascript" src="js/pagination.js"></script> -->
	<!-- Owl Stylesheets Javascript -->
	<script src="/user/js/owlcarousel/owl.carousel.js"></script>
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