<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <a href="/index"><h2 class="logo"><strong>Tech</strong> Jobs <div class="xmark"><i class="fa-solid fa-square-xmark"></i></div></h2></a>
        <ul class="fixednav">
            <li><a href="/admin/index"><i class="fa-solid fa-chart-line beside"></i> Trang chủ</a></li>
            <li><a href="/admin/nhatuyendung" ><i class="fa-solid fa-briefcase beside"></i> Nhà tuyển dụng</a></li>
            <li><a href="/admin/tintuyendung" class="current"><i class="fa-brands fa-wpforms beside"></i> Tin tuyển dụng</a></li>
            <li><a href="/admin/tinhethan"><i class="fa-brands fa-wpforms beside"></i> Tin hết hạn</a></li>
            <li><a href="/admin/ungvien" class="userbtn"><i class="fa-solid fa-user beside"></i> Ứng viên</a></li>   
            <li><a href="/admin/thongtin"><i class="fa-solid fa-gear"></i> Cài đặt</a></li>
            <li><a href="/admin/dangxuat"><i class="fa-solid fa-right-from-bracket beside"></i> Đăng xuất</a></li>
        </ul>
    </nav>
    <section class="rightsection">
        <h2><div class="menubar"><i class="fa-solid fa-bars menuicon"></i></div> Welcome Admin</h2>
        <div class="changestatussection">
            <form action="/admin/tintuyendung/update-status" method="post" class="changestatusform">
                <h3>Đổi trạng thái</h3>
                <input type="hidden" name="id" value="${jobs_posting.id}">
                <span>Tiêu đề tuyển dụng</span>
                <input type="text" name="" id="" value="${jobs_posting.jobTitle}" disabled>
                <span>Chuyên ngành</span>
                <input type="text" name="" id="" value="${jobs_posting.majorName}" disabled>
                <span>Trạng thái</span>
                <select name="status" id="">
                    <option value="Còn hạn" ${job_posting.status == 'Còn hạn' ? 'selected' : ''}>Còn hạn</option>
                    <option value="Đủ số lượng" ${job_posting.status == 'Đủ số lượng' ? 'selected' : ''}>Đủ số lượng</option>
                    <option value="Đã hết hạn" ${job_posting.status == 'Đã hết hạn' ? 'selected' : ''}>Đã hết hạn</option>
                </select>
                <button type="submit">Cập nhật</button>
            </form>
            
            <td>
                                <form action="/admin/tintuyendung/update-status" method="post">
                                    <input type="hidden" name="id" value="${job.id}">
                                    <input type="hidden" name="status" value="Đủ số lượng">
                                    <button type="submit">Chuyển trạng thái</button>
                                </form>
                            </td>
            
        </div>
    </section>
    <script src="/admin/Script/indexadmin.js"></script>
</body>
</html>
