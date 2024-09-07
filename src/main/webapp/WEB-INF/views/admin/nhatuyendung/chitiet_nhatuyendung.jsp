<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/admin/CSS/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" integrity="sha512-uKQ39gEGiyUJl4AI6L+ekBdGKpGw4xJ55+xyJG7YFlJokPNYegn9KwQ3P8A7aFQAUtUsAQHep+d/lrGqrbPIDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    
    <nav class="navbar">
		<a href="/public/index"><h2 class="logo">
				<strong>Tech</strong> Jobs
				<div class="xmark">
					<i class="fa-solid fa-square-xmark"></i>
				</div>
			</h2></a>
		<ul class="fixednav">
			<li><a href="/admin/index" ><i
					class="fa-solid fa-chart-line beside"></i> Trang chủ</a></li>
			<li><a href="/admin/nhatuyendung" class="current"><i
					class="fa-solid fa-briefcase beside"></i> Nhà tuyển dụng</a></li>
			<li><a href="/admin/tintuyendung" class="joblistbtn"><i
					class="fa-brands fa-wpforms beside"></i> Tin tuyển dụng</a></li>
			<li><a href="/admin/tinhethan"><i
					class="fa-brands fa-wpforms beside"></i> Tin hết hạn</a></li>
			<li><a href="/admin/thanhvien" class="userbtn"><i
					class="fa-solid fa-user beside"></i> Thành viên</a></li>
			<li><a href="/logout"><i
					class="fa-solid fa-right-from-bracket beside"></i> Đăng xuất</a></li>
		</ul>
	</nav>
    <section class="rightsection">
        <h2><div class="menubar"><i class="fa-solid fa-bars menuicon"></i></div> Welcome Admin</h2>
        <div class="rightbottomsectionedited">
            
                <section class="vacancydetailbigbox">
                    <div class="vacancydetailleftbox">
                        <div class="vacancydetaillefttopbox">
                            <img src="${pageContext.request.contextPath}/images/${employer.logo}"alt="job-logo">
                            <div class="vacancydetaillefttoprightbox">
                                <h4>${employer.namecompany } <strong><i class="fa-solid fa-circle-check"></i></strong></h4>
                            </div>
                        </div>
                        <h3>Giới thiệu về công ty</h3>
                        <span>${employer.introduction }</span>
                    </div>
                    <div class="vacancydetailrightbox">
                        <div class="vacancydetailrightrow">
                            <div class="vacancydetailrightrowleft">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div class="vacancydetailrightrowright">
                                <h4>ĐỊA CHỈ</h4>
                                <span>${employer.address }</span>
                            </div>
                        </div>
                        <div class="vacancydetailrightrow">
                            <div class="vacancydetailrightrowleft">
                                <i class="fas fa-id-card"></i>
                            </div>
                            <div class="vacancydetailrightrowright">
                                <h4>MÃ SỐ THUẾ</h4>
                                <span>${employer.taxcode }</span>
                            </div>
                        </div>
                        <div class="vacancydetailrightrow">
                            <div class="vacancydetailrightrowleft">
                                <i class="fas fa-globe"></i>
                            </div>
                            <div class="vacancydetailrightrowright">
                                <h4>Website</h4>
                                <span>${employer.website }</span>
                            </div>
                        </div>
                    </div>
                </section>
            
        </div>
    </section>
    <script src="/admin/Script/indexadmin.js"></script>
</body>
</html>