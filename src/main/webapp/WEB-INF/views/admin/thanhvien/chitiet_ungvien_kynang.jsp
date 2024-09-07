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
            <li><a href="/admin/tintuyendung" ><i class="fa-brands fa-wpforms beside"></i> Tin tuyển dụng</a></li>
            <li><a href="/admin/tinhethan"><i class="fa-brands fa-wpforms beside"></i> Tin hết hạn</a></li>
            <li><a href="/admin/thanhvien" class="current"><i class="fa-solid fa-user beside"></i> Ứng viên</a></li>   
            <li><a href="/admin/thongtin"><i class="fa-solid fa-gear"></i> Cài đặt</a></li>
            <li><a href="/admin/dangxuat"><i class="fa-solid fa-right-from-bracket beside"></i> Đăng xuất</a></li>
        </ul>
    </nav>  
    <section class="rightsection">
        <h2><div class="menubar"><i class="fa-solid fa-bars menuicon"></i></div> Welcome Admin</h2>
        <div class="rightbottomsection">
            <section class="profilebigbox">
                <div class="profilenav">
                    <h3>Hồ sơ Chris Ivan</h3>
                    <a href="./chitiet-hoso"><i class="fa-regular fa-pen-to-square picon"></i> Thông tin hồ sơ</a>
                    <a href="./chitiet-giaoduc-chungchi"><i class="fa-solid fa-book-open picon"></i> Học vấn & Chứng chỉ</a>
                    <a href="./chitiet-kynang"><i class="fa-regular fa-file picon"></i>Kỹ năng</a>
                    <a href="./chitiet-kinhnghiem"><i class="fa-solid fa-building-columns picon"></i> Kinh nghiệm</a>
                </div>
                <div class="educationcertificate">
                    <div class="educationbigbox">
                        <div class="educationtoprow">
                            <h2>Kỹ năng</h2>
                        </div>
                        <table class="educationbottomrow">
                            <tr>
                                <th>KỸ NĂNG</th>
                                <th>THÀNH THẠO</th>
                            </tr>
                            <tr>
                                <td>Coding</td>
                                <td>Junior</td>
                            </tr>
                        </table>
                    </div>
                    <div class="certificatebigbox">
                        <div class="certificatetoprow">
                            <h2>Ngôn ngữ</h2>
                        </div>
                        <table class="certificatebottomrow">
                            <tr>
                                <th>NGÔN NGỮ</th>
                                <th>THÀNH THẠO</th>
                            </tr>
                            <tr>
                                <td>Tiếng Anh</td>
                                <td>Ielts 6.5</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </section>
        </div>
    </section>
    <script src="/admin/Script/chitiet_ungvien.js"></script>
</body>
</html>