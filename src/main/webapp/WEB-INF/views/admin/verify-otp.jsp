<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>Xác nhận OTP</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="/user/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<body class="d-flex align-items-center justify-content-center min-vh-100 bg-light">
    <div class="card p-4 shadow-sm" style="max-width: 400px; width: 100%;">
        <h1 class="text-center mb-4">Xác nhận OTP</h1>
        <form action="${pageContext.request.contextPath}/public/verifyOtp" method="post">
            <input type="hidden" name="email" value="${email}">
            <div class="mb-3">
                <label for="otp" class="form-label">Nhập mã OTP:</label>
                <input type="text" id="otp" name="otp" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Xác nhận</button>
        </form>
        <c:if test="${not empty error}">
            <p class="text-danger mt-3 text-center">${error}</p>
        </c:if>
        <!--
        <p>Account: ${sessionAccount}</p>
<p>Applicant: ${sessionApplicant}</p>
<p>Employer: ${sessionEmployer}</p>-->
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>


