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
    <link href="../css/edit.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="header">
        <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
        <div class="header-right">
            <a href="user" class="active">Trang chủ</a>
            <a href="attendreport">Báo Cáo Điểm Danh</a>
            <a href="userdetails">Thông tin cá nhân</a>
            <a href="viewapplication">Xem Đơn</a>
            <a href="application">Báo Nghỉ</a>
            <a href="LogOutController">Log out(${sessionScope.congnhan.name})</a>           
        </div>
    </div>
        <h3>Chỉnh sửa thông tin cá nhân</h3 >
        <div style="border:1px solid; width:250px; margin-left:50px; padding:10px; border-radius: 10px;">
        <form action="edituserdetails" method="POST">
        <br>
        Họ Tên: <br>
        <input type="text" name="name" value="${sessionScope.congnhan.name}" required=""> <br>
        Địa Chỉ: <br>
        <input type="text" name="address" value="${sessionScope.congnhan.address}"required=""> <br>
        Ngày Sinh: <br>
        <input type="date" name="dob" value="${sessionScope.congnhan.dob}"required=""><br>
        Giới Tính: <br>
        <select name="gender">
            <option value="1"
                    <c:if test="${sessionScope.congnhan.gender}"> selected="selected" </c:if>      >
              
                Nam
            </option >
            <option value="0"   <c:if test="${!sessionScope.congnhan.gender}"> selected="selected" </c:if>     >
                Nữ
            </option>
        </select>     
                <br>
                <br>
                <input type="submit" value="Lưu" style="background-color:#00cc33">
                <p style="color:green">${mess}</p>
           </form>
           </div>
           <footer>
           <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
