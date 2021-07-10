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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="./css/common_css.css" rel="stylesheet" type="text/css"/>

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

                    <a href="LogOutController" class="btn btn-warning">Đăng Xuất(Công)</a>
                </div>
            </div>
        </div>
    </header>




    <c:if test="${requestScope.size ne 0}">
        <br>
        <h3>Xử Lí Đơn Từ <a style="margin-left:70%;margin-bottom:10px; color:black" href="applicationprocessed">Đơn đã xử lí</a> </h3>
        <form action="applicationprocessing" method="POST">     
                <table style="width:100%" >

                    <tr>
                        <th>ID</th>
                        <th>Họ Và Tên</th>
                        <th>Nội dung đơn</th>
                        <th>Thời gian gửi</th>
                        <th>Ghi Chú</th>
                        <th>Duyệt Đơn</th>
                    </tr>

                    <c:forEach items="${requestScope.apps}" var="a">
                        <tr>
                            <td>${a.congnhan.id}</td> 
                            <td>${a.congnhan.name}</td> 
                            <td><p style="width:500px;vertical-align: center;white-space: normal;word-break: break-all">${a.content}</p></td> 
                            <td>${a.dateSubmit}</td> 
                            <td><textarea name="note${a.id}" rows="4" cols="30"> </textarea></td>
                            <td style="text-align: center;"> 
                                Từ Chối:<input type="radio"  name="application${a.id}" value="no"/>
                                Châp Nhận:<input type="radio" name="application${a.id}" value="yes"/>     
                            </td>           
                        </tr>
                    </c:forEach>

                </table>
                <br>
                <input type="submit" value="Duyệt Đơn"> 
        </form>
    </c:if>
    <c:if test="${requestScope.apps eq null || requestScope.size eq 0}">
        <br>
        <br>
        <p style="color:green">Tất cả đơn từ đã được xử lí!</p>
    </c:if>


</body>
</html>
