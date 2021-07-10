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
        <title>Website Chấm Công</title>
        <link href="../css/common_css.css" rel="stylesheet" type="text/css"/>
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
                        txtValue =td.textContent || td.innerText;          
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            tr[i+1].style.display = "";
                        } else {   
                            txtValue= xoa_dau(txtValue);
                             if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            tr[i+1].style.display = "";
                        }
                        else{
                            tr[i].style.display = "none";
                            tr[i+1].style.display = "none";
                        }       
                    }
                }
            }
            }
        </script> 
        <link href="./css/userAttend.css" rel="stylesheet" type="text/css"/>
       

    </head>
    <body>

        <div class="header">
            <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
            <div class="header-right">
                <a href="user">Trang chủ</a>
                <a href="attendreport" class="active">Báo Cáo Điểm Danh</a>
                <a href="userdetails">Thông tin cá nhân</a>
                <a href="viewapplication">Xem Đơn</a>
                <a href="application">Báo Nghỉ</a>
                <a href="LogOutController">Log out(${sessionScope.congnhan.name})</a>           
            </div>
        </div>
        <br>
        <br>
        <form action="attendreport" id="congtrinh_list" method="POST">
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
        <c:if test="${requestScope.size ne 0 && requestScope.cts ne null}"> 
            <div align="center">  
                Tìm Kiếm:  <input type="text" name="search" id="search" onkeyup="myFunction()" />  
            </div>  
            <div class="chuthich">
                Đi làm:<input type="checkbox" checked onclick="return false;"/>  Không đi làm:<span class="note"></span>Chờ duyệt:<input type="checkbox" unchecked onclick="return false;"/>             
            </div> 
            <table class="table" border="1" id="congnhan_table">

                <tr class="header">

                    <td>Công Trình</td>
                    <td>Buổi</td>
                    <c:forEach items="${requestScope.listDay}" var="d">
                        <td >
                            ${d}/${requestScope.Month}
                        </td>
                    </c:forEach>
                    <td>Tổng</td>
                    <td >Tiền</td>

                </tr>   
                <c:forEach items="${requestScope.cts}"  var="c">
                    <tr>
                        <th rowspan="2" >${c.name}</th> 
                        <td>sáng</td>
                        <c:forEach items="${c.timekeeping}" var="t" begin="0" end="62" step="2">
                            <td>
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
                        <c:forEach items="${c.timekeeping}" var="t" begin="1" end="61" step="2" >
                            <td> <c:if test="${t eq -1}">    
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
                    <td>Tổng:</td>
                    <th colspan="${requestScope.totalday}"></th>
                    <th>${requestScope.count}</th>
                    <th>${requestScope.total}</th>
                </tr>
            </table>        
            <br>
        </c:if>
        <c:if test="${requestScope.size eq 0 || requestScope.cts eq null}"> 
            <p style="color:red">Không tìm thấy dữ liệu điểm danh của tháng này ! </p>
        </c:if>
    </form>
    <footer>
        <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>
</body>
</html> 
</body>
</html>
