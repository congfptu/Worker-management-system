<%-- 
    Document   : salary.jsp
    Created on : Mar 15, 2021, 10:42:43 PM
    Author     : congfptu
--%>

<%@page import="model.CongNhan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.TimeKeeping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website Chấm Công</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <link href="./css/salary.css" rel="stylesheet" type="text/css"/>

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

    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-body">
                    <h2 class="title">Cập Nhật Lương</h2>
                    <form action="changesalary" method="POST">
                        <div class="row row-space">
                           <div class="input-group">
                             
                               <select name="congnhan" style="padding:7px;" >
                                   <option disabled="disabled" selected="selected">Chọn Công Nhân</option>
                                    <c:forEach items="${requestScope.congnhan}" var="cn">
                                        <option value="${cn.id}">
                                            ${cn.name}
                                        </option>
                                    </c:forEach>
                                        <div class="select-dropdown"></div>
                                </select>
                            
                        </div>
                        <div class="row row-space">
                           <div class="input-group">
                              Nhập vào mức lương mới:
                            <input class="input--style-1" type="number" placeholder="Nhập số" name="salary">
                        </div>
                            </div>
                        <div class="row row-space">
                             <div class="input-group">
                                 Thời gian hiệu lực
                            <input class="input--style-1" type="date" placeholder="Thời gian hiệu lực" name="timechange">
                        </div>
                        </div>
                             
                           <input type="submit" value="Lưu" style="background-color:#00cc33;width: 50px;height:40px;border-radius: 4px;margin-left: 20px;">
                           <p style="color: green">${requestScope.message} </p>
                    
                    </form>
                </div>
            </div>
        </div>
    </div>
    

</body>
</html>
