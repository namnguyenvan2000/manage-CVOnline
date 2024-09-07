<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>TechJobs</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Roboto Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&display=swap" rel="stylesheet">

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
</head>
<body>
<!-- main nav -->
<div class="container-fluid fluid-nav another-page">
  <div class="container cnt-tnar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light tjnav-bar">
  <!-- <a class="navbar-brand" href="#">Navbar</a> -->
  <a href="#" class="nav-logo">
    <img src="/user/img/techjobs_bgw.png">
  </a>
  <button class="navbar-toggler tnavbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <!-- <span class="navbar-toggler-icon"></span> -->
    <i class="fa fa-bars icn-res" aria-hidden="true"></i>

  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto tnav-left tn-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Việc Làm IT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Tin Tức</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu tdropdown" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <ul class="navbar-nav mr-auto my-2 my-lg-0 tnav-right tn-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i> <span class="hidden-text">Tìm kiếm</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Đăng Ký</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Đăng Nhập</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          VI
        </a>
        <div class="dropdown-menu tdropdown" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">English</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link btn-employers" href="#" tabindex="-1" aria-disabled="true" style="color: #fff!important">Nhà Tuyển Dụng</a>
      </li>
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
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/UploadLogo/${job.jobPosting.employer.logo}" class="job-logo-ima" alt="job-logo">
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
                    	- <c:out value="${fn:replace(job.benefits, '.', '<br> <br> -')}" escapeXml="false"/>
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
				<span>- <c:out value="${fn:replace(job.jobDescription, '.', '<br> <br> -')}" escapeXml="false"/></span>
          </div>
          <h2 class="widget-title">
            <span>Yêu cầu công việc</span>
          </h2>
          <div class="jd-content">
          <span>- <c:out value="${fn:replace(job.jobRequirements, '.', '<br> <br> -')}" escapeXml="false"/></span>
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
                  <span class="ji-title">Cấp bậc:</span>
                </div>
                <div class="col-sm-8">
                  <span class="ji-main">${job.jobVacancy }</span>
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
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/UploadLogo/${job.jobPosting.employer.logo}" class="job-logo-ima" alt="job-logo">
            </a>
          </div>
            <h2 class="company-intro-name">${job.jobPosting.employer.namecompany }</h2>
            <ul class="job-add">
              <li>
                <i class="fa fa-map-marker ja-icn"></i>
                <span>${job.jobPosting.employer.address }</span>
              </li>
              <li>
                <i class="fa fa-bar-chart ja-icn"></i>
                <span>Quy mô công ty: ${job.jobPosting.employer.introduction }</span>
              </li>
            </ul>

            <div class="wrap-comp-info mb-2">
              <a href="#" class="btn btn-primary btn-company">Xem thêm</a>
            </div>
            </c:forEach>
        </div>

         <div class="side-bar mb-3">
          <h2 class="widget-title">
            <span>Việc làm tương tự</span>
          </h2>
          
          <div class="job-tt-contain">
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>

            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/fpt-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  [HCM] 02 Solution Architects–Up to $2000
                </a>
                <a href="#" class="company">
                  FPT Software
                </a>
              </div>
            </div>
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>
            <div class="job-tt-item">
              
                <a href="#" class="thumb">
                  <div style="background-image: url(/user/img/alipay-logo.png);"></div>
                </a>
              
              <div class="info">
                <a href="#" class="jobname">
                  Fullstack .NET Developer (Angular/React)
                </a>
                <a href="#" class="company">
                  Alipay Software
                </a>
              </div>
            </div>

          </div>
        </div>

        <div class="side-bar mb-3">

      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="home-ads">
              <a href="#">
                <img src="/user/img/ads1.jpg">
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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/user/js/readmore.js"></script>
    <script type="text/javascript">
      $('.catelog-list').readmore({
        speed: 75,
        maxHeight: 150,
        moreLink: '<a href="#">Xem thêm<i class="fa fa-angle-down pl-2"></i></a>',
        lessLink: '<a href="#">Rút gọn<i class="fa fa-angle-up pl-2"></i></a>'
      });
    </script>
<!-- Optional JavaScript -->
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

    

</body>
</html>