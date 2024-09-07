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
			<li><a href="/admin/nhatuyendung"><i
					class="fa-solid fa-briefcase beside"></i> Nhà tuyển dụng</a></li>
			<li><a href="/admin/tintuyendung" class="joblistbtn"><i
					class="fa-brands fa-wpforms beside"></i> Tin tuyển dụng</a></li>
			<li><a href="/admin/tinhethan"><i
					class="fa-brands fa-wpforms beside"></i> Tin hết hạn</a></li>
			<li><a href="#" class="current"><i
					class="fa-solid fa-user beside"></i> Thành viên</a></li>
			<li><a href="/logout"><i
					class="fa-solid fa-right-from-bracket beside"></i> Đăng xuất</a></li>
		</ul>
	</nav>
    <section class="rightsection">
        <h2><div class="menubar"><i class="fa-solid fa-bars menuicon"></i></div> Welcome Admin</h2>
        <div class="rightbottomsection">
            <div class="rightbottomsmallsection">
                <h3>Thông tin thành viên</h3>
                <table class="admintable">
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Email</th>
							<th>SĐT</th>
							<th>Vai Trò</th>
							<th colspan="3"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="account" items="${employerAccounts}">
							<tr>
								<td>${account.id}</td>
								<td>${account.employer.namecompany}</td>
								<td>${account.email}</td>
								<td>${account.employer.phone}</td>
								<td>${account.role.nameRole}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="admintable">
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Email</th>
							<th>SĐT</th>
							<th>Vai Trò</th>
							<th colspan="3"></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="account" items="${applicantAccounts}">
							<tr>
								<td>${account.id}</td>
								<td>${account.applicant.fullname}</td>
								<td>${account.email}</td>
								<td>${account.applicant.phone}</td>
								<td>${account.role.nameRole}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	
            </div>
        </div>
    </section>
</body>
</html>