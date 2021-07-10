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
        <title>JSP Page</title>

        <link href="./css/edit.css" rel="stylesheet" type="text/css"/>
</head>
<body>
     <div class="header">
       
        <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
        <div class="header-right">
            <a href="user">Trang chủ</a>
            <a href="attendreport">Báo Cáo Điểm Danh</a>
            <a href="userdetails" class="active">Thông tin cá nhân</a>
            <a href="viewapplication">Xem Đơn</a>
            <a href="application">Báo Nghỉ</a>
            <a href="LogOutController">Log out(${sessionScope.congnhan.name})</a>           
        </div>
     </div>
        <div class="edit"> <img src="img/editt'.png" alt=""/></div>
        <a href="edituserdetails" style="color: black">Chỉnh sửa thông tin</a>
        <div class="left">
        <h2>Thông Tin Cá Nhân</h2> 
        <p>ID:${sessionScope.congnhan.id}</p> 
        
        <p>Họ Và Tên: ${sessionScope.congnhan.name}</p>
        
        <p>Địa Chỉ:${sessionScope.congnhan.address}</p>  
       
        <p>Ngày sinh:${sessionScope.congnhan.formatDob}</p>    
        
        <p>Giới Tính:${sessionScope.congnhan.genderString}</p>
         
            <p>Lương Hiện Tại:${sessionScope.congnhan.formatSalary}/ngày</p>         
    </div>
              
    <footer>
        <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
