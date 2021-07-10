<%-- 
    Document   : chamcong
    Created on : Feb 27, 2021, 3:22:08 PM
    Author     : congfptu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website Chấm Công</title>
        <script>
            function submitForm()
            {
                document.getElementById("table_time").submit();
            }
        </script>
        <link href="./css/home.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">

                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="#" class="nav-link px-2 text-secondary">Trang Chủ</a></li>
                        <li><a href="quanlicongtrinh" class="nav-link px-2 text-white">Chấm Công</a></li>
                        <li><a href="thongke" class="nav-link px-2 text-white">Bảng chấm công</a></li>
                        <li><a href="applicationprocessing" class="nav-link px-2 text-white">Xử Lí Đơn từ</a></li>
                        <li><a href="changesalary" class="nav-link px-2 text-white">Thay đổi Lương</a></li>
                        <li><a href="viewsalary" class="nav-link px-2 text-white">Lương</a></li>
                    </ul>
                    <div class="text-end">

                        <a href="LogOutController" class="btn btn-warning">Đăng Xuất(${sessionScope.account.username})</a>
                    </div>
                </div>
            </div>
        </header>
        <img src="img/congnhan.jpg" />

        <!-- Site footer -->
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <p class="text-justify">qlxdhathanh.com  is an initiative  to help the upcoming programmers with the code. Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple. We will help programmers build up concepts in different programming languages that include C, C++, Java, HTML, CSS, Bootstrap, JavaScript, PHP, Android, SQL and Algorithm.</p>
                </div> 
                <hr>
            </div>
            <div class="container">

                <div class="row">

                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Địa Chỉ: SN17-Đường Hà Hoàng-Thành phố Hà Tĩnh-Tỉnh Hà Tĩnh. Mọi chi tiết xin liên hệ vào số điện thoại: 0337177679 
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
