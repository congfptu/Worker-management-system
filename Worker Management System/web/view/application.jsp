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
       
        </script>
        <link href="./css/edit.css" rel="stylesheet" type="text/css"/>
    </head>
<body>
     <div class="header">
        <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
        <div class="header-right">
            <a href="user" >Trang chủ</a>
            <a href="attendreport">Báo Cáo Điểm Danh</a>
            <a href="userdetails">Thông tin cá nhân</a>
            <a href="viewapplication">Xem Đơn</a>
            <a href="application" class="active">Báo Nghỉ</a>
            <a href="LogOutController">Log out(${sessionScope.congnhan.name})</a>           
        </div>
    </div>
        <div class="application">
        <h2>Đơn xin nghỉ làm</h2>
        <h5 style="font-style: italic">Lưu ý:Đơn sẽ được trả lời sau ít nhất 24h! Vui lòng kiểm tra ở mục xem đơn để biết thêm chi tiết về tình trạng đơn của mình !
         </h5>
        <form action="application" method="POST">
            <textarea name="content" rows="8" cols="50" placeholder="Lí do xin nghỉ" required=""></textarea>
        <br>    
        <input type="submit" value="Gửi Đơn">
       </form>
        </div>
      
            <p style="color:green">${mess}</p>
    <footer>
           <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
