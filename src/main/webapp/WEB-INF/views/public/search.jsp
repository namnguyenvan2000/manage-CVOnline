<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



<!-- Font Awesome -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

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

<!-- search section -->
	<div class="container-fluid search-fluid">
	  <div class="container">
	    <div class="search-wrapper">
	      <ul class="nav nav-tabs search-nav-tabs" id="myTab" role="tablist">
	      <li class="nav-item search-nav-item">
	        <a class="nav-link snav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" role="tab" aria-controls="home" aria-selected="true">Tìm việc làm</a>
	      </li>
	    </ul>
	    <div class="tab-content search-tab-content" id="myTabContent">
	      <!-- content tab -->
	      <div class="tab-pane stab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	        <form class="bn-search-form" action="/public/searchkey" method="post">
	          <div class="row">
	            <div class="col-md-8 col-sm-12">
	              <div class="row">
	                <div class="col-md-12">
	                  <div class="input-group s-input-group">
	                    <input type="text" name="keywords" class="form-control sinput" placeholder="Nhập kỹ năng, công việc,...">
	                    <span><i class="fa fa-search"></i></span>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-2">
	                <a id="click_advance" class="btn btn-c-filter" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="true" aria-controls="collapseExample">
			                <i class="pr-2 fa fa-times" id="icon-s-sw" aria-hidden="true"></i>Tìm kiếm nâng cao
			              </a>
	                </div>
	            <div class="col-md-2 col-sm-12">
	              <button type="submit" class="btn btn-primary btn-search col-sm-12">Tìm kiếm</button>
	            </div>
	            <div class="filterSearch">
	            <div class="collapse show" id="collapseExample" style="">
	              <div class="card card-body bg-card-body-filter">
	                <div class="filter-bar">
	                    <div class="filter-form">
	                	 <div class="row">
	                	 	<div class="filter-form-item col-md-3 col-sm-12">
                                   <select class="form-select" name="jobLocation" aria-label="Default select example">
									  	<option value="" selected="selected">Địa điểm</option>
                               			<option value="Hồ Chí Minh">Hồ Chí Minh</option>
										<option value="Hà Nội">Hà Nội</option>
										<option value="An Giang">An Giang</option>
										<option value="Bạc Liêu">Bạc Liêu</option>
										<option value="Bà Rịa-Vũng Tàu">Bà Rịa-Vũng Tàu</option>
										<option value="Bắc Cạn">Bắc Cạn</option>
										<option value="Bắc Giang">Bắc Giang</option>
										<option value="Bắc Ninh">Bắc Ninh</option>
										<option value="Bến Tre">Bến Tre</option>
										<option value="Bình Dương">Bình Dương</option>
										<option value="Bình Định">Bình Định</option>
										<option value="Bình Phước">Bình Phước</option>
										<option value="Bình Thuận">Bình Thuận</option>
										<option value="Cao Bằng">Cao Bằng</option>
										<option value="Cà Mau">Cà Mau</option>
										<option value="Cần Thơ">Cần Thơ</option>
										<option value="Đà Nẵng">Đà Nẵng</option>
										<option value="Đắk Lắk">Đắk Lắk</option>
										<option value="Đắk Nông">Đắk Nông</option>
										<option value="Điện Biên">Điện Biên</option>
										<option value="Đồng Nai">Đồng Nai</option>
										<option value="Đồng Tháp">Đồng Tháp</option>
										<option value="Gia Lai">Gia Lai</option>
										<option value="Hà Giang">Hà Giang</option>
										<option value="Hà Nam">Hà Nam</option>
										<option value="Hà Tĩnh">Hà Tĩnh</option>
										<option value="Hải Dương">Hải Dương</option>
										<option value="Hải Phòng">Hải Phòng</option>
										<option value="Hậu Giang">Hậu Giang</option>
										<option value="Hòa Bình">Hòa Bình</option>
										<option value="Hưng Yên">Hưng Yên</option>
										<option value="Khánh Hòa">Khánh Hòa</option>
										<option value="Kiên Giang">Kiên Giang</option>
										<option value="Kon Tum">Kon Tum</option>
										<option value="Lai Châu">Lai Châu</option>
										<option value="Lạng Sơn">Lạng Sơn</option>
										<option value="Lào Cai">Lào Cai</option>
										<option value="Lâm Đồng">Lâm Đồng</option>
										<option value="Long An">Long An</option>
										<option value="Nam Định">Nam Định</option>
										<option value="Nghệ An">Nghệ An</option>
										<option value="Ninh Bình">Ninh Bình</option>
										<option value="Ninh Thuận">Ninh Thuận</option>
										<option value="Phú Thọ">Phú Thọ</option>
										<option value="Phú Yên">Phú Yên</option>
										<option value="Quảng Bình">Quảng Bình</option>
										<option value="Quảng Nam">Quảng Nam</option>
										<option value="Quảng Ngãi">Quảng Ngãi</option>
										<option value="Quảng Ninh">Quảng Ninh</option>
										<option value="Quảng Trị">Quảng Trị</option>
										<option value="Sóc Trăng">Sóc Trăng</option>
										<option value="Sơn La">Sơn La</option>
										<option value="Tây Ninh">Tây Ninh</option>
										<option value="Thái Bình">Thái Bình</option>
										<option value="Thái Nguyên">Thái Nguyên</option>
										<option value="Thanh Hóa">Thanh Hóa</option>
										<option value="Thừa Thiên-Huế">Thừa Thiên-Huế</option>
										<option value="Tiền Giang">Tiền Giang</option>
										<option value="Trà Vinh">Trà Vinh</option>
										<option value="Tuyên Quang">Tuyên Quang</option>
										<option value="Vĩnh Long">Vĩnh Long</option>
										<option value="Vĩnh Phúc">Vĩnh Phúc</option>
										<option value="Yên Bái">Yên Bái</option>
										<option value="Toàn quốc">Toàn quốc</option>
										<option value="Nước ngoài">Nước ngoài</option>
									</select>
                              	 	</div>
                               		
                                    <div class="filter-form-item col-md-3 col-sm-12">
                                        <select class="form-select" name="majorName" aria-label="Default select example" >
										  	<option selected = "selected" value="">Chọn chuyên ngành</option>
											<option value="Kinh doanh">Kinh doanh</option>
											<option value="Bán hàng">Bán hàng</option>
											<option value="Chăm sóc khách hàng">Chăm sóc khách hàng</option>
											<option value="Tài chính/Kế toán/Kiểm toán">Tài chính/Kế toán/Kiểm toán</option>
											<option value="Hành chính/Thư ký/Trợ lý">Hành chính/Thư ký/Trợ lý</option>
											<option value="Lao động phổ thông">Lao động phổ thông</option>
											<option value="Cơ khí/Kĩ thuật ứng dụng">Cơ khí/Kĩ thuật ứng dụng</option>
											<option value="Sinh viên/Mới tốt nghiệp/Thực tập">Sinh viên/Mới tốt nghiệp/Thực tập</option>
											<option value="Điện/Điện tử/Điện lạnh">Điện/Điện tử/Điện lạnh</option>
											<option value="Báo chí/Biên tập viên">Báo chí/Biên tập viên</option>
											<option value="Bảo vệ/Vệ sĩ/An ninh">Bảo vệ/Vệ sĩ/An ninh</option>
											<option value="Bất động sản">Bất động sản</option>
											<option value="Biên dịch/Phiên dịch">Biên dịch/Phiên dịch</option>
											<option value="Bưu chính viễn thông">Bưu chính viễn thông</option>
											<option value="Công nghệ thông tin">Công nghệ thông tin</option>
											<option value="Dầu khí/Địa chất">Dầu khí/Địa chất</option>
											<option value="Dệt may">Dệt may</option>
											<option value="Du lịch/Nhà hàng/Khách sạn">Du lịch/Nhà hàng/Khách sạn</option>
											<option value="Dược/Hóa chất/Sinh hóa">Dược/ Hóa chất/Sinh hóa</option>
											<option value="Giải trí/Vui chơi">Giải trí/Vui chơi</option>
											<option value="Giáo dục/Đào tạo/Thư viện">Giáo dục/Đào tạo/Thư viện</option>
											<option value="Giao thông/Vận tải/Thủy lợi/Cầu đường">Giao thông/Vận tải/Thủy lợi/Cầu đường</option>
											<option value="Giày da/Thuộc da">Giày da/Thuộc da</option>
											<option value="Khác">Khác</option>
											<option value="Kho vận/Vật tư/Thu mua">Kho vận/Vật tư/Thu mua</option>
											<option value="Khu chế xuất/Khu công nghiệp">Khu chế xuất/Khu công nghiệp</option>
											<option value="Kiến trúc/Nội thất">Kiến trúc/ Nộithất</option>
											<option value="Làm đẹp/Thể lực/Spa">Làm đẹp/ Thểlực/ Spa</option>
											<option value="Luật/Pháp lý">Luật/Pháp lý</option>
											<option value="Môi trường/Xử lý chất thải">Môitrường/ Xử lý chất thải</option>
											<option value="Mỹ phẩm/Thời trang/Trang sức">Mỹphẩm/ Thời trang/Trang sức</option>
											<option value="Ngân hàng/Chứng khoán/Đầu tư">Ngânhàng/ Chứng khoán/Đầu tư</option>
											<option value="Nghệ thuật/Điện ảnh">Nghệ thuật/ Điện ảnh</option>
											<option value="Ngoại ngữ">Ngoại ngữ</option>
											<option value="Nhân sự">Nhân sự</option>
											<option value="Nông/Lâm/Ngư nghiệp">Nông/Lâm/Ngư nghiệp</option>
											<option value="PG/PB/Lễ tân">PG/PB/Lễ tân</option>
											<option value="Phát triển thị trường">Phát triển thị trường</option>
											<option value="Phục vụ/Tạp vụ/Giúp việc">Phục vụ/Tạp vụ/Giúp việc</option>
											<option value="Quan hệ đối ngoại">Quan hệ đối ngoại</option>
											<option value="Quản lý điều hành">Quản lý điều hành</option>
											<option value="Quảng cáo/Marketing/PR">Quảng cáo/Marketing/PR</option>
											<option value="Sản xuất/Vận hành sản xuất">Sản xuất/Vận hành sản xuất</option>
											<option value="Tài xế/Lái xe/Giao nhận">Tài xế/Lái xe/Giao nhận</option>
											<option value="Thẩm định/Giám định/Quản lý chất lượng">Thẩm định/Giám định/Quản lý chất lượng</option>
											<option value="Thể dục/Thể thao">Thể dục/Thể thao</option>
											<option value="Thiết kế/Mỹ thuật">Thiết kế/Mỹ thuật</option>
											<option value="Thời vụ/Bán thời gian">Thời vụ/Bán thời gian</option>
											<option value="Thực phẩm/DV ăn uống">Thực phẩm/DV ăn uống</option>
											<option value="Trang thiết bị công nghiệp">Trang thiết bị công nghiệp</option>
											<option value="Trang thiết bị gia dụng">Trang thiết bị gia dụng</option>
											<option value="Trang thiết bị văn phòng">Trang thiết bị văn phòng</option>
											<option value="Tư vấn bảo hiểm">Tư vấn bảo hiểm</option>
											<option value="Xây dựng">Xây dựng</option>
											<option value="Xuất-Nhập khẩu/Ngoại thương">Xuất-Nhập khẩu/Ngoại thương</option>
											<option value="Y tế">Y tế</option>
										</select>
                              	 	</div>
                                    <div class="filter-form-item col-md-3 col-sm-12">
                                        <select class="form-select" name="experience" aria-label="Default select example">
										  			<option value="">Chọn kinh nghiệm</option>
													<option value="Chưa có kinh nghiệm">Chưa có kinh nghiệm</option>
													<option value="Dưới 1 năm">Dưới 1 năm</option>
													<option value="1 năm">1 năm</option>
													<option value="2 năm">2 năm</option>
													<option value="3 năm">3 năm</option>
													<option value="4 năm">4 năm</option>
													<option value="5 năm">5 năm</option>
													<option value="Trên 5 năm">Trên 5 năm</option>
													<option value="Không yêu cầu kinh nghiệm">Không yêu cầu kinh nghiệm</option>
										</select>
                              	 	</div>
                                    <div class="filter-form-item col-md-3 col-sm-12">
                                        <select class="form-select" name="jobType" aria-label="Default select example">
										  			<option value="">Chọn hình thức làm việc</option>
													<option value="Nhân viên chính thức">Nhân viên chính thức</option>
													<option value="Nhân viên thời vụ">Nhân viên thời vụ</option>
													<option value="Bán thời gian">Bán thời gian</option>
													<option value="Toàn thời gian">Toàn thời gian</option>
													<option value="Làm thêm ngoài giờ">Làm thêm ngoài giờ</option>
													<option value="Thực tập và dự án">Thực tập và dự án</option>
										</select>
	                              	 </div>
	                	 		</div>
                         	
                             </div>
                    	</div>
                   </div>
                </div>
	       </div> <!-- filter bar -->
	          </div>
	        </form>  
	      </div>
	      <!-- (end) content tab -->
	    </div>
	    </div>
	  </div>
	</div>
	<!-- (end) search section -->
	
	
	
	<div class="container-fluid">
	  <div class="container search-wrapper">
	    <div class="row">
	      
	    <div class="col-md-12 col-sm-12 col-12">
	      <h4 class="search-find">Tìm thấy ${jobPostings.size()} việc làm đang tuyển dụng</h4>
	      <div class="job-board-wrap">
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
			</div>
	      </div>
	      
	    </div>
	    </div>
	  </div>
	</div>

	<!-- job support -->
<div class="container-fluid job-support-wrapper">
 <div class="container-fluid job-support-wrap">
  <div class="container job-support">
    <div class="row">
      <div class="col-md-6 col-sm-12 col-12">
        <ul class="spp-list">
          <li>
            <span><i class="fa fa-question-circle pr-2 icsp"></i>Hỗ trợ nhà tuyển dụng:</span>
          </li>
          <li>
            <span><i class="fa fa-phone pr-2 icsp"></i>0123.456.789</span>
          </li>
        </ul>
      </div>
      <div class="col-md-6 col-sm-12 col-12">
        <div class="newsletter">
            <span class="txt6">Đăng ký nhận bản tin việc làm</span>
            <div class="input-group frm1">
              <input type="text" placeholder="Nhập email của bạn" class="newsletter-email form-control">
              <a href="#" class="input-group-addon"><i class="fa fa-lg fa-envelope-o colorb"></i></a>
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
        <p class="footer-content">
          Discover the best way to find houses, condominiums, apartments and HDBs for sale and rent in Singapore with JobsOnline, Singapore's Fastest Growing Jobs Portal.
        </p>
        <ul class="footer-contact">
          <li>
            <a href="#">
              <i class="fa fa-phone fticn"></i> +123 456 7890
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-envelope fticn"></i> 
              hello@123.com
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-map-marker fticn"></i>
              33 Xô Viết Nghệ Tĩnh, Đà Nẵng
            </a>
          </li>
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

	<!-- Optional JavaScript -->
	
	<script type="text/javascript">
	                        window.onload = function() {screenCollapse()};
	
	                        let ele = document.getElementsByClassName("collapse");
	
	                        function screenCollapse() { 
	                            if(window.innerWidth < 720) {
	                                $(".collapse").removeClass("show");
	                                $(".collapse").addClass("hide");
	                            }
	                        }
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
	                   
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- Owl Stylesheets Javascript -->
	<script src="/user/js/owlcarousel/owl.carousel.js"></script>
	<!-- Read More Plugin -->
</body>
</html>