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
        <h2>Bảng Lương Công nhân</h2>  
        <div>
            <form action="viewsalary" style="margin-left: 300px;">
                <table>               
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Công Nhân</th>
                            <th>Ngày Sinh</th>
                            <th>Địa chỉ</th>
                            <th>Giới Tính</th>
                            <th>Lương Hiện Tại</th>
                            <th>Chi tiét</th>
                        </tr>  
                    </thead>                   
                    <tbody>
                        <c:forEach items="${requestScope.cns}" var="cn">
                            <tr>
                                <td>${cn.id}</td> 
                                <td>${cn.name}</td> 
                                <td>${cn.formatDob}</td> 
                                <td>
                                    ${cn.address}
                                </td>
                                <td>
                                    <c:if test="${cn.gender}"> Nam</c:if>
                                    <c:if test="${!cn.gender}"> Nữ</c:if>
                                    </td>           
                                    <td>${cn.formatSalary}/Ngày</td>          
                                <td><a href="salarydetails?id=${cn.id}&&name=${cn.name}">Lịch sử thay đổi</a> </td>           
                            </tr>
                        </c:forEach>
                    </tbody>    
                </table>
                <br>

            </form>
        </div>

          
    </body>
</html>
