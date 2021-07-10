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
        <link href="./css/common_css.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
    <div class="header">
        <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
        <div class="header-right">
            <a href="user" class="active">Trang chủ</a>
            <a href="attendreport">Báo Cáo Điểm Danh</a>
            <a href="userdetails">Thông tin cá nhân</a>
            <a href="viewapplication">Xem đơn</a>
            <a href="application">Báo Nghỉ</a>
            <a href="LogOutController">Log out(${sessionScope.congnhan.name})</a>           
        </div>
    </div>
   <img src="img/home1.jpg" alt=""/>
    <footer>
           <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
