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
      
       
        <script>
            function renderPager(id,pageindex,totalpage,gap)
{
    var container = document.getElementById(id);
    if(pageindex > gap + 1)
    {
        container.innerHTML += "<a href='applicationprocessed?page=1'>Đầu</a>"
    }
    
    for(var i= pageindex-gap; i< pageindex;i++)
    {
        if(i>=1)
        {
            container.innerHTML += "<a href='applicationprocessed?page="+i+"'>"+i+"</a>"
        }
    }
    
    container.innerHTML += "<span>"+pageindex+"</span>"
    
    for(var i= pageindex + 1; i <= pageindex + gap;i++)
    {
        if(i<= totalpage)
        {
            container.innerHTML += "<a href='applicationprocessed?page="+i+"'>"+i+"</a>"
        }
    }
    
    if(pageindex < totalpage - gap)
    {
        container.innerHTML += "<a href='applicationprocessed?page="+totalpage+"'>Cuối</a>"
    }
}
            </script>
  <link href="./css/common_css.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="header">
        <a href="#default" class="logo">Công Ty CP Thiết kế và Xây Dựng Hà Thành</a>
        <div class="header-right">
            <a href="home">Trang chủ</a>
            <a href="application">Báo Nghỉ</a>
            <a href="LogOutController">Log out(${sessionScope.account.username})</a>           
        </div>
    </div>
    <c:if test="${requestScope.size ne 0}">
        <form action="viewapplication"   style="margin-left: 20px;">
            <h2>Đơn đã được xử lí <a style="margin-left:60%;color: black;"href="applicationprocessing"> Đơn chưa xử lí</a></h2>    
                <table>               
                    <thead>
                    <tr>
                        <th>ID Công Nhân</th>
                        <th>Công Nhân</th>
                        <th>Nội dung đơn</th>
                        <th>Thời gian gửi</th>
                        <th>Ghi Chú</th>
                        <th>Trạng Thái</th>
                        <th>Thời gian duyệt</th>
                    </tr>  
                    </thead>            
                        
                    <tbody>
                    <c:forEach items="${requestScope.apps}" var="a">
                        <tr> 
                            <td style="text-align: center;">${a.congnhan.id}</td>
                            <td>${a.congnhan.name}</td>
                            <td><p style="width:350px;white-space: normal;word-wrap:break-word;">${a.content}</p></td> 
                            <td>${a.dateSubmit}</td> 
                            <td>${a.note}</td> 
                            <td>
                                <c:if test="${a.status eq -1}">
                                    <p style="color:blue;font-weight: bold">Đang xử lý</p>
                                </c:if>
                                <c:if test="${a.status eq 0}">
                                    <p style="color:red;font-weight: bold">Từ Chối</p>
                                </c:if>
                                <c:if test="${a.status eq 1}">
                                    <p style="color:green;font-weight: bold">Chấp thuận</p>
                                </c:if>
                            </td>
                            <td>${a.dateApproved} </td>           
                        </tr>
                    </c:forEach>
                       </tbody>    
                </table>
            <br>
                         <div id="bottomPagger" class="pagger"></div>
                         <script>
           renderPager("bottomPagger",${requestScope.pageindex},${requestScope.totalpage},2);
        </script>
         

        </form>
    </c:if>
    <c:if test="${requestScope.apps eq null || requestScope.size eq 0}">
        <h3 style="color:green"></h3>
    </c:if>

    <footer>
        <p>Author:CongFptu<br>
            <a href="https://www.facebook.com/kingg.coong/">Contact for Work</a></p>
    </footer>  
</body>
</html>
