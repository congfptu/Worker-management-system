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
            <a href="home" class="active">Trang chủ</a>
            <a href="quanlicongtrinh">Chấm Công</a>
            <a href="thongke">Bảng Thống Kê Công Trình</a>
            <a href="changesalary">Thay đổi lương</a>
            <a href="applicationprocessing">Xử Lí đơn từ</a>
             <a href="viewsalary">Lương</a>
             <a href="LogOutController">Log out(${sessionScope.account.username})</a>                      
        </div>
    </div>
            <h2> Lịch sử Lương Công nhân :${requestScope.name}</h2>
        <div class="talbe_salary">
        <form action="salarydetails" style="margin-left: 20px;">
                <table>               
                    <thead>
                    <tr>
                        <th>Lương</th>
                        <th>Thời gian thay đổi</th>
                   </tr>  
                    </thead>                   
                    <tbody>
                    <c:forEach items="${requestScope.rps}" var="rp">
                        <tr>
                            <td>${rp.formatSalary}/Ngày</td> 
                            <td>${rp.formatTime}</td>         
                        </tr>
                    </c:forEach>
                       </tbody>    
                </table>
            <br>

        </form>
            </div>
  
    <footer>
        <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
