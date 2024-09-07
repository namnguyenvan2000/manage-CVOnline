<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<li><a href="/admin/nhatuyendung"><i
					class="fa-solid fa-briefcase beside"></i> Nhà tuyển dụng</a></li>
			<li><a href="/admin/tintuyendung" class="joblistbtn"><i
					class="fa-brands fa-wpforms beside"></i> Tin tuyển dụng</a></li>
			<li><a href="#" class="current"><i
					class="fa-brands fa-wpforms beside" ></i> Tin hết hạn</a></li>
			<li><a href="/admin/thanhvien" class="userbtn"><i
					class="fa-solid fa-user beside"></i> Thành viên</a></li>
			<li><a href="/logout"><i
					class="fa-solid fa-right-from-bracket beside"></i> Đăng xuất</a></li>
		</ul>
	</nav>
    <section class="rightsection">
        <h2>
            <div class="menubar">
                <i class="fa-solid fa-bars menuicon"></i>
            </div>
            Welcome Admin
        </h2>
        <div class="rightbottomsection">
            <div class="rightbottomsmallsection">
                <h3>Tin tuyển dụng hết hạn</h3>
                <table class="admintable">
                    <tr>
                        <th>STT</th>
                        <th>Tiêu đề tuyển dụng</th>
                        <th>Chuyên ngành</th>
                        <th>Nơi làm việc</th>
                        <th>Ngày đăng</th>
                        <th>Hạn nộp hồ sơ</th>
                        <th>Trạng thái</th>
                        <th colspan="3"></th>
                    </tr>
                    <c:forEach var="job" items="${combined_jobs}">
                        <tr>
                            <td>${job.id}</td>
                            <td>${job.jobTitle}</td>
                            <td>${job.majorName}</td>
                            <td>${job.jobLocation}</td>
                            <td>${job.jobPostingDate}</td>
                            <td>${job.dealine}</td>
                            <td>${job.status}</td>
                            <td><a href="/admin/tinhethan/deleteID?id=${job.id}"><i class="fa-solid fa-trash"></i></a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </section>
    <script src="/admin/Script/indexadmin.js"></script>
</body>
</html>
