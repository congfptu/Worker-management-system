<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
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
        
        <link href="./css/attend.css" rel="stylesheet" type="text/css"/>
                  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
<body>
   <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                 
                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home" class="nav-link px-2 text-secondary">Trang Chủ</a></li>
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
    <br>
    <section class="left">
        <ul>
            <h5>Công Trình Đang Thi Công </h5>
            <c:forEach items="${requestScope.cts}" var="ct" >
                <div class="dscongtrinh">
                    <li style="margin-top:50px"><a href="quanlicongtrinh?ct=${ct.id}&ctName=${ct.name}&time=${requestScope.date}&session=1">${ct.name}</a></li>    
                </div>
            </c:forEach>
        </ul>
    </section > 
<hr class="vertical" />
     <p style="color:green">${mess}</p>  
    <c:if test="${requestScope.ct ne null}">    
    <div class="right" id="list_cn">
            <form action="quanlicongtrinh" id="table_time" method="GET">   
                  <input type="hidden" name="ct" value="${requestScope.ct}">
                  <input type="hidden" name="ctName" value="${requestScope.ctName}">   
                  <h5>Công Trình:${requestScope.ctName}</h5>
                Chấm Công Ngày :
                <select name="time" onchange="submitForm()">
                    <c:forEach items="${requestScope.dates}" var="d">
                        <option value="${d}"
                                <c:if test="${d eq requestScope.time}">
                                    selected="selected"
                                </c:if>>
                            ${d}
                        </option>
                    </c:forEach>
                </select>
                Buổi: <select name="session" onchange="submitForm()">
                    <option value="1"  <c:if test="${requestScope.pid eq 1}">
                            selected="selected"
                        </c:if>> 
                        Sáng
                    </option >
                    <option value="2"  <c:if test="${requestScope.pid eq 2}">
                            selected="selected"
                        </c:if>> 
                        Chiều
                    </option>
                </select>  
            </form>
                <br>
            <div>
                <form action="quanlicongtrinh" method="POST">  
                    <input type="hidden" name="ct" value="${requestScope.ct}">
                    <input type="hidden" name="ctName" value="${requestScope.ctName}">
                    <input type="hidden" name="time" value="${requestScope.time}">
                    <input type="hidden" name="session" value="${requestScope.pid}">
                    <c:if test="${requestScope.cnSave eq null || requestScope.size eq 0 }">
                        <table border="1">
                            <tr>
                                <th width="200px">Họ Và Tên</th>
                                <th>Địa chỉ</th>
                                <th>Ngày Sinh</th>
                                <th>Giới Tính</th>
                                <th>Trạng Thái</th>
                            </tr>           
                            <c:forEach items="${requestScope.cns}" var="cn">
                                <tr>
                                    <th>${cn.name}</th>
                                    <th>${cn.address}</th>
                                    <th>${cn.formatDob}</th> 
                                    <th>
                                      ${cn.genderString}
                                        </th>
                                        <th> <input type="radio" checked="checked" name="attend${cn.id}" value="absent"/>Vắng Mặt
                                        <input type="radio" name="attend${cn.id}" value="present"/> Có Mặt</th>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>             
                    <c:if test="${requestScope.cnSave ne null && requestScope.size ne 0}">
                        <table border="1">
                            <tr>
                                <th width="200px">Họ Và Tên</th>
                                <th>Địa chỉ</th>
                                <th>Ngày Sinh</th>
                                <th>Giới Tính</th>
                                <th>Trạng Thái</th>
                            </tr>           
                            <c:forEach items="${requestScope.cnSave}" var="cns">
                                <tr>
                                    <th>${cns.name}</th>
                                    <th>${cns.address}</th>
                                    <th>${cns.dob}</th> 
                                    <th>
                                       ${cns.genderString}  
                                    </th>
                                    <th> <input type="radio" ${!cns.status?"checked=\"checked\"":""} checked="checked" name="attend${cns.id}" value="absent"/>Vắng Mặt
                                        <input type="radio" ${cns.status?"checked=\"checked\"":""} name="attend${cns.id}" value="present"/> Có Mặt</th>
                                </tr>
                            </c:forEach>

                        </table>                
                    </c:if>
                    
                    <input type="submit" value="Điểm Danh">
                </form>       
            </div>
             </div>
                    
        </c:if>         
    
        
   
</body>
</html>