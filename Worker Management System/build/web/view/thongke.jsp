<%-- 
    Document   : thongke.jsp
    Created on : Mar 13, 2021, 11:12:38 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
        <title>Website Chấm Công</title>
        <script>
            function submitForm()
            {
                document.getElementById("congtrinh_list").submit();
            }
            function xoa_dau(str) {
                str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                str = str.replace(/đ/g, "d");
                str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
                str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
                str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
                str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
                str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
                str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
                str = str.replace(/Đ/g, "D");
                return str;
            }
            function myFunction() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("search");
                filter = input.value.toUpperCase();
                table = document.getElementById("congnhan_table");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("th")[0];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            tr[i + 1].style.display = "";
                        } else {
                            txtValue = xoa_dau(txtValue);
                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                                tr[i + 1].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                                tr[i + 1].style.display = "none";
                            }
                        }
                    }
                }
            }
        </script>        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="./css/thongke.css" rel="stylesheet" type="text/css"/>
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
   
        <br>
        <br>

        <form action="thongke" id="congtrinh_list" method="POST">
            Công Trình: <select name="congtrinh" onchange="submitForm()" >
                <c:forEach items="${requestScope.cts}" var="ct">
                    <option value="${ct.id}" <c:if test="${ct.id eq requestScope.congtrinhid}">
                            selected="selected"     
                        </c:if> >
                        ${ct.name}
                    </option> 
                </c:forEach>
            </select>
            Year: <select name="year" onchange="submitForm()">
                <c:forEach items="${requestScope.listYear}" var="y">
                    <option value="${y}"
                            <c:if test="${y eq requestScope.Year}">
                                selected="selected"     
                            </c:if> >
                        ${y}
                    </option> 
                </c:forEach>
                <br>
            </select>
            Month:  <select name="month" onchange="submitForm()">
                <c:forEach items="${requestScope.listMonth}" var="m">
                    <option value="${m}"  
                            <c:if test="${m eq requestScope.Month}">
                                selected="selected"     
                            </c:if> >
                        ${m}
                    </option>  
                </c:forEach>
            </select>
        </form>

        <c:if test="${requestScope.size ne 0 && requestScope.congnhans ne null}"> 
            <div align="center">  
                Tìm Kiếm:  <input type="text" name="search" id="search" onkeyup="myFunction()" />  
            </div>  
            <div class="chuthich">
                Đi làm:<input type="checkbox" checked onclick="return false;"/><br>  Không đi làm:<span class="note"></span>Chờ duyệt:<input type="checkbox" unchecked onclick="return false;"/>             
            </div> 
            <div class="table_application">
                <table class="table" border="1" id="congnhan_table">   

                    <tr class="head">  
                        <td>Họ Và Tên</td>
                        <td>Buổi</td>
                        <c:forEach items="${requestScope.listDay}" var="d">
                            <td >
                                ${d}/${requestScope.Month}
                            </td>
                        </c:forEach>
                        <td>Tổng</td>
                        <td >Thành Tiền</td>        
                    </tr> 

                    <div class="content">
                        <c:forEach items="${requestScope.congnhans}"  var="c">
                            <tr>    
                                <th class="name_cn" rowspan="2" >${c.name}</th> 
                                <td>sáng</td>
                                <c:forEach items="${c.timeKeeping}" var="t" begin="0" end="62" step="2">
                                    <td  style="text-align: center;">
                                        <c:if test="${t eq -1}">    
                                            <input type="checkbox" unchecked onclick="return false;"/>
                                        </c:if>
                                        <c:if test="${t eq 0}">
                                            <label class="container">
                                                <input type="checkbox" unchecked onclick="return false;"/>
                                                <span class="checkmark"></span>
                                            </label>  
                                        </c:if>
                                        <c:if test="${t eq 1}">
                                            <input type="checkbox" checked onclick="return false;"/>
                                        </c:if>
                                    </td>
                                </c:forEach>
                                <th rowspan="2">${c.tongcong}</th>
                                <th rowspan="2">${c.formatMoney}</th>
                            </tr>
                            <tr>
                                <td>chiều</td>
                                <c:forEach items="${c.timeKeeping}" var="t" begin="1" end="61" step="2" >
                                    <td style="text-align: center;"> <c:if test="${t eq -1}">    
                                            <input type="checkbox" unchecked onclick="return false;"/>
                                        </c:if>
                                        <c:if test="${t eq 0}">
                                            <label class="container">
                                                <input type="checkbox" unchecked onclick="return false;"/>
                                                <span class="checkmark"></span>
                                            </label>  
                                        </c:if>
                                        <c:if test="${t eq 1}">
                                            <input type="checkbox" checked onclick="return false;"/>
                                        </c:if></td>
                                    </c:forEach>                      
                            </tr>     
                        </c:forEach>
                        <tr>
                            <td style="padding:20px;">Tổng:</td>
                            <th colspan="${requestScope.totalday}"></th>
                            <th>${requestScope.count}</th>
                            <th>${requestScope.total}</th>
                        </tr>
                  </div>

                </table>        
            </div>
            <br>
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
        </c:if>
        <c:if test="${requestScope.size eq 0 || requestScope.congnhans eq null}"> 
            <p style="color:red">Không tìm thấy dữ liệu điểm danh của tháng này ! </p>
            <footer class="site-footer" style="position: absolute">
            <div class="container">
                <div class="row">
                    <p class="text-justify">Công ty cổ phần thiết kế và xây dựng Hà Thành. Chuyên tư vấn, thiết kế và xây dựng các công trình quy mô vừa và nhỏ.
                    Phần mềm quản lí và chấm công, đơn giản hóa quy trình chấm, thống kê, tính lương đem lại kết quả chính xác cũng như tính hiệu quả trong công việc</p>
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
        </c:if>
    </form>
   
</body>
</html> 
