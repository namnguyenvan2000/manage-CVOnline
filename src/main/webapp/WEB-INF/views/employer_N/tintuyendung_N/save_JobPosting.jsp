<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<a class="dropdown-item" href="/employer/profile-employer">Thông tin cá nhân</a>
                                <a class="dropdown-item" href="/employer/recruitment-management">Tin tuyển dụng đã đăng</a>
                                <a class="dropdown-item" href="#">Xem ứng viên đã ứng tuyển</a> 
                                <a
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
				<li class="nav-item active"><a class="nav-link"
					href="/employer/profile_employer">Thông tin cá nhân</a></li>
				<li class="nav-item"><a class="nav-link" href="/employer/recruitment-management">Tin tuyển
						dụng đã đăng</a></li>
				<li class="nav-item"><a class="nav-link" href="/employer/candidate-management">Xem ứng
						viên đã ứng tuyển</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/employer/change-password-employer">Đổi mật khẩu</a></li>
			</ul>
			<ul class="rec-nav-right">
					<li class="nav-item"><a class="nav-link"
					href="#">Đăng tin</a></li>
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
	<div class="container-fluid published-recuitment-wrapper">
		<div class="container published-recuitment-content">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-12 recuitment-inner">
					<form class="recuitment-form" action="/employer/save_Job-posting"
						method="post">

						<div class="accordion" id="accordionExample">
							<div class="card recuitment-card">
								<div class="card-header recuitment-card-header" id="headingOne">
									<h2 class="mb-0">
										<a class="btn btn-link btn-block text-left recuitment-header"
											type="button" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne"> Tin tuyển dụng <span
											id="clickc1_advance2" class="clicksd"> <i
												class="fa fa fa-angle-up"></i>
										</span>
										</a>
									</h2>
								</div>

								<div id="collapseOne" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body recuitment-body">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Tiêu
												đề<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="jobTitle" id="jobTitle" type="text"
													class="form-control" placeholder="Nhập tiêu đề">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Nơi
												làm việc</label>
											<div class="col-sm-9">
												<select type="text" class="form-control" name="jobLocation"
													id="jobLocation">
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
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Chuyên
												ngành</label>
											<div class="col-sm-9">
												<select type="text" class="form-control" name="majorName"
													id="majorName">
													<option selected="selected" value="">Chọn chuyên
														ngành</option>
													<option value="Kinh doanh">Kinh doanh</option>
													<option value="Bán hàng">Bán hàng</option>
													<option value="Chăm sóc khách hàng">Chăm sóc khách
														hàng</option>
													<option value="Tài chính/Kế toán/Kiểm toán">Tài
														chính/Kế toán/Kiểm toán</option>
													<option value="Hành chính/Thư ký/Trợ lý">Hành
														chính/Thư ký/Trợ lý</option>
													<option value="Lao động phổ thông">Lao động phổ
														thông</option>
													<option value="Cơ khí/Kĩ thuật ứng dụng">Cơ khí/Kĩ
														thuật ứng dụng</option>
													<option value="Sinh viên/Mới tốt nghiệp/Thực tập">Sinh
														viên/Mới tốt nghiệp/Thực tập</option>
													<option value="Điện/Điện tử/Điện lạnh">Điện/Điện
														tử/Điện lạnh</option>
													<option value="Báo chí/Biên tập viên">Báo chí/Biên
														tập viên</option>
													<option value="Bảo vệ/Vệ sĩ/An ninh">Bảo vệ/Vệ
														sĩ/An ninh</option>
													<option value="Bất động sản">Bất động sản</option>
													<option value="Biên dịch/Phiên dịch">Biên
														dịch/Phiên dịch</option>
													<option value="Bưu chính viễn thông">Bưu chính
														viễn thông</option>
													<option value="Công nghệ thông tin">Công nghệ
														thông tin</option>
													<option value="Dầu khí/Địa chất">Dầu khí/Địa chất</option>
													<option value="Dệt may">Dệt may</option>
													<option value="Du lịch/Nhà hàng/Khách sạn">Du
														lịch/Nhà hàng/Khách sạn</option>
													<option value="Dược/Hóa chất/Sinh hóa">Dược/Hóa
														chất/Sinh hóa</option>
													<option value="Giải trí/Vui chơi">Giải trí/Vui
														chơi</option>
													<option value="Giáo dục/Đào tạo/Thư viện">Giáo
														dục/Đào tạo/Thư viện</option>
													<option value="Giao thông/Vận tải/Thủy lợi/Cầu đường">Giao
														thông/Vận tải/Thủy lợi/Cầu đường</option>
													<option value="Giày da/Thuộc da">Giày da/Thuộc da</option>
													<option value="Khác">Khác</option>
													<option value="Kho vận/Vật tư/Thu mua">Kho vận/Vật
														tư/Thu mua</option>
													<option value="Khu chế xuất/Khu công nghiệp">Khu
														chế xuất/Khu công nghiệp</option>
													<option value="Kiến trúc/Nội thất">Kiến trúc/Nội
														thất</option>
													<option value="Làm đẹp/Thể lực/Spa">Làm đẹp/Thể
														lực/Spa</option>
													<option value="Luật/Pháp lý">Luật/Pháp lý</option>
													<option value="Môi trường/Xử lý chất thải">Môi
														trường/Xử lý chất thải</option>
													<option value="Mỹ phẩm/Thời trang/Trang sức">Mỹ
														phẩm/Thời trang/Trang sức</option>
													<option value="Ngân hàng/Chứng khoán/Đầu tư">Ngân
														hàng/Chứng khoán/Đầu tư</option>
													<option value="Nghệ thuật/Điện ảnh">Nghệ
														thuật/Điện ảnh</option>
													<option value="Ngoại ngữ">Ngoại ngữ</option>
													<option value="Nhân sự">Nhân sự</option>
													<option value="Nông/Lâm/Ngư nghiệp">Nông/Lâm/Ngư
														nghiệp</option>
													<option value="PG/PB/Lễ tân">PG/PB/Lễ tân</option>
													<option value="Phát triển thị trường">Phát triển
														thị trường</option>
													<option value="Phục vụ/Tạp vụ/Giúp việc">Phục
														vụ/Tạp vụ/Giúp việc</option>
													<option value="Quan hệ đối ngoại">Quan hệ đối
														ngoại</option>
													<option value="Quản lý điều hành">Quản lý điều
														hành</option>
													<option value="Quảng cáo/Marketing/PR">Quảng
														cáo/Marketing/PR</option>
													<option value="Sản xuất/Vận hành sản xuất">Sản
														xuất/Vận hành sản xuất</option>
													<option value="Tài xế/Lái xe/Giao nhận">Tài xế/Lái
														xe/Giao nhận</option>
													<option value="Thẩm định/Giám định/Quản lý chất lượng">Thẩm
														định/Giám định/Quản lý chất lượng</option>
													<option value="Thể dục/Thể thao">Thể dục/Thể thao</option>
													<option value="Thiết kế/Mỹ thuật">Thiết kế/Mỹ
														thuật</option>
													<option value="Thời vụ/Bán thời gian">Thời vụ/Bán
														thời gian</option>
													<option value="Thực phẩm/DV ăn uống">Thực phẩm/DV
														ăn uống</option>
													<option value="Trang thiết bị công nghiệp">Trang
														thiết bị công nghiệp</option>
													<option value="Trang thiết bị gia dụng">Trang
														thiết bị gia dụng</option>
													<option value="Trang thiết bị văn phòng">Trang
														thiết bị văn phòng</option>
													<option value="Tư vấn bảo hiểm">Tư vấn bảo hiểm</option>
													<option value="Xây dựng">Xây dựng</option>
													<option value="Xuất-Nhập khẩu/Ngoại thương">Xuất-Nhập
														khẩu/Ngoại thương</option>
													<option value="Y tế">Y tế</option>
												</select>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Hạn
												nộp hồ sơ<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<input name="dealine" id="dealine" type="date"
													class="form-control" placeholder="Nhập nơi làm việc">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card recuitment-card">
								<div class="card-header recuitment-card-header" id="heading4">
									<h2 class="mb-0">
										<a
											class="btn btn-link btn-block text-left collapsed recuitment-header"
											type="button" data-toggle="collapse" data-target="#collapse4"
											aria-expanded="false" aria-controls="collapse4"> Chi tiết
											tin tuyển dụng <span id="clickc1_advance4" class="clicksd">
												<i class="fa fa fa-angle-up"></i>
										</span>
										</a>
									</h2>
								</div>
								<div id="collapse4" class="collapse show"
									aria-labelledby="heading4" data-parent="#collapse4">
									<div class="card-body recuitment-body">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Số
												lượng cần tuyển</label>
											<div class="col-sm-9">
												<input name="quanlity" id="quanlity" type="number"
													class="form-control" placeholder="1">
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Mô
												tả công việc<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<textarea name="jobDescription" id="jobDescription"
													type="text" class="form-control"
													placeholder="Nhập mô tả công việc" rows="5"></textarea>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Yêu
												cầu công việc<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<textarea name="jobRequirements" id="jobRequirements"
													type="text" class="form-control"
													placeholder="Nhập yêu cầu công việc" rows="5"></textarea>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Kinh
												nghiệm<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<select name="experience" id="experience" type="text"
													class="form-control">
													<option selected="selected" value="">Chọn kinh
														nghiệm</option>
													<option value="Chưa có kinh nghiệm">Chưa có kinh
														nghiệm</option>
													<option value="Dưới 1 năm">Dưới 1 năm</option>
													<option value="1 năm">1 năm</option>
													<option value="2 năm">2 năm</option>
													<option value="3 năm">3 năm</option>
													<option value="4 năm">4 năm</option>
													<option value="5 năm">5 năm</option>
													<option value="Trên 5 năm">Trên 5 năm</option>
													<option value="Không yêu cầu kinh nghiệm">Không
														yêu cầu kinh nghiệm</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Mức
												lương<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<select name="salary" id="salary" type="text"
													class="form-control">
													<option selected="selected" value="">Chọn mức
														lương</option>
													<option value="Dưới 3 triệu">Dưới 3 triệu</option>
													<option value="3-5 triệu">3-5 triệu</option>
													<option value="5-7 triệu">5-7 triệu</option>
													<option value="7-10 triệu">7-10 triệu</option>
													<option value="10-12 triệu">10-12 triệu</option>
													<option value="12-15 triệu">12-15 triệu</option>
													<option value="15-20 triệu">15-20 triệu</option>
													<option value="20-25 triệu">20-25 triệu</option>
													<option value="25-30 triệu">25-30 triệu</option>
													<option value="30-40 triệu">30-40 triệu</option>
													<option value="40-50 triệu">40-50 triệu</option>
													<option value="Trên 50 triệu">Trên 50 triệu</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Hình
												thức làm việc<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<select name="jobType" 
													class="form-control">
													<option selected="selected" value="">Chọn hình
														thức làm việc</option>
													<option value="Nhân viên chính thức">Nhân viên
														chính thức</option>
													<option value="Nhân viên thời vụ">Nhân viên thời
														vụ</option>
													<option value="Bán thời gian">Bán thời gian</option>
													<option value="Làm thêm ngoài giờ">Làm thêm ngoài
														giờ</option>
													<option value="Thực tập và dự án">Thực tập và dự
														án</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label text-right label">Quyền
												lợi<span style="color: red" class="pl-2">*</span>
											</label>
											<div class="col-sm-9">
												<textarea name="benefits" id="benefits" type="text"
													class="form-control" placeholder="Quyền lợi công việc"
													rows="5"></textarea>
											</div>
										</div>
										<c:if test="${not empty error}">
											<p class="text-danger mt-3 text-center">${error}</p>
										</c:if>



									</div>
								</div>
							</div>
						</div>
						<div class="rec-submit">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn-submit-recuitment" name="">
								<i class="fa fa-floppy-o pr-2"></i>Lưu Tin
							</button>
						</div>
					</form>

				</div>
				<!-- Side bar -->
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